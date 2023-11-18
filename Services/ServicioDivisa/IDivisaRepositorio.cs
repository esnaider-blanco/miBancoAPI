using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MiBancoAPI.Services.ServicioDivisa
{
    public interface IDivisaRepositorio 
    {
        Task<string> ObtieneTipoCambio();
    }
}
