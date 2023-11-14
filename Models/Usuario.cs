using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;


namespace MiBancoAPI.Models
{
    public partial class Usuario
    {
        public Usuario()
        {
            CuentasBancaria = new HashSet<CuentasBancaria>();
            HistoricoLogins = new HashSet<HistoricoLogin>();
        }

        [Key]
        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string CorreoElectronico { get; set; }
        public string Contraseña { get; set; }
        public string Token { get; set; }
        public bool EstaBloqueado { get; set; }
        public int IntentosFallidos { get; set; }
        public bool EstaActivo { get; set; }
        public DateTime FechaCreacion { get; set; }

        public virtual ICollection<CuentasBancaria> CuentasBancaria { get; set; }
        public virtual ICollection<HistoricoLogin> HistoricoLogins { get; set; }
    }
}
