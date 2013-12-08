<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>DiscountHolyDate Detail</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>DiscountHolyDate Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Id:"/>
                <h:outputText value="#{discountHolyDate.discountHolyDate.id}" title="Id" />
                <h:outputText value="Description:"/>
                <h:outputText value="#{discountHolyDate.discountHolyDate.description}" title="Description" />
                <h:outputText value="DiscountCost:"/>
                <h:outputText value="#{discountHolyDate.discountHolyDate.discountCost}" title="DiscountCost" />
                <h:outputText value="DiscountDate:"/>
                <h:outputText value="#{discountHolyDate.discountHolyDate.discountDate}" title="DiscountDate" />


            </h:panelGrid>
            <br />
            <h:commandLink action="#{discountHolyDate.destroy}" value="Destroy">
                <f:param name="jsfcrud.currentDiscountHolyDate" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountHolyDate.discountHolyDate][discountHolyDate.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{discountHolyDate.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentDiscountHolyDate" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountHolyDate.discountHolyDate][discountHolyDate.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{discountHolyDate.createSetup}" value="New DiscountHolyDate" />
            <br />
            <h:commandLink action="#{discountHolyDate.listSetup}" value="Show All DiscountHolyDate Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
