-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 13/11/2023
-- Description:	Obtiene cuentas por id usuario
-- =============================================

create PROCEDURE [spObtieneCuentasPorIdUsuario]
(
	@IdUsuario INT
)
AS
BEGIN

	SELECT	IdCuentaBancaria,
			NumeroCuenta,
			SaldoDisponible,
			EsCuentaPrincipal,
			EstaBloqueada,
			FechaCreacion
	FROM	[adminMiBanco].[CuentasBancarias]
	WHERE	IdUsuario = @IdUsuario
	 
END
