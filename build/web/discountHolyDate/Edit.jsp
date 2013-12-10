<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Modificar descuento para día especial</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Modificar descuento para día especial</h1>
        <h:form>
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />&raquo; <h:commandLink action="#{discountHolyDate.listSetup}" value="Lista de descuentos para días especiales" immediate="true"/>
            <br />
            <br />
            <h:panelGrid columns="2">
                <%--
                <h:outputText value="Id:"/>
                <h:outputText value="#{discountHolyDate.discountHolyDate.id}" title="Id" />
                --%>
                <h:outputText value="Descripción:"/>
                <h:inputText id="description" value="#{discountHolyDate.discountHolyDate.description}" title="Description" required="true" requiredMessage="The description field is required." />
                <h:outputText value="Valor del descuento:"/>
                <h:inputText id="discountCost" value="#{discountHolyDate.discountHolyDate.discountCost}" title="DiscountCost" required="true" requiredMessage="The discountCost field is required." />
                <h:outputText value="Fecha del día especial:"/>
                <h:inputText id="discountDate" value="#{discountHolyDate.discountHolyDate.discountDate}" title="DiscountDate" required="true" requiredMessage="The discountDate field is required." />
            </h:panelGrid>
            <br />
            <h:commandLink action="#{discountHolyDate.edit}" value="Guardar">
                <f:param name="jsfcrud.currentDiscountHolyDate" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountHolyDate.discountHolyDate][discountHolyDate.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{discountHolyDate.detailSetup}" value="Detalle de descuento para día especial" immediate="true">
                <f:param name="jsfcrud.currentDiscountHolyDate" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountHolyDate.discountHolyDate][discountHolyDate.converter].jsfcrud_invoke}"/>
            </h:commandLink>
        </h:form>
        </body>
    </html>
</f:view>
