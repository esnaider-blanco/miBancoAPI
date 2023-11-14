-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 13/11/2023
-- Description:	Verifica si el correo y contrase�a coinciden.
-- =============================================

ALTER PROCEDURE [adminMiBanco].[spLogin]
(
	@CorreoElectronico VARCHAR(50),
	@Contrase�a VARCHAR(50),
	@DbResponse VARCHAR(100) OUTPUT
)
AS
BEGIN

	declare @IdUsuario int;
	declare @IntentosFallidos int;
	declare @EstaBloqueado bit;

	SELECT	u.IdUsuario,
			u.IntentosFallidos,
			u.EstaBloqueado,
			CONVERT(VARCHAR, DECRYPTBYPASSPHRASE('ImNotGoingToTellMyPassword', u.CorreoElectronico)) as CorreoElectronico, 
			CONVERT(VARCHAR, DECRYPTBYPASSPHRASE('ImNotGoingToTellMyPassword', u.Contrase�a)) as Contrase�a
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

		--Valida si el email y contrase�a coinciden
		IF EXISTS 
		(
			SELECT	top 1 t.IdUsuario
			FROM	#tmpUsers t
			WHERE	t.CorreoElectronico = @CorreoElectronico
					AND
					t.Contrase�a = @Contrase�a
		)
		BEGIN

			--se obtiene el IdUsuario, IntentosFallidos, EstaBloqueado
			SELECT	top 1 @IdUsuario = t.IdUsuario, @IntentosFallidos = t.IntentosFallidos, @EstaBloqueado = t.EstaBloqueado
			FROM	#tmpUsers t
			WHERE	t.CorreoElectronico = @CorreoElectronico
					AND
					t.Contrase�a = @Contrase�a

			if @EstaBloqueado = 1
			begin
				select @DbResponse = 'El usuario ha sido bloqueado.'
			end
			else
			begin
				-- actualiza el token
				UPDATE [adminMiBanco].[Usuarios]
				SET Token = left(NEWID(),6)
				WHERE	IdUsuario = @IdUsuario;

				-- actualiza intento fallido de vuelta a 0
				UPDATE [adminMiBanco].[Usuarios]
				SET IntentosFallidos = 0
				WHERE	IdUsuario = @IdUsuario		
				
				-- inserta en historico logins
				INSERT INTO [adminMiBanco].[HistoricoLogins]
				(
					IdUsuario,
					FechaInicioSesion,
					FechaFinSesion,
					EstaActivo
				)
				VALUES
				(
					@IdUsuario,
					GETDATE(),
					null,
					1
				)

				select @DbResponse = concat('Se ha iniciado una nueva sesi�n. IdUsuario:', cast(@IdUsuario as varchar));
			end
		END
		ELSE
		BEGIN

			--se obtiene el user id
			SELECT	top 1 @IdUsuario = t.IdUsuario,  @IntentosFallidos = t.IntentosFallidos, @EstaBloqueado = t.EstaBloqueado
			FROM	#tmpUsers t
			WHERE	t.CorreoElectronico = @CorreoElectronico


			if @EstaBloqueado = 0
			begin
				if @IntentosFallidos >= 3
				begin
					-- bloqueo
					UPDATE [adminMiBanco].[Usuarios]
					SET EstaBloqueado = 1
					WHERE	IdUsuario = @IdUsuario		
					
					select @DbResponse = 'El usuario ha sido bloqueado.'
				end	
				else
				begin
					-- intento fallido
					UPDATE [adminMiBanco].[Usuarios]
					SET IntentosFallidos += 1
					WHERE	IdUsuario = @IdUsuario

					select @DbResponse = 'Usuario o contrase�a incorrecta.'
				end
			end
			else
			begin 
				select @DbResponse = 'El usuario ha sido bloqueado.'
			end
		END

	END
	ELSE
	BEGIN
		-- correo no existe
		select @DbResponse = 'Usuario o contrase�a incorrecta.'
	END
	
END
