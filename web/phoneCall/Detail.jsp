<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Detalle de llamadas telefónicas</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Detalle de llamadas telefónicas</h1>
        <h:form>
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />&raquo; <h:commandLink action="#{phoneCall.listSetup}" value="Lista de llamadas telefónicas"/>
            <br />
            <br />
            <h:panelGrid columns="2">
                <%--
                <h:outputText value="Id:"/>
                <h:outputText value="#{phoneCall.phoneCall.id}" title="Id" />
                --%>
                <h:outputText value="Número de origen:"/>
                <h:outputText value="#{phoneCall.phoneCall.originNumber}" title="OriginNumber" />
                <h:outputText value="Operador del número de origen:"/>
                <h:outputText value="#{phoneCall.phoneCall.originOperadorName}" title="Operador del número de origen" />
                <h:outputText value="Número de destino:"/>
                <h:outputText value="#{phoneCall.phoneCall.destinationNumber}" title="DestinationNumber" />
                <h:outputText value="Operador del número de destino:"/>
                <h:outputText value="#{phoneCall.phoneCall.destinationOperadorName}" title="Operador del número de destino" />
                <h:outputText value="Hora inicial de la llamada:"/>
                <h:outputText value="#{phoneCall.phoneCall.startTime}" title="StartTime" />
                <h:outputText value="Hora final de la llamada:"/>
                <h:outputText value="#{phoneCall.phoneCall.endTime}" title="EndTime" />
            </h:panelGrid>
            <br />
            <h:commandLink action="#{phoneCall.destroy}" onclick="if (!confirm('¿Está seguro que desea eliminar este registro?')) return false" value="Eliminar">
                <f:param name="jsfcrud.currentPhoneCall" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][phoneCall.phoneCall][phoneCall.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{phoneCall.editSetup}" value="Modificar">
                <f:param name="jsfcrud.currentPhoneCall" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][phoneCall.phoneCall][phoneCall.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{phoneCall.createSetup}" value="Nueva llamada telefónica" />
        </h:form>
        </body>
    </html>
</f:view>
