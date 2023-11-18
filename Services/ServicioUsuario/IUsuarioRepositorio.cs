using MiBancoAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MiBancoAPI.Services.ServicioUsuario
{
    public interface IUsuarioRepositorio
    {        
        Task<string> InsertaUsuario(string nombre, string apellidos, DateTime fechaNacimiento, string correoElectronico, string contraseña);

        Task<string> LoginUsuario(string correoElectronico, string contraseña);

        Task<string> LogoutUsuario(int idUsuario);

        Task<string> InsertaCuentaBancaria(int idUsuario, decimal saldoInicial, bool esCuentaPrincipal);

        Task<List<CuentaBancariaCustom>> ObtieneCuentasBancariasPorIdUsuario(int idUsuario);

        Task<string> ObtieneTokenPorIdUsuario(int idUsuario);

    }
}
