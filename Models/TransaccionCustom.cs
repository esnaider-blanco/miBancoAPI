using System;
using System.ComponentModel.DataAnnotations;

namespace MiBancoAPI.Models
{
    public class TransaccionCustom
    {
        [Key]
        public int IdTransaccion { get; set; }
        public DateTime FechaTransaccion { get; set; }
        public string TipoTransaccion { get; set; }
        public decimal Monto { get; set; }
        public string Descripcion { get; set; }
        public string NumeroCuentaOrigen { get; set; }
        public string NombreCuentaOrigen { get; set; }
        public string NumeroCuentaDestino { get; set; }
        public string NombreCuentaDestino { get; set; }

    }
}
