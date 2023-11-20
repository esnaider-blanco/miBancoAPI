using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace MiBancoAPI.Services
{
    public class EmailHelper
    {
        public string EnviarCorreoElectronico(string correoDestino, string asunto, string info)
        {

            string resultado = String.Empty;
            if (!String.IsNullOrEmpty(correoDestino))
            {
                try
                {
                    var correo = new MailMessage();
                    correo.From = new MailAddress("esnaider117@gmail.com");
                    correo.To.Add(correoDestino);
                    correo.Subject = asunto;
                    correo.Body = info;

                    var clienteSMTP = new SmtpClient("smtp.gmail.com", 587);
                    clienteSMTP.EnableSsl = true;
                    clienteSMTP.Credentials = new NetworkCredential("esnaider117@gmail.com", "zvororcfixwvpzhd");

                    clienteSMTP.Send(correo);
                    resultado = "Email enviado con exito.";
                }
                catch (Exception e)
                {
                    resultado = "Hubo un problema al enviar el correo. Error: " + e.Message;
                    throw;
                }
            }
            else
            {
                resultado = "El correo destino es requerido";
            }

            return resultado;
        }
    }
}
