/****** Object:  StoredProcedure [dbo].[Exportacion_NuevoXmlPrincipal]    Script Date: 10/04/2014 12:58:18 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Exportacion_NuevoXmlPrincipal]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Exportacion_NuevoXmlPrincipal]
GO


CREATE PROCEDURE [dbo].[Exportacion_NuevoXmlPrincipal]
	@UsuarioId int
AS
BEGIN
	DECLARE @Secuencia int
	SELECT @Secuencia = ISNULL(MAX(Secuencia) + 1, 1) FROM Exportacion
	
	DECLARE @CuentaId int
	SELECT @CuentaId = (SELECT TOP 1 CuentaId FROM Usuario WHERE UsuarioId = @UsuarioId)	
	
	DECLARE @ExportacionId int
	SET @ExportacionId = 0
	
	DECLARE @XML XML
	
	BEGIN TRY
    BEGIN TRAN
		--OBTENGO EL XML
		SET @XML = (
		SELECT
		(SELECT R.*, CuentaIdentifier = C.Identifier
		 FROM Rubro R
	      INNER JOIN Cuenta C ON R.CuentaId = C.CuentaId
		  WHERE R.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('Rubros'), TYPE),
		(SELECT M.*, CuentaIdentifier = C.Identifier 
		 FROM Marca M
		 INNER JOIN Cuenta C ON M.CuentaId = C.CuentaId 
		 WHERE M.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('Marcas'), TYPE),
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
		(SELECT * FROM Cuenta WHERE Desincronizado = 1	FOR XML AUTO, ELEMENTS, ROOT('Cuentas'), TYPE),		
		(SELECT ER.*, RubroIdentifier = R.Identifier, MaxiKioscoIdentifier = M.Identifier 
		 FROM ExcepcionRubro ER
		  INNER JOIN Rubro R ON ER.RubroId = R.RubroId
		  INNER JOIN MaxiKiosco M ON ER.MaxiKioscoId = M.MaxiKioscoId
		  WHERE ER.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('ExcepcionesRubros'), TYPE),	
		(SELECT MT.*, MaxiKioscoIdentifier = M.Identifier 
		 FROM MaxiKioscoTurno MT
			INNER JOIN MaxiKiosco M ON MT.MaxiKioscoId = M.MaxiKioscoId
		 WHERE MT.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('MaxiKioscoTurnos'), TYPE),
		(SELECT P.*, CuentaIdentifier = C.Identifier 
		 FROM Proveedor P
		 INNER JOIN Cuenta C ON P.CuentaId = C.CuentaId
		 WHERE P.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('Proveedores'), TYPE),
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
		  WHERE CSD.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('ContrlStockDetalles'), TYPE),
		(SELECT U.*, CuentaIdentifier = C.Identifier 
		 FROM Usuario U
			INNER JOIN Cuenta C ON U.CuentaId = C.CuentaId
		 WHERE U.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('Usuario'), TYPE),
		 (SELECT M.*, CuentaIdentifier = C.Identifier
			FROM MaxiKiosco M
				INNER JOIN Cuenta C ON M.CuentaId = C.CuentaId
			WHERE M.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('MaxiKioscos'), TYPE),
		(SELECT UM.*, 
				M.Identifier MaxiKioscoIdentifier,
				U.Identifier UsuarioIdentifier
			FROM UsuarioMaxiKiosco  UM
				INNER JOIN Usuario U ON UM.UsuarioId = U.UsuarioId
				INNER JOIN MaxiKiosco M ON UM.MaxiKioscoId = M.MaxiKioscoId
			WHERE UM.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('UsuarioMaxiKioscos'), TYPE),
		(SELECT UP.*, 
				P.Identifier ProveedorIdentifier,
				U.Identifier UsuarioIdentifier
			FROM UsuarioProveedor UP
				INNER JOIN Usuario U ON UP.UsuarioId = U.UsuarioId
				INNER JOIN Proveedor P ON UP.ProveedorId = P.ProveedorId
			WHERE UP.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('UsuarioProveedores'), TYPE),
		(SELECT M.*, UsuarioIdentifier = U.Identifier 
		 FROM webpages_Membership M 
		 INNER JOIN Usuario U ON M.UserId = U.UsuarioId
		 WHERE U.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('Membership'), TYPE),		 
		 (SELECT UR.*, UsuarioIdentifier = U.Identifier 
		 FROM webpages_UsersInRoles UR 
		 INNER JOIN Usuario U ON UR.UserId = U.UsuarioId
		 WHERE U.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('UsersInRoles'), TYPE),
		 (SELECT F.*, ProveedorIdentifier = P.Identifier,
			MaxiKioscoIdentifier = M.Identifier, CierreCajaIdentifier = CC.Identifier
		  FROM Factura F 
			INNER JOIN Proveedor P ON F.ProveedorId = P.ProveedorId
			INNER JOIN MaxiKiosco M ON F.MaxiKioscoId = M.MaxiKioscoId
			LEFT JOIN CierreCaja CC ON F.CierreCajaId = CC.CierreCajaId
		  WHERE F.Desincronizado = 1 FOR XML AUTO, ELEMENTS, ROOT('Facturas'), TYPE)
		
		FOR XML PATH(''), ROOT('Exportacion'))
		
		--RESETEO LOS BIT DESINCRONIZADOS
		UPDATE CodigoProducto SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Compra SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE CompraProducto SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE CorreccionStock SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE StockTransaccion SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Cuenta SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE ExcepcionRubro SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Marca SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE MaxiKioscoTurno SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Producto SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Proveedor SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE ProveedorProducto SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Rubro SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Stock SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Usuario SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE MaxiKiosco SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE UsuarioMaxiKiosco SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE UsuarioProveedor SET Desincronizado = 0 WHERE Desincronizado = 1
		UPDATE Factura SET Desincronizado = 0 WHERE Desincronizado = 1
		--INSERTAMOS EL NUEVO XML
		INSERT INTO Exportacion(Secuencia, Fecha, CreadorId, CuentaId, Archivo, Eliminado, 
								FechaUltimaModificacion, Desincronizado, Acusada)
		VALUES (@Secuencia, GETDATE(), @UsuarioId, @CuentaId, @XML, 0, GETDATE(), 1, 0)
		SET @ExportacionId = CONVERT(INT,SCOPE_IDENTITY())
	COMMIT TRAN
	
	
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


