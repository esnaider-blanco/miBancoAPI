using System;
using System.Collections.Generic;

#nullable disable

namespace MiBancoAPI.Models
{
    public partial class CuentasBancaria
    {
        public CuentasBancaria()
        {
            TransaccioneIdCuentaBancariaDestinoNavigations = new HashSet<Transaccione>();
            TransaccioneIdCuentaBancariaNavigations = new HashSet<Transaccione>();
            TransaccioneIdCuentaBancariaOrigenNavigations = new HashSet<Transaccione>();
        }

        public int IdCuentaBancaria { get; set; }
        public int IdUsuario { get; set; }
        public string NumeroCuenta { get; set; }
        public decimal SaldoDisponible { get; set; }
        public bool EsCuentaPrincipal { get; set; }
        public bool EstaBloqueada { get; set; }
        public DateTime FechaCreacion { get; set; }

        public virtual Usuario IdUsuarioNavigation { get; set; }
        public virtual ICollection<Transaccione> TransaccioneIdCuentaBancariaDestinoNavigations { get; set; }
        public virtual ICollection<Transaccione> TransaccioneIdCuentaBancariaNavigations { get; set; }
        public virtual ICollection<Transaccione> TransaccioneIdCuentaBancariaOrigenNavigations { get; set; }
    }
}
