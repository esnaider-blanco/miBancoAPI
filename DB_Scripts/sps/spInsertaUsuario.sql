-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 13/11/2023
-- Description:	Inserta usuario.
-- =============================================

alter PROCEDURE spInsertaUsuario
(
	@Nombre VARCHAR(20),
	@Apellidos VARCHAR(50),
	@FechaNacimiento DATE,
	@CorreoElectronico VARCHAR(50),
	@Contraseña VARCHAR(50),
	@DbRespuesta VARCHAR(100) OUTPUT
)
AS
BEGIN

	SELECT	CONVERT(VARCHAR, DECRYPTBYPASSPHRASE('ImNotGoingToTellMyPassword',u.CorreoElectronico)) as CorreoElectronico
	INTO	#tmpUsuarios
	FROM	[adminMiBanco].[Usuarios] u

	IF EXISTS (
		SELECT	*
		FROM	#tmpUsuarios
		WHERE	CorreoElectronico = @CorreoElectronico
	)	
	BEGIN
		SELECT @DbRespuesta = concat('El correo electronico ', @CorreoElectronico , ' ya se encuentra registrado.');
	END
	ELSE
	BEGIN
		-- Inserta en la tabla [Usuarios]
		INSERT INTO [adminMiBanco].[Usuarios]
		(
		  [Nombre],
		  [Apellidos],
		  [FechaNacimiento],
		  [CorreoElectronico],
		  [Contraseña],
		  [Token],
		  [EstaBloqueado],
		  [IntentosFallidos],
		  [EstaActivo],
		  [FechaCreacion]
		)
		VALUES
		(
			@Nombre,
			@Apellidos,
			@FechaNacimiento,
			ENCRYPTBYPASSPHRASE('ImNotGoingToTellMyPassword', @CorreoElectronico),
			ENCRYPTBYPASSPHRASE('ImNotGoingToTellMyPassword', @Contraseña),
			NULL,
			0,
			0,
			1,
			GETDATE()
		)

		SELECT @DbRespuesta = 'Usuario registrado exitosamente.' 
	END

	

END
