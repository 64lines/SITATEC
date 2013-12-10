<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Crear nueva llamada telefónica</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Crear nueva llamada telefónica</h1>
        <h:form>
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />&raquo; <h:commandLink action="#{phoneCall.listSetup}" value="Lista de llamadas telefónicas"/>
            <br />
            <br />
            <h:inputHidden id="validateCreateField" validator="#{phoneCall.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <%--
                <h:outputText value="Id:"/>
                <h:inputText id="id" value="#{phoneCall.phoneCall.id}" title="Id" required="true" requiredMessage="The id field is required." />
                --%>
                <h:outputText value="Número de origen:"/>
                <h:inputText id="originNumber" value="#{phoneCall.phoneCall.originNumber}" title="OriginNumber" required="true" requiredMessage="The originNumber field is required." />
                <h:outputText value="Número de destino:"/>
                <h:inputText id="destinationNumber" value="#{phoneCall.phoneCall.destinationNumber}" title="DestinationNumber" required="true" requiredMessage="The destinationNumber field is required." />
                <h:outputText value="Hora inicial de la llamada:"/>
                <h:inputText id="startTime" value="#{phoneCall.phoneCall.startTime}" title="StartTime" required="true" requiredMessage="The startTime field is required." />
                <h:outputText value="Hora final de la llamada:"/>
                <h:inputText id="endTime" value="#{phoneCall.phoneCall.endTime}" title="EndTime" required="true" requiredMessage="The endTime field is required." />

            </h:panelGrid>
            <br />
            <h:commandLink action="#{phoneCall.create}" value="Crear llamada telefónica"/>
        </h:form>
        </body>
    </html>
</f:view>
