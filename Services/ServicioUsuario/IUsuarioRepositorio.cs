using System;
using System.Threading.Tasks;

namespace MiBancoAPI.Services.ServicioUsuario
{
    public interface IUsuarioRepositorio
    {        
        Task<string> InsertaUsuario(string nombre, string apellidos, DateTime fechaNacimiento, string correoElectronico, string contraseña);

        Task<string> LoginUsuario(string correoElectronico, string contraseña);

        Task<string> LogoutUsuario(int idUsuario);

        Task<string> ObtieneTokenPorIdUsuario(int idUsuario);

        Task<string> ObtieneIdUsuarioPorCorreoElectronico(string correoElectronico);
    }
}
