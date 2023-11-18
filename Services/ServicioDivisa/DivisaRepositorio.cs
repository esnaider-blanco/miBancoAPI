using Newtonsoft.Json;
using System;
using System.Threading.Tasks;
using System.Xml;

namespace MiBancoAPI.Services.ServicioDivisa
{
    public class DivisaRepositorio : IDivisaRepositorio
    {
        public async Task<string> ObtieneTipoCambio()
        {
            wsBancoCentral.ObtenerIndicadoresEconomicosRequest ppCompra = new wsBancoCentral.ObtenerIndicadoresEconomicosRequest();
            ppCompra.Indicador = "317";
            ppCompra.FechaInicio = DateTime.Today.ToString("dd/MM/yyyy");
            ppCompra.FechaFinal = DateTime.Today.ToString("dd/MM/yyyy");
            ppCompra.Nombre = "Esnaider";
            ppCompra.SubNiveles = "N";
            ppCompra.CorreoElectronico = "esnaider117@gmail.com";
            ppCompra.Token = "E0NDDDDE27";

            wsBancoCentral.ObtenerIndicadoresEconomicosRequest ppVenta = new wsBancoCentral.ObtenerIndicadoresEconomicosRequest();
            ppVenta.Indicador = "318";
            ppVenta.FechaInicio = DateTime.Today.ToString("dd/MM/yyyy");
            ppVenta.FechaFinal = DateTime.Today.ToString("dd/MM/yyyy");
            ppVenta.Nombre = "Esnaider";
            ppVenta.SubNiveles = "N";
            ppVenta.CorreoElectronico = "esnaider117@gmail.com";
            ppVenta.Token = "E0NDDDDE27";

            string valorCompra = string.Empty;
            string valorVenta = string.Empty;
            string fechaTipoCambio = string.Empty;

            try
            {
                wsBancoCentral.wsindicadoreseconomicosSoapClient oo = new wsBancoCentral.wsindicadoreseconomicosSoapClient(wsBancoCentral.wsindicadoreseconomicosSoapClient.EndpointConfiguration.wsindicadoreseconomicosSoap);
                var compraResult = oo.ObtenerIndicadoresEconomicos(ppCompra);
                var ventaResult = oo.ObtenerIndicadoresEconomicos(ppVenta);

                valorCompra = this.ObtieneXmlValorEspecifico("NUM_VALOR", compraResult.ObtenerIndicadoresEconomicosResult.Nodes[1].FirstNode.ToString());
                valorVenta = this.ObtieneXmlValorEspecifico("NUM_VALOR", ventaResult.ObtenerIndicadoresEconomicosResult.Nodes[1].FirstNode.ToString());
                fechaTipoCambio = this.ObtieneXmlValorEspecifico("DES_FECHA", ventaResult.ObtenerIndicadoresEconomicosResult.Nodes[1].FirstNode.ToString());

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            var jsonResult = new
            {
                compra = valorCompra,
                venta = valorVenta,
                fechaTipoCambio = fechaTipoCambio
            };

            // Transform it to JSON object
            return JsonConvert.SerializeObject(jsonResult);
        }

        public string ObtieneXmlValorEspecifico(string nombreCampo, string xmlDoc) 
        {
            string valorCampo = string.Empty;
            XmlDocument xdoc = new XmlDocument();
            xdoc.LoadXml(xmlDoc);

            XmlNodeList nodes = xdoc.SelectNodes("//Datos_de_INGC011_CAT_INDICADORECONOMIC/INGC011_CAT_INDICADORECONOMIC");
            foreach (XmlNode node in nodes)
            {
                XmlNode campo = node.SelectSingleNode(nombreCampo);
                valorCampo = campo.InnerText;
            }
            return valorCampo;
        }
    }
}
