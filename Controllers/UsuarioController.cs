using MiBancoAPI.Models;
using MiBancoAPI.Services.ServicioUsuario;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MiBancoAPI.Controllers
{
    //[Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private readonly IUsuarioRepositorio _usuarioRepositorio;

        public UsuarioController(IUsuarioRepositorio usuarioRepositorio)
        {
            _usuarioRepositorio = usuarioRepositorio;
        }

        [HttpPost("api/registrarUsuario")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> RegistrarUsuario(string nombre, string apellidos, DateTime fechaNacimiento, string correoElectronico, string contraseña)
        {
            if (String.IsNullOrEmpty(nombre) || String.IsNullOrEmpty(apellidos) || fechaNacimiento == null || String.IsNullOrEmpty(correoElectronico) || String.IsNullOrEmpty(contraseña))
            {
                return BadRequest();
            }

            return Ok(await _usuarioRepositorio.InsertaUsuario(nombre, apellidos, fechaNacimiento, correoElectronico, contraseña));
        }

        [HttpPost("api/login")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> Login(string correoElectronico, string contraseña)
        {
            if (String.IsNullOrEmpty(correoElectronico) || String.IsNullOrEmpty(contraseña))
            {
                return BadRequest();
            }

            return Ok(await _usuarioRepositorio.LoginUsuario(correoElectronico, contraseña));
        }

        [HttpPost("api/logout")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> Logout(int idUsuario)
        {
            if (idUsuario == null)
            {
                return BadRequest();
            }

            return Ok(await _usuarioRepositorio.LogoutUsuario(idUsuario));
        }

        [HttpPost("api/crearCuentaBancaria")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> CrearCuentaBancaria(int idUsuario, decimal saldoInicial, bool esCuentaPrincipal)
        {
            if (idUsuario == null || (saldoInicial == null || saldoInicial < 0) || esCuentaPrincipal == null)
            {
                return BadRequest();
            }

            return Ok(await _usuarioRepositorio.InsertaCuentaBancaria(idUsuario, saldoInicial, esCuentaPrincipal));
        }

        [HttpGet("api/obtenerCuentasBancariasPorIdUsuario/{idUsuario}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(StatusCodes.Status400BadRequest)]
        [ProducesResponseType(StatusCodes.Status500InternalServerError)]
        public async Task<IActionResult> ObtenerCuentasBancariasPorIdUsuario(int idUsuario)
        {
            if (idUsuario == null || idUsuario <= 0)
            {
                return BadRequest();
            }

            return Ok(await _usuarioRepositorio.ObtieneCuentasBancariasPorIdUsuario(idUsuario));
        }
    }
}
