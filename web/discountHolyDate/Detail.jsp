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
        <h1>Detalle de descuento para día especial</h1>
        <h:form>
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />&raquo; <h:commandLink action="#{discountHolyDate.listSetup}" value="Lista de descuentos para días especiales" immediate="true"/>
            <br />
            <br />
            <h:panelGrid columns="2">
                <%--
                <h:outputText value="Id:"/>
                <h:outputText value="#{discountHolyDate.discountHolyDate.id}" title="Id" />
                --%>
                <h:outputText value="Descripción"/>
                <h:outputText value="#{discountHolyDate.discountHolyDate.description}" title="Descripción" />
                <h:outputText value="Valor del descuento:"/>
                <h:outputText value="$ #{discountHolyDate.discountHolyDate.discountCost}" title="Valor del descuento" />
                <h:outputText value="Fecha del día especial:"/>
                <h:outputText value="#{discountHolyDate.discountHolyDate.discountDate}" title="Fecha del día especial" />
            </h:panelGrid>
            <br />
            <h:commandLink action="#{discountHolyDate.destroy}" value="Eliminar" onclick="if (!confirm('¿Está seguro que desea eliminar este registro?')) return false">
                <f:param name="jsfcrud.currentDiscountHolyDate" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountHolyDate.discountHolyDate][discountHolyDate.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{discountHolyDate.editSetup}" value="Modificar">
                <f:param name="jsfcrud.currentDiscountHolyDate" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][discountHolyDate.discountHolyDate][discountHolyDate.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{discountHolyDate.createSetup}" value="Nuevo descuento para día especial" />
        </h:form>
        </body>
    </html>
</f:view>
