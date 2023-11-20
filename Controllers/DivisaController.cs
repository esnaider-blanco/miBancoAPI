using MiBancoAPI.Services.ServicioDivisa;
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
        public async Task<IActionResult> TipoCambio()
        {
            return Ok(await _divisaRepositorio.ObtieneTipoCambio());
        }
    }
}
