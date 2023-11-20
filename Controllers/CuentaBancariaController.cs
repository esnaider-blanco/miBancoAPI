using MiBancoAPI.Services.ServicioCuentaBancaria;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace MiBancoAPI.Controllers
{
    [ApiController]
    public class CuentaBancariaController : Controller
    {
        private readonly ICuentaBancariaRepositorio _cuentaBancariaRepositorio;
        public CuentaBancariaController(ICuentaBancariaRepositorio cuentaBancariaRepositorio)
        {
            _cuentaBancariaRepositorio = cuentaBancariaRepositorio;
        }

        [HttpPost("api/crearCuentaBancaria")]
        public async Task<IActionResult> CrearCuentaBancaria(int idUsuario, decimal saldoInicial, bool esCuentaPrincipal)
        {
            if (idUsuario == null || (saldoInicial == null || saldoInicial < 0) || esCuentaPrincipal == null)
            {
                return BadRequest();
            }

            return Ok(await _cuentaBancariaRepositorio.InsertaCuentaBancaria(idUsuario, saldoInicial, esCuentaPrincipal));
        }

        [HttpPost("api/realizarDeposito")]
        public async Task<IActionResult> RealizarDeposito(int idCuentaBancaria, decimal monto)
        {
            if (idCuentaBancaria == null || monto == null || monto <= 0)
            {
                return BadRequest("Revisa los parametros");
            }

            return Ok(await _cuentaBancariaRepositorio.RealizaDeposito(idCuentaBancaria, monto));
        }

        [HttpPost("api/realizarPagoReserva")]
        public async Task<IActionResult> RealizarPagoReserva(int idCuentaBancariaOrigen, decimal monto, int idUsuarioDestino)
        {
            if (idCuentaBancariaOrigen == null || monto == null || monto <= 0 || idUsuarioDestino == null)
            {
                return BadRequest("Revisa los parametros");
            }

            return Ok(await _cuentaBancariaRepositorio.RealizaPagoReserva(idCuentaBancariaOrigen, monto, idUsuarioDestino));
        }

        [HttpGet("api/obtenerCuentasBancariasPorIdUsuario/{idUsuario}")]
        public async Task<IActionResult> ObtenerCuentasBancariasPorIdUsuario(int idUsuario)
        {
            if (idUsuario == null || idUsuario <= 0)
            {
                return BadRequest();
            }

            return Ok(await _cuentaBancariaRepositorio.ObtieneCuentasBancariasPorIdUsuario(idUsuario));
        }

        [HttpGet("api/obtenerTransaccionesPorIdCuenta/{idCuentaBancaria}")]
        public async Task<IActionResult> ObtenerTransaccionesPorIdCuenta(int idCuentaBancaria)
        {
            if (idCuentaBancaria == null || idCuentaBancaria <= 0)
            {
                return BadRequest();
            }

            return Ok(await _cuentaBancariaRepositorio.ObtieneTransaccionesPorIdCuenta(idCuentaBancaria));
        }
    }
}
