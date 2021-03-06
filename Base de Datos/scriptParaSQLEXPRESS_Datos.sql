USE [MaxiKioscos]
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[webpages_Roles] ON
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (1, N'Administrador')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (3, N'Encargado')
INSERT [dbo].[webpages_Roles] ([RoleId], [RoleName]) VALUES (2, N'Operador')
SET IDENTITY_INSERT [dbo].[webpages_Roles] OFF
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 05/07/2014 23:27:54 ******/
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 05/07/2014 23:27:54 ******/
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(0x0000A2F400F38902 AS DateTime), NULL, 1, CAST(0x0000A2F500247660 AS DateTime), 0, N'AA9EaQIJGWzLe3zcKOt5if5YP6fb8MJnqjr11AmFwehp26rHZDHaBNR634OzcpqVYQ==', CAST(0x0000A2F400F38902 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (2, CAST(0x0000A30A015EC79C AS DateTime), NULL, 1, NULL, 0, N'AEHdd/5IE7hVBlZL4nMDYmBlAznJwtwEbpQ6ifSjkv5ERVvk1Gu/tbWS1tjmW5cdvg==', CAST(0x0000A30A015EC79C AS DateTime), N'', NULL, NULL)
/****** Object:  Table [dbo].[Turno]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Turno] ON
INSERT [dbo].[Turno] ([TurnoId], [Descripcion], [Desde], [Hasta]) VALUES (1, N'Mañana', CAST(0x00BC700000000000 AS Time), CAST(0x00C0A80000000000 AS Time))
INSERT [dbo].[Turno] ([TurnoId], [Descripcion], [Desde], [Hasta]) VALUES (2, N'Siesta', CAST(0x00FCA80000000000 AS Time), CAST(0x0000E10000000000 AS Time))
INSERT [dbo].[Turno] ([TurnoId], [Descripcion], [Desde], [Hasta]) VALUES (3, N'Tarde', CAST(0x003CE10000000000 AS Time), CAST(0x0040190100000000 AS Time))
INSERT [dbo].[Turno] ([TurnoId], [Descripcion], [Desde], [Hasta]) VALUES (4, N'Noche', CAST(0x007C190100000000 AS Time), CAST(0x0000000000000000 AS Time))
INSERT [dbo].[Turno] ([TurnoId], [Descripcion], [Desde], [Hasta]) VALUES (5, N'Tarde', CAST(0x003C000000000000 AS Time), CAST(0x0080700000000000 AS Time))
SET IDENTITY_INSERT [dbo].[Turno] OFF
/****** Object:  Table [dbo].[TipoCuit]    Script Date: 05/07/2014 23:27:54 ******/
INSERT [dbo].[TipoCuit] ([TipoCuitId], [Descripcion], [FechaUltimaModificacion], [Eliminado], [Desincronizado]) VALUES (1, N'Consumidor Final', NULL, 0, 0)
INSERT [dbo].[TipoCuit] ([TipoCuitId], [Descripcion], [FechaUltimaModificacion], [Eliminado], [Desincronizado]) VALUES (2, N'Resp. Inscripto', NULL, 0, 0)
INSERT [dbo].[TipoCuit] ([TipoCuitId], [Descripcion], [FechaUltimaModificacion], [Eliminado], [Desincronizado]) VALUES (3, N'Resp. No Inscripto', NULL, 0, 0)
INSERT [dbo].[TipoCuit] ([TipoCuitId], [Descripcion], [FechaUltimaModificacion], [Eliminado], [Desincronizado]) VALUES (4, N'No Responsable', NULL, 0, 0)
INSERT [dbo].[TipoCuit] ([TipoCuitId], [Descripcion], [FechaUltimaModificacion], [Eliminado], [Desincronizado]) VALUES (5, N'Excento', NULL, 0, 0)
INSERT [dbo].[TipoCuit] ([TipoCuitId], [Descripcion], [FechaUltimaModificacion], [Eliminado], [Desincronizado]) VALUES (6, N'Monotributista', NULL, 0, 0)
INSERT [dbo].[TipoCuit] ([TipoCuitId], [Descripcion], [FechaUltimaModificacion], [Eliminado], [Desincronizado]) VALUES (7, N'Resp. No Insc. N.I.', NULL, 0, 0)
/****** Object:  Table [dbo].[StockTransaccionTipo]    Script Date: 05/07/2014 23:27:54 ******/
INSERT [dbo].[StockTransaccionTipo] ([StockTransaccionTipoId], [Nombre]) VALUES (1, N'Venta')
INSERT [dbo].[StockTransaccionTipo] ([StockTransaccionTipoId], [Nombre]) VALUES (2, N'Compra')
INSERT [dbo].[StockTransaccionTipo] ([StockTransaccionTipoId], [Nombre]) VALUES (3, N'Corrección')
/****** Object:  Table [dbo].[MotivoOperacionCaja]    Script Date: 05/07/2014 23:27:54 ******/
INSERT [dbo].[MotivoOperacionCaja] ([MotivoOperacionCajaId], [Descripcion], [FechaUltimaModificacion], [Eliminado], [Desincronizado], [SumarACierreCaja]) VALUES (1, N'Refuerzo', NULL, 0, 1, 1)
INSERT [dbo].[MotivoOperacionCaja] ([MotivoOperacionCajaId], [Descripcion], [FechaUltimaModificacion], [Eliminado], [Desincronizado], [SumarACierreCaja]) VALUES (2, N'Extracción', NULL, 0, 1, 0)
/****** Object:  Table [dbo].[MotivoCorreccion]    Script Date: 05/07/2014 23:27:54 ******/
INSERT [dbo].[MotivoCorreccion] ([MotivoCorreccionId], [Descripcion]) VALUES (1, N'Pérdida')
INSERT [dbo].[MotivoCorreccion] ([MotivoCorreccionId], [Descripcion]) VALUES (2, N'Vencimiento')
INSERT [dbo].[MotivoCorreccion] ([MotivoCorreccionId], [Descripcion]) VALUES (3, N'Mercadería Dañada')
/****** Object:  Table [dbo].[Provincia]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Provincia] ON
INSERT [dbo].[Provincia] ([ProvinciaId], [Descripcion], [FechaUltimaModificacion], [Eliminado], [Desincronizado]) VALUES (1, N'Corrientes', NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Provincia] OFF
/****** Object:  Table [dbo].[Cuenta]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Cuenta] ON
INSERT [dbo].[Cuenta] ([CuentaId], [Titular], [Identifier], [FechaUltimaModificacion], [Eliminado], [MargenImporteFactura], [Desincronizado]) VALUES (1, N'Matías Gancio', N'816c81c3-c895-40da-b3b6-c24e8d3529de', NULL, 0, 500.0000, 1)
SET IDENTITY_INSERT [dbo].[Cuenta] OFF
/****** Object:  Table [dbo].[MaxiKiosco]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[MaxiKiosco] ON
INSERT [dbo].[MaxiKiosco] ([MaxiKioscoId], [Identifier], [Nombre], [Direccion], [Telefono], [CuentaId], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [UltimaSecuenciaExportacion]) VALUES (1, N'f3f9d8a2-acac-4508-9767-372762c54244', N'Maipú', N'Maipú 2351', N'4454654', 1, 0, NULL, 0, NULL)
INSERT [dbo].[MaxiKiosco] ([MaxiKioscoId], [Identifier], [Nombre], [Direccion], [Telefono], [CuentaId], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [UltimaSecuenciaExportacion]) VALUES (2, N'062747eb-d452-4886-9adc-7d052820a434', N'Irigoyen Y Brasil', N'Irigoyen 1231', N'4434234', 1, 1, CAST(0x078EEF45618E79380B AS DateTime2), 0, NULL)
SET IDENTITY_INSERT [dbo].[MaxiKiosco] OFF
/****** Object:  Table [dbo].[Marca]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Marca] ON
INSERT [dbo].[Marca] ([MarcaId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId]) VALUES (1, N'1715b534-7c86-4df9-aa90-89908eb44da3', N'Coca Cola', 0, NULL, 0, 1)
INSERT [dbo].[Marca] ([MarcaId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId]) VALUES (2, N'1c97b706-3000-4110-b398-ff431c29f749', N'Bagley', 1, CAST(0x07DACF30BE8053380B AS DateTime2), 1, 1)
INSERT [dbo].[Marca] ([MarcaId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId]) VALUES (3, N'8fca3bf3-d9e5-4014-9eaf-64834bad6a98', N'Pernochichi', 1, CAST(0x07E1B3196E8353380B AS DateTime2), 1, 1)
INSERT [dbo].[Marca] ([MarcaId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId]) VALUES (4, N'effc912f-a9bf-4bff-8505-3acd36915e3e', N'Los cabrales', 1, CAST(0x07E92988228153380B AS DateTime2), 0, 1)
INSERT [dbo].[Marca] ([MarcaId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId]) VALUES (5, N'213ad5d1-af24-48c3-9ac9-02fad6dfed30', N'Arcor', 1, CAST(0x0782206B897F71380B AS DateTime2), 0, 1)
SET IDENTITY_INSERT [dbo].[Marca] OFF
/****** Object:  Table [dbo].[Localidad]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Localidad] ON
INSERT [dbo].[Localidad] ([LocalidadId], [Descripcion], [ProvinciaId], [CodigoPostal], [FechaUltimaModificacion], [Eliminado], [Desincronizado]) VALUES (1, N'Corrientes', 1, N'3400', NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[Localidad] OFF
/****** Object:  Table [dbo].[Rubro]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Rubro] ON
INSERT [dbo].[Rubro] ([RubroId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [NoFacturar]) VALUES (1, N'bb710307-9c3d-4564-bcca-7e00ad094ec3', N'Bebidas Alcohólicas', 0, NULL, 0, 1, 1)
INSERT [dbo].[Rubro] ([RubroId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [NoFacturar]) VALUES (2, N'11559d50-fac1-4ef2-b9cf-294bef6064b3', N'Limpieza', 0, NULL, 0, 1, 1)
INSERT [dbo].[Rubro] ([RubroId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [NoFacturar]) VALUES (3, N'6787f9b1-d903-41db-9627-92d8c37f5054', N'Golosinas', 0, NULL, 0, 1, 1)
INSERT [dbo].[Rubro] ([RubroId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [NoFacturar]) VALUES (4, N'b3104165-3e39-444f-91b7-09678f6ea301', N'Lacteos', 1, CAST(0x073C31EB977F71380B AS DateTime2), 0, 1, 1)
INSERT [dbo].[Rubro] ([RubroId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [NoFacturar]) VALUES (5, N'25d87967-7430-4a86-b15f-58e487e681d6', N'Alimentos', 1, CAST(0x072225B6A07F71380B AS DateTime2), 0, 1, 1)
INSERT [dbo].[Rubro] ([RubroId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [NoFacturar]) VALUES (6, N'73a3ef30-db0c-4c10-a0e9-d182e97d9f6f', N'Alimentos', 1, CAST(0x07F13ADE028071380B AS DateTime2), 1, 1, 1)
INSERT [dbo].[Rubro] ([RubroId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [NoFacturar]) VALUES (7, N'ee0a5d99-3059-491c-b7b7-b1bf338cd40e', N'Alim', 1, CAST(0x070E1CCC008071380B AS DateTime2), 1, 1, 1)
INSERT [dbo].[Rubro] ([RubroId], [Identifier], [Descripcion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [NoFacturar]) VALUES (8, N'c3fbd581-7c34-4c54-b041-8f8095128d5b', N'Alimentos', 1, CAST(0x07719337FF7F71380B AS DateTime2), 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Rubro] OFF
/****** Object:  Table [dbo].[Usuario]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Usuario] ON
INSERT [dbo].[Usuario] ([UsuarioId], [NombreUsuario], [CuentaId], [Nombre], [Apellido], [Identifier], [FechaUltimaModificacion], [Eliminado], [Desincronizado]) VALUES (1, N'admin', 1, N'Juan', N'Rossi', N'64e38a0c-c4aa-414b-92d2-0d2f594323ca', CAST(0x07D0655620C44F380B AS DateTime2), 0, 0)
INSERT [dbo].[Usuario] ([UsuarioId], [NombreUsuario], [CuentaId], [Nombre], [Apellido], [Identifier], [FechaUltimaModificacion], [Eliminado], [Desincronizado]) VALUES (2, N'tromps', 1, N'Juan Pablo', N'Rossi', N'cfe3bb31-3927-455c-9983-cfb79dbcdf2c', NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 05/07/2014 23:27:54 ******/
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[webpages_UsersInRoles] ([UserId], [RoleId]) VALUES (2, 2)
/****** Object:  Table [dbo].[UsuarioMaxiKiosco]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[UsuarioMaxiKiosco] ON
INSERT [dbo].[UsuarioMaxiKiosco] ([UsuarioMaxiKioscoId], [UsuarioId], [MaxiKioscoId], [Desincronizado], [Eliminado], [FechaUltimaModificacion]) VALUES (1, 2, 1, 1, 0, CAST(0x07002F5B459965380B AS DateTime2))
INSERT [dbo].[UsuarioMaxiKiosco] ([UsuarioMaxiKioscoId], [UsuarioId], [MaxiKioscoId], [Desincronizado], [Eliminado], [FechaUltimaModificacion]) VALUES (2, 2, 2, 1, 0, CAST(0x07002F5B459965380B AS DateTime2))
SET IDENTITY_INSERT [dbo].[UsuarioMaxiKiosco] OFF
/****** Object:  Table [dbo].[MaxiKioscoTurno]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[MaxiKioscoTurno] ON
INSERT [dbo].[MaxiKioscoTurno] ([MaxiKioscoTurnoId], [MaxiKioscoId], [TurnoId], [MontoMaximoVentaConTickets], [Eliminado], [Desincronizado], [FechaUltimaModificacion], [Identifier]) VALUES (1, 2, 1, 1500.0000, 0, 1, CAST(0x07980480608E79380B AS DateTime2), N'121520ed-e2de-4a9a-9fa8-4f12c46d8712')
INSERT [dbo].[MaxiKioscoTurno] ([MaxiKioscoTurnoId], [MaxiKioscoId], [TurnoId], [MontoMaximoVentaConTickets], [Eliminado], [Desincronizado], [FechaUltimaModificacion], [Identifier]) VALUES (2, 2, 2, 23.0000, 0, 1, CAST(0x074A728D608E79380B AS DateTime2), N'561e9225-cabe-4901-87e6-3021a18962a0')
INSERT [dbo].[MaxiKioscoTurno] ([MaxiKioscoTurnoId], [MaxiKioscoId], [TurnoId], [MontoMaximoVentaConTickets], [Eliminado], [Desincronizado], [FechaUltimaModificacion], [Identifier]) VALUES (3, 2, 3, NULL, 0, 1, CAST(0x077CE78D608E79380B AS DateTime2), N'87828b82-45b9-4abe-8993-d278d90b0d0e')
INSERT [dbo].[MaxiKioscoTurno] ([MaxiKioscoTurnoId], [MaxiKioscoId], [TurnoId], [MontoMaximoVentaConTickets], [Eliminado], [Desincronizado], [FechaUltimaModificacion], [Identifier]) VALUES (4, 2, 4, NULL, 0, 1, CAST(0x078C0E8E608E79380B AS DateTime2), N'4fba5077-f68e-44ea-8986-dfa859e485c9')
INSERT [dbo].[MaxiKioscoTurno] ([MaxiKioscoTurnoId], [MaxiKioscoId], [TurnoId], [MontoMaximoVentaConTickets], [Eliminado], [Desincronizado], [FechaUltimaModificacion], [Identifier]) VALUES (5, 2, 5, NULL, 0, 1, CAST(0x079D358E608E79380B AS DateTime2), N'f436732f-df92-4141-8db8-53db4eb135ac')
SET IDENTITY_INSERT [dbo].[MaxiKioscoTurno] OFF
/****** Object:  Table [dbo].[CierreCaja]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[CierreCaja] ON
INSERT [dbo].[CierreCaja] ([CierreCajaId], [Identifier], [FechaInicio], [FechaFin], [CajaInicial], [CajaFinal], [CajaEsperada], [UsuarioId], [MaxiKioskoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (1, N'4acaf431-ce8d-48a5-a4de-48959b3a8637', CAST(0x070040230E435B380B AS DateTime2), CAST(0x0700E03495645B380B AS DateTime2), 100.0000, 1000.0000, 900.0000, 1, 1, 0, CAST(0x0720C19E4EA95B380B AS DateTime2), 0)
INSERT [dbo].[CierreCaja] ([CierreCajaId], [Identifier], [FechaInicio], [FechaFin], [CajaInicial], [CajaFinal], [CajaEsperada], [UsuarioId], [MaxiKioskoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (2, N'7aa38201-2682-444a-abee-272e410fae62', CAST(0x0700E03495645B380B AS DateTime2), CAST(0x070050CFDF965B380B AS DateTime2), 100.0000, 1000.0000, 900.0000, 1, 1, 0, CAST(0x07907D026EA95B380B AS DateTime2), 0)
INSERT [dbo].[CierreCaja] ([CierreCajaId], [Identifier], [FechaInicio], [FechaFin], [CajaInicial], [CajaFinal], [CajaEsperada], [UsuarioId], [MaxiKioskoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (3, N'240fe19d-46ac-46d4-ad49-fa3d7e7aa49b', CAST(0x070050CFDF965B380B AS DateTime2), CAST(0x0700F0E066B85B380B AS DateTime2), 100.0000, 1000.0000, 900.0000, 1, 1, 0, CAST(0x0730978973A95B380B AS DateTime2), 0)
INSERT [dbo].[CierreCaja] ([CierreCajaId], [Identifier], [FechaInicio], [FechaFin], [CajaInicial], [CajaFinal], [CajaEsperada], [UsuarioId], [MaxiKioskoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (4, N'ad5b5ef3-0ea9-412d-bc2e-0947ef5b49c1', CAST(0x0700F0E066B85B380B AS DateTime2), CAST(0x0700000000005B380B AS DateTime2), 100.0000, 1000.0000, 900.0000, 1, 1, 0, CAST(0x0780D34977A95B380B AS DateTime2), 0)
INSERT [dbo].[CierreCaja] ([CierreCajaId], [Identifier], [FechaInicio], [FechaFin], [CajaInicial], [CajaFinal], [CajaEsperada], [UsuarioId], [MaxiKioskoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (5, N'bc1cb958-e84a-475e-997a-3650db8d5294', CAST(0x070040230E435B380B AS DateTime2), CAST(0x0700E03495645B380B AS DateTime2), 100.0000, 800.0000, 700.0000, 1, 2, 0, CAST(0x0720C19E4EA95B380B AS DateTime2), 0)
INSERT [dbo].[CierreCaja] ([CierreCajaId], [Identifier], [FechaInicio], [FechaFin], [CajaInicial], [CajaFinal], [CajaEsperada], [UsuarioId], [MaxiKioskoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (6, N'52f8b586-dc85-45c4-a666-096c634305a7', CAST(0x0700E03495645B380B AS DateTime2), CAST(0x070050CFDF965B380B AS DateTime2), 100.0000, 800.0000, 700.0000, 1, 2, 0, CAST(0x07907D026EA95B380B AS DateTime2), 0)
INSERT [dbo].[CierreCaja] ([CierreCajaId], [Identifier], [FechaInicio], [FechaFin], [CajaInicial], [CajaFinal], [CajaEsperada], [UsuarioId], [MaxiKioskoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (7, N'82cc365f-7ae2-4a5e-8540-cd10c95b544c', CAST(0x070050CFDF965B380B AS DateTime2), CAST(0x0700F0E066B85B380B AS DateTime2), 100.0000, 800.0000, 700.0000, 1, 2, 0, CAST(0x0730978973A95B380B AS DateTime2), 0)
INSERT [dbo].[CierreCaja] ([CierreCajaId], [Identifier], [FechaInicio], [FechaFin], [CajaInicial], [CajaFinal], [CajaEsperada], [UsuarioId], [MaxiKioskoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (8, N'27fd6e9b-7e0b-49e5-bb41-847b218b6296', CAST(0x0700F0E066B85B380B AS DateTime2), CAST(0x0700000000005B380B AS DateTime2), 100.0000, 800.0000, 700.0000, 1, 2, 0, CAST(0x0780D34977A95B380B AS DateTime2), 0)
INSERT [dbo].[CierreCaja] ([CierreCajaId], [Identifier], [FechaInicio], [FechaFin], [CajaInicial], [CajaFinal], [CajaEsperada], [UsuarioId], [MaxiKioskoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (11, N'aef362ab-c1e1-43db-aadb-e3450d770012', CAST(0x07354429569A65380B AS DateTime2), CAST(0x070022995C6078380B AS DateTime2), 800.0000, 500.0000, 11226.0000, 2, 2, 1, CAST(0x070022995C6078380B AS DateTime2), 0)
INSERT [dbo].[CierreCaja] ([CierreCajaId], [Identifier], [FechaInicio], [FechaFin], [CajaInicial], [CajaFinal], [CajaEsperada], [UsuarioId], [MaxiKioskoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (12, N'fa045cb8-3a4f-4575-a9c6-bcd626116f10', CAST(0x0791B4326A6078380B AS DateTime2), CAST(0x07209E54F96179380B AS DateTime2), 500.0000, 500.0000, 441.0000, 1, 2, 1, CAST(0x07209E54F96179380B AS DateTime2), 0)
INSERT [dbo].[CierreCaja] ([CierreCajaId], [Identifier], [FechaInicio], [FechaFin], [CajaInicial], [CajaFinal], [CajaEsperada], [UsuarioId], [MaxiKioskoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (13, N'ca785956-d483-4c04-acd7-dfbe25af4b8c', CAST(0x07955A983E6279380B AS DateTime2), NULL, 500.0000, NULL, NULL, 1, 2, 1, CAST(0x07A681983E6279380B AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[CierreCaja] OFF
/****** Object:  Table [dbo].[Exportacion]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Exportacion] ON
INSERT [dbo].[Exportacion] ([ExportacionId], [Secuencia], [Fecha], [CreadorId], [Archivo], [CuentaId], [Eliminado], [Desincronizado], [FechaUltimaModificacion]) VALUES (7, 1, CAST(0x071080AE1F0B50380B AS DateTime2), 1, N'<Exportacion><Productos><Producto><ProductoId>1</ProductoId><Identifier>92813636-A4DC-419A-B744-0EDD70D2C0E7</Identifier><RubroId>1</RubroId><MarcaId>1</MarcaId><Descripcion>Galletitas terrabusi</Descripcion><Precio>12.2500</Precio><StockActual>0</StockActual><StockReposicion>50</StockReposicion><Desincronizado>1</Desincronizado><Eliminado>0</Eliminado><CuentaId>1</CuentaId></Producto><Producto><ProductoId>2</ProductoId><Identifier>12589D37-278D-4845-A86F-43CB412DB8DB</Identifier><RubroId>1</RubroId><MarcaId>2</MarcaId><Descripcion>Quilmes de litro</Descripcion><Precio>14.0000</Precio><StockActual>10</StockActual><StockReposicion>10</StockReposicion><Desincronizado>1</Desincronizado><Eliminado>0</Eliminado><CuentaId>1</CuentaId></Producto><Producto><ProductoId>3</ProductoId><Identifier>0BA813C3-9B87-47E4-93ED-E392B0E2F4A8</Identifier><RubroId>2</RubroId><MarcaId>1</MarcaId><Descripcion>Brahma Beats</Descripcion><Precio>13.0000</Precio><StockActual>6</StockActual><StockReposicion>9</StockReposicion><Desincronizado>1</Desincronizado><Eliminado>0</Eliminado><CuentaId>1</CuentaId></Producto><Producto><ProductoId>5</ProductoId><Identifier>BFE429E9-2C10-4D26-BDA4-168A8314F049</Identifier><RubroId>3</RubroId><MarcaId>2</MarcaId><Descripcion>Bombom</Descripcion><Precio>9.0000</Precio><StockActual>0</StockActual><StockReposicion>5</StockReposicion><Desincronizado>1</Desincronizado><FechaUltimaModificacion>2014-03-19T20:22:16.6370052</FechaUltimaModificacion><Eliminado>1</Eliminado><CuentaId>1</CuentaId></Producto><Producto><ProductoId>8</ProductoId><Identifier>EC23E798-29C8-42C1-8C0A-6F7D2FE02D1E</Identifier><RubroId>1</RubroId><MarcaId>1</MarcaId><Descripcion>Un prod</Descripcion><Precio>16.0000</Precio><StockActual>0</StockActual><StockReposicion>10</StockReposicion><Desincronizado>1</Desincronizado><FechaUltimaModificacion>2014-03-19T20:23:12.1771819</FechaUltimaModificacion><Eliminado>0</Eliminado><CuentaId>1</CuentaId></Producto></Productos></Exportacion>', 1, 0, 0, NULL)
INSERT [dbo].[Exportacion] ([ExportacionId], [Secuencia], [Fecha], [CreadorId], [Archivo], [CuentaId], [Eliminado], [Desincronizado], [FechaUltimaModificacion]) VALUES (8, 2, CAST(0x07106B446D6451380B AS DateTime2), 1, N'<Exportacion><Proveedores><Proveedor><ProveedorId>1</ProveedorId><Identifier>F65080C2-053B-4B9D-879F-F956E2C64258</Identifier><Nombre>Quilmes</Nombre><Contacto>Cacho</Contacto><Direccion>Avenida Siempre Viva 123</Direccion><Telefono>443545345</Telefono><Celular>15465456456</Celular><TipoCuitId>1</TipoCuitId><CuitNro>34236345453</CuitNro><Email>quilmes@tuvieja.com.ar</Email><PaginaWeb>http://www.quilmes.com.ar</PaginaWeb><Desincronizado>1</Desincronizado><Eliminado>0</Eliminado><CuentaId>1</CuentaId></Proveedor><Proveedor><ProveedorId>2</ProveedorId><Identifier>1D1A5AAD-0BC7-4B35-B271-9A70BC23FCE6</Identifier><Nombre>Coca Cola</Nombre><Contacto>Lalo Landa</Contacto><Direccion>Irigoyen 123</Direccion><Telefono>4434213</Telefono><Celular>154534546</Celular><TipoCuitId>3</TipoCuitId><CuitNro>342342342</CuitNro><Email>cocacola@tupendeja.com.ar</Email><PaginaWeb>http://www.cocacola.com.ar</PaginaWeb><Desincronizado>1</Desincronizado><Eliminado>0</Eliminado><CuentaId>1</CuentaId></Proveedor><Proveedor><ProveedorId>3</ProveedorId><Identifier>B4716325-0532-4668-8C7E-B23C6DF7EC6E</Identifier><Nombre>Proveedor 1m</Nombre><Contacto>contacm</Contacto><Direccion>Prov 01 m</Direccion><LocalidadId>1</LocalidadId><Telefono>212125</Telefono><Celular>545456467667</Celular><TipoCuitId>1</TipoCuitId><CuitNro>20-32551439-7</CuitNro><Email>aeda@asda.com</Email><Observaciones>obserm</Observaciones><Desincronizado>1</Desincronizado><Eliminado>0</Eliminado><CuentaId>1</CuentaId></Proveedor></Proveedores></Exportacion>', 1, 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[Exportacion] OFF
/****** Object:  Table [dbo].[ExcepcionRubro]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[ExcepcionRubro] ON
INSERT [dbo].[ExcepcionRubro] ([ExcepcionRubroId], [Identifier], [RubroId], [Desde], [Hasta], [RecargoAbsoluto], [RecargoPorcentaje], [FechaUltimaModificacion], [Eliminado], [Desincronizado], [MaxiKioscoId]) VALUES (1, N'fa75385e-2210-4f44-837b-0b8d9a95466e', 1, CAST(0x070058A5C8C00000 AS Time), CAST(0x070008D6E8290000 AS Time), 15.0000, NULL, NULL, 0, 0, 2)
INSERT [dbo].[ExcepcionRubro] ([ExcepcionRubroId], [Identifier], [RubroId], [Desde], [Hasta], [RecargoAbsoluto], [RecargoPorcentaje], [FechaUltimaModificacion], [Eliminado], [Desincronizado], [MaxiKioscoId]) VALUES (2, N'd31cde5e-3ced-4d5f-9221-ad9cb900539e', 5, CAST(0x0700000000000000 AS Time), CAST(0x0700000000000000 AS Time), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0x078F11A0F79F71380B AS DateTime2), 1, 1, 2)
INSERT [dbo].[ExcepcionRubro] ([ExcepcionRubroId], [Identifier], [RubroId], [Desde], [Hasta], [RecargoAbsoluto], [RecargoPorcentaje], [FechaUltimaModificacion], [Eliminado], [Desincronizado], [MaxiKioscoId]) VALUES (3, N'641ffce8-84f5-4c01-a709-f31d0dac72b1', 5, CAST(0x0700000000000000 AS Time), CAST(0x0700000000000000 AS Time), NULL, CAST(0.00 AS Decimal(18, 2)), CAST(0x075D561F5EA171380B AS DateTime2), 1, 1, 2)
INSERT [dbo].[ExcepcionRubro] ([ExcepcionRubroId], [Identifier], [RubroId], [Desde], [Hasta], [RecargoAbsoluto], [RecargoPorcentaje], [FechaUltimaModificacion], [Eliminado], [Desincronizado], [MaxiKioscoId]) VALUES (4, N'f91d64c2-15c7-428a-86bd-b1aa80fd14f8', 1, CAST(0x0700F0E066B80000 AS Time), CAST(0x070012E2A4C00000 AS Time), NULL, CAST(16.00 AS Decimal(18, 2)), CAST(0x07E9277F7CA971380B AS DateTime2), 0, 1, 2)
SET IDENTITY_INSERT [dbo].[ExcepcionRubro] OFF
/****** Object:  Table [dbo].[Proveedor]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Proveedor] ON
INSERT [dbo].[Proveedor] ([ProveedorId], [Identifier], [Nombre], [Contacto], [Direccion], [LocalidadId], [Telefono], [Celular], [TipoCuitId], [CuitNro], [Email], [PaginaWeb], [Observaciones], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId]) VALUES (1, N'f65080c2-053b-4b9d-879f-f956e2c64258', N'Quilmes', N'Cacho', N'Avenida Siempre Viva 123', NULL, N'443545345', N'15465456456', 1, N'34236345453', N'quilmes@tuvieja.com.ar', N'http://www.quilmes.com.ar', NULL, 0, NULL, 0, 1)
INSERT [dbo].[Proveedor] ([ProveedorId], [Identifier], [Nombre], [Contacto], [Direccion], [LocalidadId], [Telefono], [Celular], [TipoCuitId], [CuitNro], [Email], [PaginaWeb], [Observaciones], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId]) VALUES (2, N'1d1a5aad-0bc7-4b35-b271-9a70bc23fce6', N'Coca Cola', N'Lalo Landa', N'Irigoyen 123', NULL, N'4434213', N'154534546', 3, N'342342342', N'cocacola@tupendeja.com.ar', N'http://www.cocacola.com.ar', NULL, 0, NULL, 0, 1)
INSERT [dbo].[Proveedor] ([ProveedorId], [Identifier], [Nombre], [Contacto], [Direccion], [LocalidadId], [Telefono], [Celular], [TipoCuitId], [CuitNro], [Email], [PaginaWeb], [Observaciones], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId]) VALUES (3, N'b4716325-0532-4668-8c7e-b23c6df7ec6e', N'Proveedor 1m', N'contacm', N'Prov 01 m', 1, N'212125', N'545456467667', 1, N'20-32551439-7', N'aeda@asda.com', NULL, N'obserm', 0, NULL, 0, 1)
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
/****** Object:  Table [dbo].[Producto]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Producto] ON
INSERT [dbo].[Producto] ([ProductoId], [Identifier], [RubroId], [MarcaId], [Descripcion], [Precio], [StockReposicion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [AceptaCantidadesDecimales]) VALUES (1, N'92813636-a4dc-419a-b744-0edd70d2c0e7', 1, 1, N'Galletitas terrabusi', 12.2500, 50, 0, NULL, 0, 1, 0)
INSERT [dbo].[Producto] ([ProductoId], [Identifier], [RubroId], [MarcaId], [Descripcion], [Precio], [StockReposicion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [AceptaCantidadesDecimales]) VALUES (2, N'12589d37-278d-4845-a86f-43cb412db8db', 1, 2, N'Quilmes de litro', 14.0000, 10, 0, NULL, 0, 1, 0)
INSERT [dbo].[Producto] ([ProductoId], [Identifier], [RubroId], [MarcaId], [Descripcion], [Precio], [StockReposicion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [AceptaCantidadesDecimales]) VALUES (3, N'0ba813c3-9b87-47e4-93ed-e392b0e2f4a8', 2, 1, N'Brahma Beats', 12.0000, 9, 1, CAST(0x0731E1EC89C568380B AS DateTime2), 0, 1, 0)
INSERT [dbo].[Producto] ([ProductoId], [Identifier], [RubroId], [MarcaId], [Descripcion], [Precio], [StockReposicion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [AceptaCantidadesDecimales]) VALUES (5, N'bfe429e9-2c10-4d26-bda4-168a8314f049', 3, 2, N'Bombom', 9.0000, 5, 0, CAST(0x0704BF0AC0AA4E380B AS DateTime2), 1, 1, 0)
INSERT [dbo].[Producto] ([ProductoId], [Identifier], [RubroId], [MarcaId], [Descripcion], [Precio], [StockReposicion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [AceptaCantidadesDecimales]) VALUES (8, N'ec23e798-29c8-42c1-8c0a-6f7d2fe02d1e', 1, 1, N'Un prod', 10.0000, 10, 1, CAST(0x076E53D0B0066F380B AS DateTime2), 0, 1, 0)
INSERT [dbo].[Producto] ([ProductoId], [Identifier], [RubroId], [MarcaId], [Descripcion], [Precio], [StockReposicion], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CuentaId], [AceptaCantidadesDecimales]) VALUES (9, N'4bbe1cfe-17e9-447c-bf89-96c7b92d894a', 3, 4, N'Pan', 16.0000, NULL, 1, CAST(0x07C7C5784FBB6E380B AS DateTime2), 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Producto] OFF
/****** Object:  Table [dbo].[OperacionCaja]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[OperacionCaja] ON
INSERT [dbo].[OperacionCaja] ([OperacionCajaId], [Monto], [Fecha], [CierreCajaId], [FechaUltimaModificacion], [Eliminado], [MotivoId], [Observaciones], [Desincronizado], [UsuarioCreadorId], [UltimoUsuarioModificacionId]) VALUES (1, 12312.0000, CAST(0x0770C3326C9A65380B AS DateTime2), 11, NULL, 0, 1, N'asdasdasdasd', 0, 1, NULL)
INSERT [dbo].[OperacionCaja] ([OperacionCajaId], [Monto], [Fecha], [CierreCajaId], [FechaUltimaModificacion], [Eliminado], [MotivoId], [Observaciones], [Desincronizado], [UsuarioCreadorId], [UltimoUsuarioModificacionId]) VALUES (2, 123.0000, CAST(0x07E99E48829A65380B AS DateTime2), 11, NULL, 0, 1, N'asdasd', 0, 1, NULL)
INSERT [dbo].[OperacionCaja] ([OperacionCajaId], [Monto], [Fecha], [CierreCajaId], [FechaUltimaModificacion], [Eliminado], [MotivoId], [Observaciones], [Desincronizado], [UsuarioCreadorId], [UltimoUsuarioModificacionId]) VALUES (3, -50.0000, CAST(0x07B6345ED36179380B AS DateTime2), 12, NULL, 0, 2, N'observaciones cachorras', 0, 1, NULL)
INSERT [dbo].[OperacionCaja] ([OperacionCajaId], [Monto], [Fecha], [CierreCajaId], [FechaUltimaModificacion], [Eliminado], [MotivoId], [Observaciones], [Desincronizado], [UsuarioCreadorId], [UltimoUsuarioModificacionId]) VALUES (4, 1223.0000, CAST(0x07B9A3DBDB6179380B AS DateTime2), 12, NULL, 0, 1, N'pepe grillo', 0, 1, NULL)
INSERT [dbo].[OperacionCaja] ([OperacionCajaId], [Monto], [Fecha], [CierreCajaId], [FechaUltimaModificacion], [Eliminado], [MotivoId], [Observaciones], [Desincronizado], [UsuarioCreadorId], [UltimoUsuarioModificacionId]) VALUES (5, 12.0000, CAST(0x07FF63B9426279380B AS DateTime2), 13, NULL, 0, 1, N'2', 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[OperacionCaja] OFF
/****** Object:  Table [dbo].[Factura]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Factura] ON
INSERT [dbo].[Factura] ([FacturaId], [Identifier], [ProveedorId], [FacturaNro], [ImporteTotal], [Fecha], [MaxiKioscoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CierreCajaId], [DescuentoPorcentaje], [DescuentoEnPesos]) VALUES (1, N'a218a4fe-f8a9-445b-8e03-7263c2aa0662', 2, N'123', 1232.0000, CAST(0x070000000000A6100B AS DateTime2), 2, 1, CAST(0x07245792A0A765380B AS DateTime2), 0, 11, NULL, NULL)
INSERT [dbo].[Factura] ([FacturaId], [Identifier], [ProveedorId], [FacturaNro], [ImporteTotal], [Fecha], [MaxiKioscoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CierreCajaId], [DescuentoPorcentaje], [DescuentoEnPesos]) VALUES (2, N'5fbbe3bf-7aaa-436b-a1a2-bdcaa31ac2b8', 3, N'123', 123.0000, CAST(0x07000000000021380B AS DateTime2), 1, 1, CAST(0x0772FE7A5BA865380B AS DateTime2), 0, 11, NULL, NULL)
INSERT [dbo].[Factura] ([FacturaId], [Identifier], [ProveedorId], [FacturaNro], [ImporteTotal], [Fecha], [MaxiKioscoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CierreCajaId], [DescuentoPorcentaje], [DescuentoEnPesos]) VALUES (3, N'b17d402e-e714-4c1d-925d-364647365e36', 2, N'654', 654.0000, CAST(0x07200530FB7273380B AS DateTime2), 2, 1, CAST(0x0736CCB3C2A475380B AS DateTime2), 0, 11, CAST(6 AS Decimal(18, 0)), 39.2400)
INSERT [dbo].[Factura] ([FacturaId], [Identifier], [ProveedorId], [FacturaNro], [ImporteTotal], [Fecha], [MaxiKioscoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CierreCajaId], [DescuentoPorcentaje], [DescuentoEnPesos]) VALUES (4, N'86b009e0-4f2d-4812-ad2f-fe7f1dc24c5c', 2, N'1232', 1232.0000, CAST(0x07200530FB7273380B AS DateTime2), 2, 1, CAST(0x074700BBEE6179380B AS DateTime2), 0, 12, NULL, NULL)
INSERT [dbo].[Factura] ([FacturaId], [Identifier], [ProveedorId], [FacturaNro], [ImporteTotal], [Fecha], [MaxiKioscoId], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [CierreCajaId], [DescuentoPorcentaje], [DescuentoEnPesos]) VALUES (5, N'03af8a16-4c1a-41ab-af5a-24bcb1e6bf1c', 1, N'1234123', 26.0000, CAST(0x07200530FB7273380B AS DateTime2), 2, 1, CAST(0x074751EE918579380B AS DateTime2), 0, 13, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Factura] OFF
/****** Object:  Table [dbo].[CorreccionStock]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[CorreccionStock] ON
INSERT [dbo].[CorreccionStock] ([CorreccionStockId], [ProductoId], [Cantidad], [Precio], [Desincronizado], [FechaUltimaModificacion], [Identifier], [MotivoCorreccionId], [Fecha], [MaxiKioscoId]) VALUES (3, 8, CAST(2.00 AS Decimal(18, 2)), 30.0000, 1, NULL, N'f608fb15-321e-4a7b-bc18-b4952d940280', 1, CAST(0x0000A32000000000 AS DateTime), 1)
INSERT [dbo].[CorreccionStock] ([CorreccionStockId], [ProductoId], [Cantidad], [Precio], [Desincronizado], [FechaUltimaModificacion], [Identifier], [MotivoCorreccionId], [Fecha], [MaxiKioscoId]) VALUES (6, 5, CAST(1.00 AS Decimal(18, 2)), 50.0000, 1, NULL, N'b9fbd298-bd23-4785-aca7-6c29cd467bd3', 1, CAST(0x0000A32000000000 AS DateTime), 1)
INSERT [dbo].[CorreccionStock] ([CorreccionStockId], [ProductoId], [Cantidad], [Precio], [Desincronizado], [FechaUltimaModificacion], [Identifier], [MotivoCorreccionId], [Fecha], [MaxiKioscoId]) VALUES (7, 5, CAST(1.00 AS Decimal(18, 2)), 10.0000, 1, NULL, N'991fdce8-1560-49df-a1b9-e2033a89bee5', 1, CAST(0x0000A32000000000 AS DateTime), 1)
INSERT [dbo].[CorreccionStock] ([CorreccionStockId], [ProductoId], [Cantidad], [Precio], [Desincronizado], [FechaUltimaModificacion], [Identifier], [MotivoCorreccionId], [Fecha], [MaxiKioscoId]) VALUES (8, 5, CAST(1.00 AS Decimal(18, 2)), 10.0000, 1, NULL, N'780f0d4f-a837-4e4d-adf7-747b4136c2de', 1, CAST(0x0000A32000000000 AS DateTime), 1)
INSERT [dbo].[CorreccionStock] ([CorreccionStockId], [ProductoId], [Cantidad], [Precio], [Desincronizado], [FechaUltimaModificacion], [Identifier], [MotivoCorreccionId], [Fecha], [MaxiKioscoId]) VALUES (9, 8, CAST(3.00 AS Decimal(18, 2)), 30.0000, 1, NULL, N'efeca2b9-22c0-4174-8733-a9ff7f64457a', 1, CAST(0x0000A32000000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CorreccionStock] OFF
/****** Object:  Table [dbo].[Excepcion]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Excepcion] ON
INSERT [dbo].[Excepcion] ([ExcepcionId], [Identifier], [CierreCajaId], [Importe], [Descripcion], [FechaCarga], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (2, N'00000000-0000-0000-0000-000000000000', 12, 5.0000, N'HJFHFJG', CAST(0x070000000000000000 AS DateTime2), 1, CAST(0x07C6EF2C5D9079380B AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Excepcion] OFF
/****** Object:  Table [dbo].[ProveedorProducto]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[ProveedorProducto] ON
INSERT [dbo].[ProveedorProducto] ([ProveedorProductoId], [Identifier], [ProveedorId], [ProductoId], [Costo], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (1, N'00000000-0000-0000-0000-000000000000', 2, 2, 30.0000, 1, CAST(0x074178E60BC468380B AS DateTime2), 0)
INSERT [dbo].[ProveedorProducto] ([ProveedorProductoId], [Identifier], [ProveedorId], [ProductoId], [Costo], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (2, N'00000000-0000-0000-0000-000000000000', 2, 1, 12.5000, 1, CAST(0x07F05B6F2AC568380B AS DateTime2), 0)
INSERT [dbo].[ProveedorProducto] ([ProveedorProductoId], [Identifier], [ProveedorId], [ProductoId], [Costo], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (3, N'00000000-0000-0000-0000-000000000000', 2, 3, 5.0000, 1, CAST(0x07CA4986430169380B AS DateTime2), 0)
INSERT [dbo].[ProveedorProducto] ([ProveedorProductoId], [Identifier], [ProveedorId], [ProductoId], [Costo], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (4, N'00000000-0000-0000-0000-000000000000', 2, 8, 5.0000, 1, CAST(0x0714BBE33B0569380B AS DateTime2), 0)
INSERT [dbo].[ProveedorProducto] ([ProveedorProductoId], [Identifier], [ProveedorId], [ProductoId], [Costo], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (5, N'00000000-0000-0000-0000-000000000000', 2, 9, 5.0000, 1, CAST(0x0738CF66B5026F380B AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[ProveedorProducto] OFF
/****** Object:  Table [dbo].[CodigoProducto]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[CodigoProducto] ON
INSERT [dbo].[CodigoProducto] ([CodigoProductoId], [ProductoId], [Codigo], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (1, 1, N'1', 1, NULL, 0)
INSERT [dbo].[CodigoProducto] ([CodigoProductoId], [ProductoId], [Codigo], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (2, 2, N'2', 1, NULL, 0)
INSERT [dbo].[CodigoProducto] ([CodigoProductoId], [ProductoId], [Codigo], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (3, 3, N'3', 1, NULL, 0)
INSERT [dbo].[CodigoProducto] ([CodigoProductoId], [ProductoId], [Codigo], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (4, 5, N'5', 1, NULL, 0)
INSERT [dbo].[CodigoProducto] ([CodigoProductoId], [ProductoId], [Codigo], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (5, 8, N'8', 1, NULL, 0)
INSERT [dbo].[CodigoProducto] ([CodigoProductoId], [ProductoId], [Codigo], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (6, 8, N'82', 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[CodigoProducto] OFF
/****** Object:  Table [dbo].[Stock]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Stock] ON
INSERT [dbo].[Stock] ([StockId], [ProductoId], [MaxiKioscoId], [Identifier], [StockActual], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (1, 1, 2, N'23b65839-404b-4265-bdb1-c8bcadb0f982', CAST(0.00 AS Decimal(18, 2)), 1, CAST(0x07B79661535855380B AS DateTime2), 0)
INSERT [dbo].[Stock] ([StockId], [ProductoId], [MaxiKioscoId], [Identifier], [StockActual], [Desincronizado], [FechaUltimaModificacion], [Eliminado]) VALUES (2, 2, 2, N'00000000-0000-0000-0000-000000000000', CAST(0.00 AS Decimal(18, 2)), 0, NULL, 0)
SET IDENTITY_INSERT [dbo].[Stock] OFF
/****** Object:  Table [dbo].[Venta]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Venta] ON
INSERT [dbo].[Venta] ([VentaId], [Identifier], [CierreCajaId], [ImporteTotal], [FechaVenta], [Eliminado], [Desincronizado], [FechaUltimaModificacion]) VALUES (41, N'00000000-0000-0000-0000-000000000000', 13, 12.2500, CAST(0x0000A32000000000 AS DateTime), 0, 1, CAST(0x073D090D31A67B380B AS DateTime2))
SET IDENTITY_INSERT [dbo].[Venta] OFF
/****** Object:  Table [dbo].[UsuarioProveedor]    Script Date: 05/07/2014 23:27:54 ******/
/****** Object:  Table [dbo].[VentaProducto]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[VentaProducto] ON
INSERT [dbo].[VentaProducto] ([VentaProductoId], [Identifier], [VentaId], [ProductoId], [Precio], [Cantidad], [FechaUltimaModificacion], [Eliminado], [Desincronizado]) VALUES (238, N'00000000-0000-0000-0000-000000000000', 41, 1, 12.2500, 3, NULL, 0, 0)
SET IDENTITY_INSERT [dbo].[VentaProducto] OFF
/****** Object:  Table [dbo].[StockTransaccion]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[StockTransaccion] ON
INSERT [dbo].[StockTransaccion] ([StockTransaccionId], [StockId], [Identifier], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [Cantidad], [StockTransaccionTipoId]) VALUES (4, 2, N'00000000-0000-0000-0000-000000000000', 0, NULL, 0, CAST(2.00 AS Decimal(18, 2)), 2)
SET IDENTITY_INSERT [dbo].[StockTransaccion] OFF
/****** Object:  Table [dbo].[Compra]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[Compra] ON
INSERT [dbo].[Compra] ([CompraId], [Identifier], [Fecha], [Numero], [FacturaId], [CuentaId], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [MaxiKioscoId]) VALUES (8, N'5e84d812-1e9b-42b9-9507-0d2b21b3708c', CAST(0x07F3CBBF3F8679380B AS DateTime2), N'5', 5, 1, 1, CAST(0x07F586C43F8679380B AS DateTime2), 0, 2)
SET IDENTITY_INSERT [dbo].[Compra] OFF
/****** Object:  Table [dbo].[CompraProducto]    Script Date: 05/07/2014 23:27:54 ******/
SET IDENTITY_INSERT [dbo].[CompraProducto] ON
INSERT [dbo].[CompraProducto] ([CompraProductoId], [CompraId], [Identifier], [ProductoId], [CostoActual], [CostoActualizado], [PrecioActual], [PrecioActualizado], [Cantidad], [Desincronizado], [FechaUltimaModificacion], [Eliminado], [StockTransaccionId]) VALUES (1, 8, N'b3d92463-c1e0-4842-99f5-15489c5d5fd6', 2, 0.0000, NULL, 0.0000, 14.0000, CAST(2.00 AS Decimal(18, 2)), 1, NULL, 0, 4)
SET IDENTITY_INSERT [dbo].[CompraProducto] OFF
