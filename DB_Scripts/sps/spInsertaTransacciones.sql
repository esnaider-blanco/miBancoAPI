-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 13/11/2023
-- Description:	Inserta transacciones de las cuenta bancarias.
-- =============================================

CREATE PROCEDURE spInsertaTransacciones
(
	@IdTipoTransaccion INT,
	@IdCuentaBancaria INT,
	@IdCuentaBancariaOrigen INT NULL,
	@IdCuentaBancariaDestino INT NULL,
	@Monto MONEY,
	@Descripcion VARCHAR(200) NULL
)
AS
BEGIN

	IF @IdTipoTransaccion =  1
	begin
		 insert into [adminMiBanco].[Transacciones]
		 (
			 [FechaTransaccion],
			 [IdTipoTransaccion],
			 [IdCuentaBancaria],
			 [IdCuentaBancariaOrigen],
			 [IdCuentaBancariaDestino],
			 [Monto],
			 [Descripcion]
		 )
		 values
		 (
			GETDATE(),
			@IdTipoTransaccion,
			@IdCuentaBancaria,
			@IdCuentaBancaria,
			NULL,
			@Monto,
			@Descripcion
		 )
		 

	end
	else
	begin
		insert into [adminMiBanco].[Transacciones]
		 (
			 [FechaTransaccion],
			 [IdTipoTransaccion],
			 [IdCuentaBancaria],
			 [IdCuentaBancariaOrigen],
			 [IdCuentaBancariaDestino],
			 [Monto],
			 [Descripcion]
		 )
		 values
		 (
			GETDATE(),
			@IdTipoTransaccion,
			@IdCuentaBancaria,
			NULL,
			NULL,
			@Monto,
			@Descripcion
		 )
	end

END
