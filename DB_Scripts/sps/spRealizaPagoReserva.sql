-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 13/11/2023
-- Description:	Realiza la accion de pagar la reserva
-- =============================================

CREATE PROCEDURE spRealizaPagoReserva
(
	@IdCuentaBancariaOrigen INT,
	@Monto MONEY,
	@IdUsuarioDestino INT
)
AS
BEGIN

	declare @IdCuentaBancariaDestino int;

	select @IdCuentaBancariaDestino = cb.IdCuentaBancaria
	FROM [adminMiBanco].[CuentasBancarias] cb
	INNER JOIN [adminMiBanco].[Usuarios] u
		ON u.IdUsuario = cb.IdUsuario
			AND
			u.IdUsuario = @IdUsuarioDestino	
	WHERE cb.EsCuentaPrincipal = 1

	-- Actualiza saldo en la cuenta origen
	UPDATE [adminMiBanco].[CuentasBancarias]
	SET SaldoDisponible -= @Monto
	WHERE IdCuentaBancaria = @IdCuentaBancariaOrigen

	INSERT INTO [adminMiBanco].[Transacciones]
	VALUES (GETDATE(),1,@IdCuentaBancariaOrigen,null,@IdCuentaBancariaDestino,@Monto,'Pago hospedaje')

	-- Actualiza saldo en la cuenta destino
	UPDATE [adminMiBanco].[CuentasBancarias]
	SET SaldoDisponible += @Monto
	WHERE IdCuentaBancaria = @IdCuentaBancariaDestino

	INSERT INTO [adminMiBanco].[Transacciones]
	VALUES (GETDATE(),2,@IdCuentaBancariaDestino,@IdCuentaBancariaOrigen,null,@Monto,'Pago hospedaje')

END
