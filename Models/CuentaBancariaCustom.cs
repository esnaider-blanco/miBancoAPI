using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace MiBancoAPI.Models
{
    public class CuentaBancariaCustom
    {
        [Key]
        public int IdCuentaBancaria { get; set; }
        public int IdUsuario { get; set; }
        public string NumeroCuenta { get; set; }
        public decimal SaldoDisponible { get; set; }
        public bool EsCuentaPrincipal { get; set; }
        public bool EstaBloqueada { get; set; }
        public DateTime FechaCreacion { get; set; }
        public string NombreUsuario{ get; set; }
        public string ApellidosUsuario { get; set; }
    }
}
