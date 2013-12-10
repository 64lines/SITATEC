<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>DiscountWeekDay Detail</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>DiscountWeekDay Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Id:"/>
                <h:outputText value="#{discountWeekDay.discountWeekDay.id}" title="Id" />
                <h:outputText value="Description:"/>
                <h:outputText value="#{discountWeekDay.discountWeekDay.description}" title="Description" />
                <h:outputText value="DiscountCost:"/>
                <h:outputText value="#{discountWeekDay.discountWeekDay.discountCost}" title="DiscountCost" />
                <h:outputText value="WeekDay:"/>
                <h:outputText value="#{discountWeekDay.discountWeekDay.weekDay}" title="WeekDay" />


            </h:panelGrid>
            <br />
            <h:commandLink action="#{discountWeekDay.destroy}" value="Destroy">
                <f:param name="jsfcrud.currentDiscountWeekDay" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountWeekDay.discountWeekDay][discountWeekDay.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{discountWeekDay.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentDiscountWeekDay" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountWeekDay.discountWeekDay][discountWeekDay.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{discountWeekDay.createSetup}" value="New DiscountWeekDay" />
            <br />
            <h:commandLink action="#{discountWeekDay.listSetup}" value="Show All DiscountWeekDay Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
