
CREATE NONCLUSTERED INDEX [IX_Venta_CierreCaja] ON [dbo].[Venta]
(
	[CierreCajaId] ASC
)
INCLUDE ( 	[VentaId],
	[FechaVenta]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

CREATE NONCLUSTERED INDEX [IX_CierreCaja_Maxikiosco] ON [dbo].[CierreCaja]
(
	[MaxiKioskoId] ASC
)
INCLUDE ( 	[CierreCajaId]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
