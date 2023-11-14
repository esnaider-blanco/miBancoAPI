-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 13/11/2023
-- Description:	Inserta una cuenta bancaria.
-- =============================================

alter PROCEDURE spInsertaCuentaBancaria
(
	@IdUsuario INT,
	@SaldoInicial MONEY,
	@EsCuentaPrincipal BIT,
	@DbResponse VARCHAR(100) OUTPUT
)
AS
BEGIN

	-- Inserta en la tabla [CuentasBancarias]
	INSERT INTO [adminMiBanco].[CuentasBancarias]
	(
	  [IdUsuario],
	  [NumeroCuenta],
	  [SaldoDisponible],
      [EsCuentaPrincipal],     	 
	  [EstaBloqueada],	 
	  [FechaCreacion]
	)
	VALUES
	(
		@IdUsuario,
		REPLACE('CR' + STR(CAST(CAST(NEWID() AS binary(5)) AS bigint),20), ' ', 0),
		@SaldoInicial,
		@EsCuentaPrincipal,
		0,
		GETDATE()
	)

	select @DbResponse = 'Cuenta bancaria creada exitosamente.'
END
