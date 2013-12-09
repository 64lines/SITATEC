<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Lista de descuentos para días especiales</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Lista de descuentos para días especiales</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />
            <br />
            <br />
            <h:commandLink action="#{discountHolyDate.createSetup}" value="Nuevo descuento para día especial"/>
            <br />
            <br />
            <h:outputText escape="false" value="(No hay descuentos para días especiales disponibles)<br />" rendered="#{discountHolyDate.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{discountHolyDate.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{discountHolyDate.pagingInfo.firstItem + 1}..#{discountHolyDate.pagingInfo.lastItem} of #{discountHolyDate.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{discountHolyDate.prev}" value="Previous #{discountHolyDate.pagingInfo.batchSize}" rendered="#{discountHolyDate.pagingInfo.firstItem >= discountHolyDate.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{discountHolyDate.next}" value="Next #{discountHolyDate.pagingInfo.batchSize}" rendered="#{discountHolyDate.pagingInfo.lastItem + discountHolyDate.pagingInfo.batchSize <= discountHolyDate.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{discountHolyDate.next}" value="Remaining #{discountHolyDate.pagingInfo.itemCount - discountHolyDate.pagingInfo.lastItem}"
                               rendered="#{discountHolyDate.pagingInfo.lastItem < discountHolyDate.pagingInfo.itemCount && discountHolyDate.pagingInfo.lastItem + discountHolyDate.pagingInfo.batchSize > discountHolyDate.pagingInfo.itemCount}"/>
                <h:dataTable value="#{discountHolyDate.discountHolyDateItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Id"/>
                        </f:facet>
                        <h:outputText value="#{item.id}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Descripción"/>
                        </f:facet>
                        <h:outputText value="#{item.description}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Valor del descuento"/>
                        </f:facet>
                        <h:outputText value="$ #{item.discountCost}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Fecha del día especial"/>
                        </f:facet>
                        <h:outputText value="#{item.discountDate}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="Acciones"/>
                        </f:facet>
                        <h:commandLink value="Ver" action="#{discountHolyDate.detailSetup}">
                            <f:param name="jsfcrud.currentDiscountHolyDate" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][discountHolyDate.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <br />
                        <h:commandLink value="Modificar" action="#{discountHolyDate.editSetup}">
                            <f:param name="jsfcrud.currentDiscountHolyDate" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][discountHolyDate.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <br />
                        <h:commandLink action="#{discountHolyDate.destroy}" onclick="if (!confirm('¿Está seguro que desea eliminar este registro?')) return false" value="Eliminar">
                            <f:param name="jsfcrud.currentDiscountHolyDate" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][discountHolyDate.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            


        </h:form>
        </body>
    </html>
</f:view>
