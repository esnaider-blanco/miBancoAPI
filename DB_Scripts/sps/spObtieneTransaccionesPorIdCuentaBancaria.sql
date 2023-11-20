-- =============================================
-- Author:		Esnaider Blanco
-- Create date: 13/11/2023
-- Description:	Obtiene las transacciones por id usuario
-- =============================================

CREATE PROCEDURE [spObtieneTransaccionesPorIdCuentaBancaria]
(
	@IdCuenta INT
)
AS
BEGIN

	SELECT	t.IdTransaccion,
			t.FechaTransaccion,
			tp.TipoTransaccion,
			t.Monto,
			t.Descripcion,
			cb2.NumeroCuenta AS NumeroCuentaOrigen,
			Concat(u2.Nombre, u2.Apellidos) as NombreCuentaOrigen,
			cb2.NumeroCuenta as NumeroCuentaDestino,
			Concat(u2.Nombre, u2.Apellidos) as NombreCuentaDestino			
	FROM	[adminMiBanco].[Transacciones] t
	INNER JOIN [adminMiBanco].[TiposTransaccion] tp
		ON tp.IdTipoTransaccion = t.IdTipoTransaccion
	INNER JOIN [adminMiBanco].[CuentasBancarias] cb
			ON cb.IdCuentaBancaria = t.IdCuentaBancaria 
	INNER JOIN [adminMiBanco].[CuentasBancarias] cb2
			ON cb2.IdCuentaBancaria = t.IdCuentaBancariaOrigen 
	INNER JOIN [adminMiBanco].[Usuarios] u2
			ON u2.IdUsuario = cb2.IdUsuario
	INNER JOIN [adminMiBanco].[CuentasBancarias] cb3
			ON cb3.IdCuentaBancaria = t.IdCuentaBancariaDestino
	INNER JOIN [adminMiBanco].[Usuarios] u3
			ON u3.IdUsuario = cb3.IdUsuario
	WHERE	t.IdCuentaBancaria = @IdCuenta
	 
END
