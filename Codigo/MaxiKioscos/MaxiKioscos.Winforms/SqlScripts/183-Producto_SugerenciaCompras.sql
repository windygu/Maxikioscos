ALTER PROCEDURE [dbo].[Producto_SugerenciaCompras]
	@ProveedorId int,
	@CantidadDias int,
	@MaxiKioscoId int
AS
BEGIN
	DECLARE @Productos TABLE
	(
		ProductoId int,
		Ventas decimal
	)
		
	
	INSERT INTO @Productos (ProductoId, Ventas)
	SELECT VP.ProductoId,
		 ISNULL(SUM(Cantidad), 0)
	FROM VentaProducto VP
		INNER JOIN Venta V
			ON VP.VentaId = V.VentaId
		INNER JOIN Producto P
			ON VP.ProductoId = P.ProductoId
		INNER JOIN CierreCaja CC
			ON V.CierreCajaId = CC.CierreCajaId
	WHERE V.FechaVenta > DATEADD(MONTH, -3, GETDATE())
		AND CC.MaxiKioskoId = @MaxiKioscoId
		AND VP.ProductoId IN (SELECT ProductoId
								FROM ProveedorProducto
								WHERE ProveedorId = @ProveedorId)
								
	GROUP BY VP.ProductoId
	
	
	SELECT P.Descripcion,
		CantidadVendida = T.Ventas,
		CantidadRecomendada = CAST(CAST((CASE ISNULL(P.FactorAgrupamiento, 0)
								WHEN 0 THEN ROUND((@CantidadDias * T.Ventas) / 90, 0)
								ELSE ROUND(((@CantidadDias * T.Ventas) / 90) / P.FactorAgrupamiento, 0)
							  END) as int) as varchar(30)) + 
							  CASE ISNULL(P.FactorAgrupamiento, 0) WHEN 0 THEN ' unidades'
								ELSE ' bultos'
							END
	FROM @Productos T
		INNER JOIN Producto P
			ON T.ProductoId = P.ProductoId
	ORDER BY P.Descripcion
	
	
END
