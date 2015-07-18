/****** Object:  StoredProcedure [dbo].[Rpt_CierresDeCajaDetalle]    Script Date: 11/08/2014 16:26:47 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Rpt_CierresDeCajaDetalle]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Rpt_CierresDeCajaDetalle]
GO

CREATE PROCEDURE [dbo].[Rpt_CierresDeCajaDetalle]
	@Desde datetime2(7),
	@Hasta datetime2(7),
	@MaxiKioscoId int,
	@UsuarioId int,
	@CuentaId int
AS
BEGIN
	SELECT
	   MaxiKioscoNombre = M.Nombre
	  ,MaxiKioscoDireccion = M.Direccion
	  ,UsuarioNombre = U.Nombre 
	  ,UsuarioApellido = U.Apellido
	  ,Fecha = CC.FechaInicio
	  ,Inicial = CC.CajaInicial
	  ,Ventas = V.Monto
	  ,Compras = C.Monto
	  ,Ingresos = OPCR.Monto
	  ,Excepciones = EX.Monto
	  ,Retiros = OPCE.Monto
	  ,Diferencia = CC.Diferencia
	  ,Cierre = CC.CajaFinal
	 
	FROM
	  CierreCaja CC
	  LEFT JOIN OperacionCaja OPC
		ON CC.CierreCajaId = OPC.CierreCajaId
	  LEFT JOIN MaxiKiosco M
		ON CC.MaxiKioskoId = M.MaxiKioscoId
	  LEFT JOIN Usuario U 
		ON CC.UsuarioId = U.UsuarioId
	  CROSS APPLY (SELECT Monto = SUM(V.ImporteTotal) 
				   FROM Venta V 
				   WHERE V.CierreCajaId = CC.CierreCajaid) V
	  --CROSS APPLY (SELECT Monto = SUM(CP.Cantidad * CP.CostoActualizado) 
			--	   FROM Compra C
			--	   INNER JOIN CompraProducto CP 
			--	   ON C.CompraId = CP.CompraId
			--	   WHERE C.Fecha >= CC.FechaInicio AND C.Fecha <= CC.FechaFin
			--	   AND C.Eliminado = 0) C
	  CROSS APPLY (SELECT Monto = SUM(F.ImporteFinal) 
				   FROM Factura F
				   WHERE F.CierreCajaId = CC.CierreCajaId
				   AND F.Eliminado = 0) C
	  CROSS APPLY (SELECT Monto = SUM(OPC.Monto) 
				   FROM OperacionCaja OPC 
				   WHERE OPC.CierreCajaId = CC.CierreCajaid
				   --MotivoId = 1 Refuerzo
				   AND OPC.MotivoId = 1
				   AND OPC.Eliminado = 0) OPCR
	  CROSS APPLY (SELECT Monto = SUM(OPC.Monto) 
				   FROM OperacionCaja OPC 
				   WHERE OPC.CierreCajaId = CC.CierreCajaid
				   --MotivoId = 2 Extracción
				   AND OPC.MotivoId = 2
				   AND OPC.Eliminado = 0) OPCE
	  CROSS APPLY (SELECT Monto = SUM(EX.Importe) 
				   FROM Excepcion EX 
				   WHERE EX.CierreCajaId = CC.CierreCajaid
				   AND EX.Eliminado = 0) EX
							
	 WHERE 
	        (@Desde IS NULL OR CC.FechaInicio >= @Desde)
		AND (@Hasta IS NULL OR CC.FechaInicio <= @Hasta)
		AND (@MaxiKioscoId IS NULL OR CC.MaxiKioskoId = @MaxiKioscoId)
		AND (@UsuarioId IS NULL OR CC.UsuarioId = @UsuarioId)
		AND (@CuentaId IS NULL OR M.CuentaId = @CuentaId)
	
END


GO


