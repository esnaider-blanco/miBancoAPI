-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 13/11/2023
-- Description:	Obtiene cuenta bancarias por correo electronico.
-- =============================================

alter PROCEDURE [adminMiBanco].[spObtieneIdUsuarioPorCorreoElectronico]
(
	@CorreoElectronico VARCHAR(50),
	@DbResponse VARCHAR(100) OUTPUT
)
AS
BEGIN

	SELECT	u.IdUsuario,
			CONVERT(VARCHAR, DECRYPTBYPASSPHRASE('ImNotGoingToTellMyPassword', u.CorreoElectronico)) as CorreoElectronico		
	INTO	#tmpUsers
	FROM	[adminMiBanco].[Usuarios] u

	--Valida si el email coincide
	IF EXISTS 
	(
		SELECT	*
		FROM	#tmpUsers t
		WHERE	t.CorreoElectronico = @CorreoElectronico
	)
	BEGIN

		SELECT	@DbResponse = t.IdUsuario
		FROM	#tmpUsers t
		WHERE	t.CorreoElectronico = @CorreoElectronico
	
	END
	else
	begin
		select @DbResponse = 'el correo electronico no se encuentra registrado'
	end
END
