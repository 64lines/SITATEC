<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Tariff Detail</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Tariff Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Id:"/>
                <h:outputText value="#{tariff.tariff.id}" title="Id" />
                <h:outputText value="OriginOperator:"/>
                <h:outputText value="#{tariff.tariff.originOperator}" title="OriginOperator" />
                <h:outputText value="DestinationOperator:"/>
                <h:outputText value="#{tariff.tariff.destinationOperator}" title="DestinationOperator" />
                <h:outputText value="ValueFee:"/>
                <h:outputText value="#{tariff.tariff.valueFee}" title="ValueFee" />


            </h:panelGrid>
            <br />
            <h:commandLink action="#{tariff.destroy}" value="Destroy">
                <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][tariff.tariff][tariff.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{tariff.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][tariff.tariff][tariff.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{tariff.createSetup}" value="New Tariff" />
            <br />
            <h:commandLink action="#{tariff.listSetup}" value="Show All Tariff Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
