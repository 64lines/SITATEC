<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Modificar tarifa</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Modificar tarifa</h1>
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
                <h:inputText id="originOperator" value="#{tariff.tariff.originOperator}" title="Operador de origen" required="true" requiredMessage="The originOperator field is required." />
                <h:outputText value="Operador de destino:"/>
                <h:inputText id="destinationOperator" value="#{tariff.tariff.destinationOperator}" title="Operador de destino" required="true" requiredMessage="The destinationOperator field is required." />
                <h:outputText value="Valor de la tarifa por minuto:"/>
                <h:inputText id="valueFee" value="#{tariff.tariff.valueFee}" title="Valor de la tarifa por minuto" required="true" requiredMessage="The valueFee field is required." />
            </h:panelGrid>
            <br />
            <h:commandLink action="#{tariff.edit}" value="Guardar">
                <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][tariff.tariff][tariff.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{tariff.detailSetup}" value="Detalle de tarifa" immediate="true">
                <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][tariff.tariff][tariff.converter].jsfcrud_invoke}"/>
            </h:commandLink>
        </h:form>
        </body>
    </html>
</f:view>
