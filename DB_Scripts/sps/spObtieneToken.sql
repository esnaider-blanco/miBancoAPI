-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 18/11/2023
-- Description:	Obtiene token por id usuario.
-- =============================================

alter PROCEDURE spObtieneToken
(
	@IdUsuario INT,
	@DbRespuesta VARCHAR(100) OUTPUT
)
AS
BEGIN

	SELECT	top 1 @DbRespuesta = u.Token
	FROM	[adminMiBanco].[Usuarios] u
	WHERE	u.IdUsuario = @IdUsuario

END
