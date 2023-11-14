USE [dbFastMenu]
GO
/****** Object:  StoredProcedure [dbo].[spVerificaCorreoElectronico]    Script Date: 14/11/2023 1:12:35 ******/
-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 13/11/2023
-- Description:	Valida si el correo existe o no.
-- =============================================

CREATE PROCEDURE [spVerificaCorreoElectronico]
(
	@CorreoElectronico VARCHAR(50)
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
		SELECT 1;
	END
	ELSE
	BEGIN
		SELECT 0;
	END

END
