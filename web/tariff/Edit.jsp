<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Tariff</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Editing Tariff</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Id:"/>
                <h:outputText value="#{tariff.tariff.id}" title="Id" />
                <h:outputText value="OriginOperator:"/>
                <h:inputText id="originOperator" value="#{tariff.tariff.originOperator}" title="OriginOperator" required="true" requiredMessage="The originOperator field is required." />
                <h:outputText value="DestinationOperator:"/>
                <h:inputText id="destinationOperator" value="#{tariff.tariff.destinationOperator}" title="DestinationOperator" required="true" requiredMessage="The destinationOperator field is required." />
                <h:outputText value="ValueFee:"/>
                <h:inputText id="valueFee" value="#{tariff.tariff.valueFee}" title="ValueFee" required="true" requiredMessage="The valueFee field is required." />
            </h:panelGrid>
            <br />
            <h:commandLink action="#{tariff.edit}" value="Save">
                <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][tariff.tariff][tariff.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{tariff.detailSetup}" value="Show" immediate="true">
                <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][tariff.tariff][tariff.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <h:commandLink action="#{tariff.listSetup}" value="Show All Tariff Items" immediate="true"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
