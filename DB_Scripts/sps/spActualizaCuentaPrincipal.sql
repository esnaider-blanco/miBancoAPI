-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 13/11/2023
-- Description:	Actualiza la cuenta bancaria principal.
-- =============================================

CREATE PROCEDURE spActualizaCuentaPrincipal
(	
	@IdCuentaBancaria INT,
	@IdUsuario INT,
	@EsCuentaPrincipal BIT
)
AS
BEGIN

	UPDATE [adminMiBanco].[CuentasBancarias]
	SET EsCuentaPrincipal = 0
	WHERE IdCuentaBancaria = @IdCuentaBancaria
			AND
			IdUsuario = @IdUsuario

	UPDATE [adminMiBanco].[CuentasBancarias]
	SET EsCuentaPrincipal = @EsCuentaPrincipal
	WHERE IdCuentaBancaria = @IdCuentaBancaria
			AND
			IdUsuario = @IdUsuario

END
