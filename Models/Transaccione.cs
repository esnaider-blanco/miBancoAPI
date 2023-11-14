using System;
using System.Collections.Generic;

#nullable disable

namespace MiBancoAPI.Models
{
    public partial class Transaccione
    {
        public int IdTransaccion { get; set; }
        public DateTime FechaTransaccion { get; set; }
        public int IdTipoTransaccion { get; set; }
        public int IdCuentaBancaria { get; set; }
        public int? IdCuentaBancariaOrigen { get; set; }
        public int? IdCuentaBancariaDestino { get; set; }
        public decimal Monto { get; set; }
        public string Descripcion { get; set; }

        public virtual CuentasBancaria IdCuentaBancariaDestinoNavigation { get; set; }
        public virtual CuentasBancaria IdCuentaBancariaNavigation { get; set; }
        public virtual CuentasBancaria IdCuentaBancariaOrigenNavigation { get; set; }
        public virtual TiposTransaccion IdTipoTransaccionNavigation { get; set; }
    }
}
