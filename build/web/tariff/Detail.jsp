<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Detalle de tarifa</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Detalle de tarifa</h1>
        <h:form>
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />&raquo; <h:commandLink action="#{tariff.listSetup}" value="Lista de tarifas" immediate="true"/>
            <br />
            <br />
            <h:panelGrid columns="2">
                <%--
                <h:outputText value="Id:"/>
                <h:outputText value="#{tariff.tariff.id}" title="Id" />
                --%>
                <h:outputText value="Operador de origen:"/>
                <h:outputText value="#{tariff.tariff.originOperator}" title="Operador de origen" />
                <h:outputText value="Operador de destino:"/>
                <h:outputText value="#{tariff.tariff.destinationOperator}" title="Operador de destino" />
                <h:outputText value="Valor de la tarifa por minuto:"/>
                <h:outputText value="$ #{tariff.tariff.valueFee}" title="Valor de la tarifa por minuto" />
            </h:panelGrid>
            <br />
            <h:commandLink action="#{tariff.destroy}" value="Eliminar" onclick="if (!confirm('¿Está seguro que desea eliminar este registro?')) return false">
                <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][tariff.tariff][tariff.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{tariff.editSetup}" value="Modificar">
                <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][tariff.tariff][tariff.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{tariff.createSetup}" value="Crear nueva tarifa" />
        </h:form>
        </body>
    </html>
</f:view>
