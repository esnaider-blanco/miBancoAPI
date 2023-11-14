using System;
using System.Collections.Generic;

#nullable disable

namespace MiBancoAPI.Models
{
    public partial class TiposTransaccion
    {
        public TiposTransaccion()
        {
            Transacciones = new HashSet<Transaccione>();
        }

        public int IdTipoTransaccion { get; set; }
        public string TipoTransaccion { get; set; }

        public virtual ICollection<Transaccione> Transacciones { get; set; }
    }
}
