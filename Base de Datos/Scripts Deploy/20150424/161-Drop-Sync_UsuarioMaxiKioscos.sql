IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sync_UsuarioMaxiKioscos]') AND type in (N'P', N'PC'))
DROP PROCEDURE[dbo].[Sync_UsuarioMaxiKioscos]
GO