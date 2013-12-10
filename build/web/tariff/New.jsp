<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Crear nueva tarifa</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Crear nueva tarifa</h1>
        <h:form>
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />&raquo; <h:commandLink action="#{tariff.listSetup}" value="Lista de tarifas" immediate="true"/>
            <br />
            <br />
            <h:inputHidden id="validateCreateField" validator="#{tariff.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <%--
                <h:outputText value="Id:"/>
                <h:inputText id="id" value="#{tariff.tariff.id}" title="Id" required="true" requiredMessage="The id field is required." />
                --%>
                <h:outputText value="Operador de origen:"/>
                <h:selectOneMenu value="#{tariff.tariff.originOperator}" id="originOperator" title="OriginOperator" required="true" requiredMessage="The originOperator field is required." >
                    <f:selectItems value="#{operator.operatorNames}" />
                </h:selectOneMenu>
                <h:outputText value="Operador de destino:"/>
                <h:selectOneMenu id="destinationOperator" value="#{tariff.tariff.destinationOperator}" title="DestinationOperator" required="true" requiredMessage="The destinationOperator field is required." >
                    <f:selectItems value="#{operator.operatorNames}" />
                </h:selectOneMenu>
                <h:outputText value="Valor de la tarifa por minuto:"/>
                <h:inputText id="valueFee" value="#{tariff.tariff.valueFee}" title="ValueFee" required="true" requiredMessage="The valueFee field is required." />

            </h:panelGrid>
            <br />
            <h:commandLink action="#{tariff.create}" value="Crear tarifa"/>
        </h:form>
        </body>
    </html>
</f:view>
