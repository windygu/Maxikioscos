   
INSERT INTO [CategoriaCosto] VALUES ('Categoria General',NEWID(),1,0,NULL,0,NULL)
GO

DECLARE @NuevoId INT
SET @NuevoId = (SELECT MAX(CategoriaCostoId) FROM CategoriaCosto)

UPDATE CategoriaCosto
SET PadreId = @NuevoId,
	Desincronizado = 1
WHERE CategoriaCostoId != @NuevoId
	AND Eliminado = 0


