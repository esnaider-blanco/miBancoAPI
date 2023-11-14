-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 13/11/2023
-- Description:	Cierra la sesion
-- =============================================

alter PROCEDURE spLogout
(
	@IdUsuario INT,
	@DbResponse VARCHAR(100) OUTPUT
)
AS
BEGIN

	-- Validamos si usuario tiene una sesion activa
	IF EXISTS (
		SELECT	TOP 1 *
		FROM	[adminMiBanco].[HistoricoLogins] h
		WHERE	h.IdUsuario = @IdUsuario
				AND 
				EstaActivo = 1
	)
	BEGIN
		-- Actualiza historico logins para finalizar la sesion
		UPDATE	[adminMiBanco].[HistoricoLogins]
		SET		FechaFinSesion = GETDATE(),
				EstaActivo = 0
		WHERE	IdUsuario = @IdUsuario
				AND
				EstaActivo = 1

		SELECT @DbResponse = 'El usuario ha finalizado la sesión.'
	END
	ELSE
	BEGIN
		SELECT @DbResponse = 'El usuario no tiene una sesión activa.'
	END

END
