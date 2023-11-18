<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://ws.sdde.bccr.fi.cr" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" targetNamespace="http://ws.sdde.bccr.fi.cr" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://ws.sdde.bccr.fi.cr">
      <s:element name="ObtenerIndicadoresEconomicos">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Indicador" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="FechaInicio" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="FechaFinal" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Nombre" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="SubNiveles" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="CorreoElectronico" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Token" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ObtenerIndicadoresEconomicosResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ObtenerIndicadoresEconomicosResult">
              <s:complexType>
                <s:sequence>
                  <s:element ref="s:schema" />
                  <s:any />
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ObtenerIndicadoresEconomicosXML">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="Indicador" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="FechaInicio" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="FechaFinal" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Nombre" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="SubNiveles" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="CorreoElectronico" type="s:string" />
            <s:element minOccurs="0" maxOccurs="1" name="Token" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ObtenerIndicadoresEconomicosXMLResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ObtenerIndicadoresEconomicosXMLResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="DataSet" nillable="true">
        <s:complexType>
          <s:sequence>
            <s:element ref="s:schema" />
            <s:any />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="string" nillable="true" type="s:string" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="ObtenerIndicadoresEconomicosSoapIn">
    <wsdl:part name="parameters" element="tns:ObtenerIndicadoresEconomicos" />
  </wsdl:message>
  <wsdl:message name="ObtenerIndicadoresEconomicosSoapOut">
    <wsdl:part name="parameters" element="tns:ObtenerIndicadoresEconomicosResponse" />
  </wsdl:message>
  <wsdl:message name="ObtenerIndicadoresEconomicosXMLSoapIn">
    <wsdl:part name="parameters" element="tns:ObtenerIndicadoresEconomicosXML" />
  </wsdl:message>
  <wsdl:message name="ObtenerIndicadoresEconomicosXMLSoapOut">
    <wsdl:part name="parameters" element="tns:ObtenerIndicadoresEconomicosXMLResponse" />
  </wsdl:message>
  <wsdl:message name="ObtenerIndicadoresEconomicosHttpGetIn">
    <wsdl:part name="Indicador" type="s:string" />
    <wsdl:part name="FechaInicio" type="s:string" />
    <wsdl:part name="FechaFinal" type="s:string" />
    <wsdl:part name="Nombre" type="s:string" />
    <wsdl:part name="SubNiveles" type="s:string" />
    <wsdl:part name="CorreoElectronico" type="s:string" />
    <wsdl:part name="Token" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ObtenerIndicadoresEconomicosHttpGetOut">
    <wsdl:part name="Body" element="tns:DataSet" />
  </wsdl:message>
  <wsdl:message name="ObtenerIndicadoresEconomicosXMLHttpGetIn">
    <wsdl:part name="Indicador" type="s:string" />
    <wsdl:part name="FechaInicio" type="s:string" />
    <wsdl:part name="FechaFinal" type="s:string" />
    <wsdl:part name="Nombre" type="s:string" />
    <wsdl:part name="SubNiveles" type="s:string" />
    <wsdl:part name="CorreoElectronico" type="s:string" />
    <wsdl:part name="Token" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ObtenerIndicadoresEconomicosXMLHttpGetOut">
    <wsdl:part name="Body" element="tns:string" />
  </wsdl:message>
  <wsdl:message name="ObtenerIndicadoresEconomicosHttpPostIn">
    <wsdl:part name="Indicador" type="s:string" />
    <wsdl:part name="FechaInicio" type="s:string" />
    <wsdl:part name="FechaFinal" type="s:string" />
    <wsdl:part name="Nombre" type="s:string" />
    <wsdl:part name="SubNiveles" type="s:string" />
    <wsdl:part name="CorreoElectronico" type="s:string" />
    <wsdl:part name="Token" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ObtenerIndicadoresEconomicosHttpPostOut">
    <wsdl:part name="Body" element="tns:DataSet" />
  </wsdl:message>
  <wsdl:message name="ObtenerIndicadoresEconomicosXMLHttpPostIn">
    <wsdl:part name="Indicador" type="s:string" />
    <wsdl:part name="FechaInicio" type="s:string" />
    <wsdl:part name="FechaFinal" type="s:string" />
    <wsdl:part name="Nombre" type="s:string" />
    <wsdl:part name="SubNiveles" type="s:string" />
    <wsdl:part name="CorreoElectronico" type="s:string" />
    <wsdl:part name="Token" type="s:string" />
  </wsdl:message>
  <wsdl:message name="ObtenerIndicadoresEconomicosXMLHttpPostOut">
    <wsdl:part name="Body" element="tns:string" />
  </wsdl:message>
  <wsdl:portType name="wsindicadoreseconomicosSoap">
    <wsdl:operation name="ObtenerIndicadoresEconomicos">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Obtiene los valores del indicador económico deseado (DataSet) para un rango de fecha determinado con formato dd/mm/yyyy (día/mes/año). Parámetros de entrada: Indicador de tipo numérico entero positivo, Fecha de inicio de tipo string , Fecha final de tipo string, Nombre de la persona que utiliza el servicio, SubNiveles (S = Si o N = No) para indicar si desea o no obtener los subniveles del indicador a consultar, correo electrónico y token de suscripción. Retorna un DataSet con los siguientes campos: Código de la variable tipo string, fecha tipo date y el valor tipo numeric. TODOS los campos son obligatorios, de no ingresar alguno de los parámetros el valor de retorno del servicio será Nothing. </wsdl:documentation>
      <wsdl:input message="tns:ObtenerIndicadoresEconomicosSoapIn" />
      <wsdl:output message="tns:ObtenerIndicadoresEconomicosSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="ObtenerIndicadoresEconomicosXML">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Obtiene los valores del indicador económico deseado (XML) para un rango de fecha determinado con formato dd/mm/yyyy (día/mes/año). Parámetros de entrada: Indicador de tipo numérico entero positivo, Fecha de inicio de tipo string , Fecha final de tipo string, Nombre de la persona que utiliza el servicio, SubNiveles (S = Si o N = No) para indicar si desea o no obtener los subniveles del indicador a consultar, correo electrónico y token de suscripción. Retorna un XML con los siguientes campos: Código de la variable tipo string, fecha tipo date y el valor tipo numeric. TODOS los campos son obligatorios, de no ingresar alguno de los parámetros el valor de retorno del servicio será Nothing. </wsdl:documentation>
      <wsdl:input message="tns:ObtenerIndicadoresEconomicosXMLSoapIn" />
      <wsdl:output message="tns:ObtenerIndicadoresEconomicosXMLSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="wsindicadoreseconomicosHttpGet">
    <wsdl:operation name="ObtenerIndicadoresEconomicos">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Obtiene los valores del indicador económico deseado (DataSet) para un rango de fecha determinado con formato dd/mm/yyyy (día/mes/año). Parámetros de entrada: Indicador de tipo numérico entero positivo, Fecha de inicio de tipo string , Fecha final de tipo string, Nombre de la persona que utiliza el servicio, SubNiveles (S = Si o N = No) para indicar si desea o no obtener los subniveles del indicador a consultar, correo electrónico y token de suscripción. Retorna un DataSet con los siguientes campos: Código de la variable tipo string, fecha tipo date y el valor tipo numeric. TODOS los campos son obligatorios, de no ingresar alguno de los parámetros el valor de retorno del servicio será Nothing. </wsdl:documentation>
      <wsdl:input message="tns:ObtenerIndicadoresEconomicosHttpGetIn" />
      <wsdl:output message="tns:ObtenerIndicadoresEconomicosHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="ObtenerIndicadoresEconomicosXML">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Obtiene los valores del indicador económico deseado (XML) para un rango de fecha determinado con formato dd/mm/yyyy (día/mes/año). Parámetros de entrada: Indicador de tipo numérico entero positivo, Fecha de inicio de tipo string , Fecha final de tipo string, Nombre de la persona que utiliza el servicio, SubNiveles (S = Si o N = No) para indicar si desea o no obtener los subniveles del indicador a consultar, correo electrónico y token de suscripción. Retorna un XML con los siguientes campos: Código de la variable tipo string, fecha tipo date y el valor tipo numeric. TODOS los campos son obligatorios, de no ingresar alguno de los parámetros el valor de retorno del servicio será Nothing. </wsdl:documentation>
      <wsdl:input message="tns:ObtenerIndicadoresEconomicosXMLHttpGetIn" />
      <wsdl:output message="tns:ObtenerIndicadoresEconomicosXMLHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="wsindicadoreseconomicosHttpPost">
    <wsdl:operation name="ObtenerIndicadoresEconomicos">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Obtiene los valores del indicador económico deseado (DataSet) para un rango de fecha determinado con formato dd/mm/yyyy (día/mes/año). Parámetros de entrada: Indicador de tipo numérico entero positivo, Fecha de inicio de tipo string , Fecha final de tipo string, Nombre de la persona que utiliza el servicio, SubNiveles (S = Si o N = No) para indicar si desea o no obtener los subniveles del indicador a consultar, correo electrónico y token de suscripción. Retorna un DataSet con los siguientes campos: Código de la variable tipo string, fecha tipo date y el valor tipo numeric. TODOS los campos son obligatorios, de no ingresar alguno de los parámetros el valor de retorno del servicio será Nothing. </wsdl:documentation>
      <wsdl:input message="tns:ObtenerIndicadoresEconomicosHttpPostIn" />
      <wsdl:output message="tns:ObtenerIndicadoresEconomicosHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="ObtenerIndicadoresEconomicosXML">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Obtiene los valores del indicador económico deseado (XML) para un rango de fecha determinado con formato dd/mm/yyyy (día/mes/año). Parámetros de entrada: Indicador de tipo numérico entero positivo, Fecha de inicio de tipo string , Fecha final de tipo string, Nombre de la persona que utiliza el servicio, SubNiveles (S = Si o N = No) para indicar si desea o no obtener los subniveles del indicador a consultar, correo electrónico y token de suscripción. Retorna un XML con los siguientes campos: Código de la variable tipo string, fecha tipo date y el valor tipo numeric. TODOS los campos son obligatorios, de no ingresar alguno de los parámetros el valor de retorno del servicio será Nothing. </wsdl:documentation>
      <wsdl:input message="tns:ObtenerIndicadoresEconomicosXMLHttpPostIn" />
      <wsdl:output message="tns:ObtenerIndicadoresEconomicosXMLHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="wsindicadoreseconomicosSoap" type="tns:wsindicadoreseconomicosSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="ObtenerIndicadoresEconomicos">
      <soap:operation soapAction="http://ws.sdde.bccr.fi.cr/ObtenerIndicadoresEconomicos" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ObtenerIndicadoresEconomicosXML">
      <soap:operation soapAction="http://ws.sdde.bccr.fi.cr/ObtenerIndicadoresEconomicosXML" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="wsindicadoreseconomicosSoap12" type="tns:wsindicadoreseconomicosSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="ObtenerIndicadoresEconomicos">
      <soap12:operation soapAction="http://ws.sdde.bccr.fi.cr/ObtenerIndicadoresEconomicos" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ObtenerIndicadoresEconomicosXML">
      <soap12:operation soapAction="http://ws.sdde.bccr.fi.cr/ObtenerIndicadoresEconomicosXML" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="wsindicadoreseconomicosHttpGet" type="tns:wsindicadoreseconomicosHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="ObtenerIndicadoresEconomicos">
      <http:operation location="/ObtenerIndicadoresEconomicos" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ObtenerIndicadoresEconomicosXML">
      <http:operation location="/ObtenerIndicadoresEconomicosXML" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="wsindicadoreseconomicosHttpPost" type="tns:wsindicadoreseconomicosHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="ObtenerIndicadoresEconomicos">
      <http:operation location="/ObtenerIndicadoresEconomicos" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ObtenerIndicadoresEconomicosXML">
      <http:operation location="/ObtenerIndicadoresEconomicosXML" />
      <wsdl:input>
        <mime:content type="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="wsindicadoreseconomicos">
    <wsdl:port name="wsindicadoreseconomicosSoap" binding="tns:wsindicadoreseconomicosSoap">
      <soap:address location="https://gee.bccr.fi.cr/Indicadores/Suscripciones/WS/wsindicadoreseconomicos.asmx" />
    </wsdl:port>
    <wsdl:port name="wsindicadoreseconomicosSoap12" binding="tns:wsindicadoreseconomicosSoap12">
      <soap12:address location="https://gee.bccr.fi.cr/Indicadores/Suscripciones/WS/wsindicadoreseconomicos.asmx" />
    </wsdl:port>
    <wsdl:port name="wsindicadoreseconomicosHttpGet" binding="tns:wsindicadoreseconomicosHttpGet">
      <http:address location="https://gee.bccr.fi.cr/Indicadores/Suscripciones/WS/wsindicadoreseconomicos.asmx" />
    </wsdl:port>
    <wsdl:port name="wsindicadoreseconomicosHttpPost" binding="tns:wsindicadoreseconomicosHttpPost">
      <http:address location="https://gee.bccr.fi.cr/Indicadores/Suscripciones/WS/wsindicadoreseconomicos.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>