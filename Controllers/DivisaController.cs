using MiBancoAPI.Services.ServicioDivisa;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace MiBancoAPI.Controllers
{
    [ApiController]
    public class DivisaController : Controller
    {
        private readonly IDivisaRepositorio _divisaRepositorio;
        public DivisaController(IDivisaRepositorio divisaRepositorio)
        {
            _divisaRepositorio = divisaRepositorio;
        }

        [HttpGet("api/tipoCambio")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> TipoCambio()
        {
            return Ok(await _divisaRepositorio.ObtieneTipoCambio());
        }
    }
}
