using MiBancoAPI.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MiBancoAPI.Services.ServicioCuentaBancaria
{
    public interface ICuentaBancariaRepositorio
    {
        Task<string> InsertaCuentaBancaria(int idUsuario, decimal saldoInicial, bool esCuentaPrincipal);        

        Task<string> RealizaDeposito(int idCuentaBancaria, decimal monto);

        Task<string> RealizaPagoReserva(int idCuentaBancaria, decimal monto, int idUsuarioDestino);

        Task<List<CuentaBancariaCustom>> ObtieneCuentasBancariasPorIdUsuario(int idUsuario);

        Task<List<TransaccionCustom>> ObtieneTransaccionesPorIdCuenta(int idCuentaBancaria);

        Task<string> ActualizaCuentaPrincipal(int idCuentaBancaria, int idUsuario, bool esCuentaPrincipal);
    }
}
