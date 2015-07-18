/****** Object:  StoredProcedure [dbo].[Exportacion_NuevoXmlKiosco]    Script Date: 10/04/2014 18:02:51 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exportacion_NuevoXmlKiosco]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Exportacion_NuevoXmlKiosco]
GO


CREATE PROCEDURE [dbo].[Exportacion_NuevoXmlKiosco]
	@MaxiKioscoIdentifier uniqueidentifier,
	@UsuarioId int
AS
BEGIN
	DECLARE @Secuencia int
	SELECT @Secuencia = ISNULL(MAX(Secuencia) + 1, 1) FROM Exportacion
	
	DECLARE @MaxikioscoId int
	SELECT @MaxikioscoId = (SELECT TOP 1 MaxiKioscoId FROM MaxiKiosco WHERE Identifier = @MaxiKioscoIdentifier)
	
	DECLARE @CuentaId int
	SELECT @CuentaId = (SELECT TOP 1 CuentaId FROM MaxiKiosco WHERE MaxiKioscoId = @MaxikioscoId)	
	
	DECLARE @ExportacionId int
	SET @ExportacionId = 0
	
	DECLARE @XML XML
	
	BEGIN TRY
    BEGIN TRAN
		--OBTENGO EL XML
		SET @XML = (
		SELECT
		(SELECT CC.*, UsuarioIdentifier = U.Identifier, MaxiKioscoIdentifier = M.Identifier
		 FROM CierreCaja CC
	      INNER JOIN Usuario U ON CC.UsuarioId = U.UsuarioId
	      INNER JOIN MaxiKiosco M ON CC.MaxiKioskoId = M.MaxiKioscoId
		  WHERE CC.Desincronizado = 1 
				AND M.Identifier = @MaxiKioscoIdentifier FOR XML AUTO, ELEMENTS, ROOT('CierresCaja'), TYPE),
		(SELECT E.*, CierreCajaIdentifier = CC.Identifier
		 FROM Excepcion E
	      INNER JOIN CierreCaja CC ON E.CierreCajaId = CC.CierreCajaId
		  WHERE E.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('Excepciones'), TYPE),
		(SELECT OC.*, CierreCajaIdentifier = CC.Identifier,
			UsuarioCreadorIdentifier = UC.Identifier, UsuarioModificacionIdentifier = UM.Identifier
		 FROM OperacionCaja OC
	      INNER JOIN CierreCaja CC ON OC.CierreCajaId = CC.CierreCajaId
	      INNER JOIN Usuario UC ON OC.UsuarioCreadorId = UC.UsuarioId
	      INNER JOIN Usuario UM ON OC.UltimoUsuarioModificacionId = UM.UsuarioId
		  WHERE OC.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('OperacionesCaja'), TYPE),
		(SELECT P.*, MarcaIdentifier = M.Identifier, RubroIdentifier = R.Identifier, CuentaIdentifier = C.Identifier  
			FROM Producto P
			LEFT JOIN Marca M ON P.MarcaId = M.MarcaId
			LEFT JOIN Rubro R ON P.RubroId = R.RubroId
			LEFT JOIN Cuenta C ON P.CuentaId = C.CuentaId
			WHERE P.Desincronizado = 1	FOR XML RAW('Producto'), ELEMENTS, ROOT('Productos'), TYPE),
		(SELECT CP.*, ProductoIdentifier = P.Identifier FROM CodigoProducto CP
		 INNER JOIN Producto P ON CP.ProductoId = P.ProductoId
		 WHERE CP.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('CodigosProducto'), TYPE),		
		(SELECT C.*, FacturaIdentifier = F.Identifier, 
				CuentaIdentifier = CU.Identifier, MaxiKioscoIdentifier = M.Identifier
		FROM Compra C
			INNER JOIN Factura F ON C.FacturaId = F.FacturaId
			INNER JOIN Cuenta CU ON C.CuentaId = CU.CuentaId
			INNER JOIN MaxiKiosco M ON C.MaxiKioscoId = M.MaxiKioscoId 
			WHERE C.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('Compras'), TYPE),		
		(SELECT CP.*, CompraIdentifier = C.Identifier ,
			ProductoIdentifier = P.Identifier
		FROM CompraProducto CP 
		 INNER JOIN Compra C ON CP.CompraId = C.CompraId
		 INNER JOIN Producto P ON CP.ProductoId = P.ProductoId
		 WHERE C.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('CompraProductos'), TYPE),
		(SELECT CS.*, ProductoIdentifier = P.Identifier, MaxiKioscoIdentifier = M.Identifier
		 FROM CorreccionStock CS
			INNER JOIN Producto P ON CS.ProductoId = P.ProductoId
			INNER JOIN MaxiKiosco M ON CS.MaxiKioscoId = M.MaxiKioscoId
		 WHERE CS.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('CorreccionesStock'), TYPE),
		 (SELECT ST.*, StockIdentifier = S.Identifier
		 FROM StockTransaccion ST
			INNER JOIN Stock S ON ST.StockId = S.StockId
		 WHERE ST.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('StockTransacciones'), TYPE),
		(SELECT PP.*, ProveedorIdentifier = PROV.Identifier, ProductoIdentifier = PROD.Identifier  
		 FROM ProveedorProducto PP
			INNER JOIN Proveedor PROV ON PP.ProveedorId = PROV.ProveedorId
			INNER JOIN Producto PROD ON PP.ProductoId = PROD.ProductoId
		 WHERE PP.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('ProveedorProductos'), TYPE),
		
		(SELECT S.*, MaxiKioscoIdentifier = M.Identifier, ProductoIdentifier = P.Identifier
		 FROM Stock S
			INNER JOIN Producto P
				ON S.ProductoId = P.ProductoId
			INNER JOIN MaxiKiosco M
				ON S.MaxiKioscoId = M.MaxiKioscoId
		 WHERE S.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('Stock'), TYPE),
		(SELECT M.*, CuentaIdentifier = C.Identifier
			FROM MaxiKiosco M
				INNER JOIN Cuenta C ON M.CuentaId = C.CuentaId
			WHERE M.Identifier = @MaxiKioscoIdentifier 
			FOR XML AUTO, ELEMENTS, ROOT('MaxiKioscos'), TYPE),
		 (SELECT F.*, ProveedorIdentifier = P.Identifier,
			MaxiKioscoIdentifier = M.Identifier, CierreCajaIdentifier = CC.Identifier
		  FROM Factura F 
			INNER JOIN Proveedor P ON F.ProveedorId = P.ProveedorId
			INNER JOIN MaxiKiosco M ON F.MaxiKioscoId = M.MaxiKioscoId
			LEFT JOIN CierreCaja CC ON F.CierreCajaId = CC.CierreCajaId
		  WHERE F.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('Facturas'), TYPE),
		(SELECT V.*, CierreCajaIdentifier = CC.Identifier
		  FROM Venta V 
			LEFT JOIN CierreCaja CC ON V.CierreCajaId = CC.CierreCajaId
		  WHERE V.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('Ventas'), TYPE),
		(SELECT VP.*, VentaIdentifier = V.Identifier, ProductoIdentifier = P.Identifier
		  FROM VentaProducto VP 
			INNER JOIN Venta V ON VP.VentaId = V.VentaId
			INNER JOIN Producto P ON VP.ProductoId = P.ProductoId
		  WHERE VP.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('VentasProductos'), TYPE),
		(SELECT RB.*, CierreCajaIdentifier = CC.Identifier
		  FROM RecuentoBillete RB
			LEFT JOIN CierreCaja CC ON RB.CierreCajaId = CC.CierreCajaId
		  WHERE RB.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('RecuentoBilletes'), TYPE),
		(SELECT CS.*, ProveedorIdentifier = P.Identifier, RubroIdentifier = R.Identifier,
				MaxiKioscoIdentifier = M.Identifier, UsuarioIdentifier = U.Identifier
		  FROM ControlStock CS 
			LEFT JOIN Proveedor P ON CS.ProveedorId = P.ProveedorId
			LEFT JOIN Rubro R ON CS.RubroId = R.RubroId
			LEFT JOIN MaxiKiosco M ON CS.MaxiKioscoId = M.MaxiKioscoId
			LEFT JOIN Usuario U ON CS.UsuarioId = U.UsuarioId
		  WHERE CS.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('ControlesStock'), TYPE),
		(SELECT CSD.*, ControlStockIdentifier = CS.Identifier,
						StockIdentifier = S.Identifier
		  FROM ControlStockDetalle CSD 
			LEFT JOIN ControlStock CS ON CSD.ControlStockId = CS.ControlStockId
			LEFT JOIN Stock S ON CSD.StockId = S.StockId
		  WHERE CSD.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('ControlStockDetalles'), TYPE),
		(SELECT M.*, UsuarioIdentifier = U.Identifier
		 FROM webpages_Membership M 
		 INNER JOIN Usuario U ON M.UserId = U.UsuarioId
		 WHERE U.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('Membership'), TYPE)
		
		FOR XML PATH(''), ROOT('Exportacion'))
		
		--RESETEO LOS BIT DESINCRONIZADOS
		UPDATE CodigoProducto SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Compra SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE CompraProducto SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE CorreccionStock SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE StockTransaccion SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Producto SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE ProveedorProducto SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Stock SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE MaxiKiosco SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Factura SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE CierreCaja SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Excepcion SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE OperacionCaja SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Venta SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE VentaProducto SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE RecuentoBillete SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE ControlStock SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE ControlStockDetalle SET Desincronizado = 0 WHERE Desincronizado = 1
		--INSERTAMOS EL NUEVO XML
		INSERT INTO Exportacion(Secuencia, Fecha, CreadorId, CuentaId, Archivo, Eliminado, 
								FechaUltimaModificacion, Desincronizado, Acusada)
		VALUES (@Secuencia, GETDATE(), @UsuarioId, @CuentaId, @XML, 0, GETDATE(), 1, 0)
	
	COMMIT TRAN
	
	SET @ExportacionId = CONVERT(INT,SCOPE_IDENTITY())
	SELECT @ExportacionId AS ExportacionId
	
	END TRY
	
	BEGIN CATCH
    
    IF @@TRANCOUNT > 0 ROLLBACK

    SELECT 0 AS ExportacionId
	
    /*************************************
    *  Return from the Stored Procedure
    *************************************/
    RETURN 0                               -- =0 if success,  <>0 if failure

END CATCH
	
	
	
END







GO


