<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Crear descuento para día especial</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>New DiscountWeekDay</h1>
        <h:form>
            <h:inputHidden id="validateCreateField" validator="#{discountWeekDay.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <h:outputText value="Id:"/>
                <h:inputText id="id" value="#{discountWeekDay.discountWeekDay.id}" title="Id" required="true" requiredMessage="The id field is required." />
                <h:outputText value="Description:"/>
                <h:inputText id="description" value="#{discountWeekDay.discountWeekDay.description}" title="Description" required="true" requiredMessage="The description field is required." />
                <h:outputText value="DiscountCost:"/>
                <h:inputText id="discountCost" value="#{discountWeekDay.discountWeekDay.discountCost}" title="DiscountCost" required="true" requiredMessage="The discountCost field is required." />
                <h:outputText value="WeekDay:"/>
                <h:inputText id="weekDay" value="#{discountWeekDay.discountWeekDay.weekDay}" title="WeekDay" required="true" requiredMessage="The weekDay field is required." />

            </h:panelGrid>
            <br />
            <h:commandLink action="#{discountWeekDay.create}" value="Create"/>
            <br />
            <br />
            <h:commandLink action="#{discountWeekDay.listSetup}" value="Show All DiscountWeekDay Items" immediate="true"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
