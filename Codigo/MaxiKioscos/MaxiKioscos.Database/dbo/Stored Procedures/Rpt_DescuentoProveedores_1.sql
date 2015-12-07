﻿


CREATE PROCEDURE [dbo].[Rpt_DescuentoProveedores]
	@Desde datetime2(7) = NULL,
	@Hasta datetime2(7)= NULL,
	@ProveedorId int = null,
	@CuentaId int
AS
BEGIN
	SELECT P.Nombre,
			F.Fecha,
		    F.ImporteTotal,
		    DescuentoEnPesos = ABS(C.Descuento)
	FROM Compra C
		INNER JOIN Factura F
			ON C.FacturaId = F.FacturaId
		INNER JOIN Proveedor P
			ON F.ProveedorId = P.ProveedorId
	WHERE (@Desde IS NULL OR F.Fecha >= @Desde)
		AND (@Hasta IS NULL OR F.Fecha <= @Hasta)
		AND (P.CuentaId = @CuentaId)
		AND (@ProveedorId IS NULL OR @ProveedorId = P.ProveedorId)
		AND (C.Descuento IS NOT NULL AND C.Descuento <> 0)
	ORDER BY P.Nombre
			
END

