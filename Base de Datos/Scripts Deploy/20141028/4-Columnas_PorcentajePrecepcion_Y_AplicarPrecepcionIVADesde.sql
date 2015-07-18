ALTER TABLE dbo.Cuenta
ADD AplicarPercepcionIVADesde money NULL
GO

UPDATE dbo.Cuenta
SET AplicarPercepcionIVADesde = 800
GO

ALTER TABLE dbo.Cuenta
ADD PorcentajePercepcionIVA DECIMAL(5,2) NULL
GO

UPDATE dbo.Cuenta
SET PorcentajePercepcionIVA = 1.5
GO