-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 13/11/2023
-- Description:	Actualiza el saldo disponible de una cuenta bancaria.
-- =============================================

CREATE PROCEDURE spActualizaSaldo
(
	@IdCuentaBancaria INT,
	@Monto MONEY
)
AS
BEGIN

	UPDATE [adminMiBanco].[CuentasBancarias]
	SET SaldoDisponible = @Monto
	WHERE IdCuentaBancaria = @IdCuentaBancaria

END
