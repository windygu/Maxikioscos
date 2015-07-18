


CREATE FUNCTION [dbo].[RecargoPorProductoId]
(	
	@ProductoId int
)
RETURNS @Recargo TABLE (	Recargo money NULL)
AS
BEGIN
	INSERT @Recargo SELECT Recargo =CASE 
									WHEN (dbo.EntreHorarios(ER.Desde,ER.Hasta)=1)
									THEN ER.RecargoAbsoluto
									ELSE NULL
								END
					FROM ExcepcionRubro ER INNER JOIN Producto P
						ON ER.RubroId=P.RubroId
					WHERE P.ProductoId=@ProductoId
					AND  dbo.EntreHorarios(ER.Desde,ER.Hasta)=1
						
					
	
	RETURN 
END

