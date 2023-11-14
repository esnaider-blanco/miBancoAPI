using System;
using System.Collections.Generic;

#nullable disable

namespace MiBancoAPI.Models
{
    public partial class HistoricoLogin
    {
        public int Id { get; set; }
        public int IdUsuario { get; set; }
        public DateTime FechaInicioSesion { get; set; }
        public DateTime? FechaFinSesion { get; set; }
        public bool EstaActivo { get; set; }

        public virtual Usuario IdUsuarioNavigation { get; set; }
    }
}
