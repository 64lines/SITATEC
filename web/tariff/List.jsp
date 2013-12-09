<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Lista de tarifas</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Lista de tarifas</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />
            <br />
            <br />
            <h:commandLink action="#{tariff.createSetup}" value="Crear nueva tarifa"/>
            <br />
            <br />
            <h:outputText escape="false" value="(No hay tarifas disponibles)<br />" rendered="#{tariff.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{tariff.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{tariff.pagingInfo.firstItem + 1}..#{tariff.pagingInfo.lastItem} of #{tariff.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{tariff.prev}" value="Previous #{tariff.pagingInfo.batchSize}" rendered="#{tariff.pagingInfo.firstItem >= tariff.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{tariff.next}" value="Next #{tariff.pagingInfo.batchSize}" rendered="#{tariff.pagingInfo.lastItem + tariff.pagingInfo.batchSize <= tariff.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{tariff.next}" value="Remaining #{tariff.pagingInfo.itemCount - tariff.pagingInfo.lastItem}"
                               rendered="#{tariff.pagingInfo.lastItem < tariff.pagingInfo.itemCount && tariff.pagingInfo.lastItem + tariff.pagingInfo.batchSize > tariff.pagingInfo.itemCount}"/>
                <h:dataTable value="#{tariff.tariffItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <%--
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Id"/>
                        </f:facet>
                        <h:outputText value="#{item.id}"/>
                    </h:column>
                    --%>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Operador de origen"/>
                        </f:facet>
                        <h:outputText value="#{item.originOperatorName}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Operador de destino"/>
                        </f:facet>
                        <h:outputText value="#{item.destinationOperatorName}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Valor de la tarifa por minuto"/>
                        </f:facet>
                        <h:outputText value="$ #{item.valueFee}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="Acciones"/>
                        </f:facet>
                        <h:commandLink value="Ver" action="#{tariff.detailSetup}">
                            <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][tariff.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <br />
                        <h:commandLink value="Modificar" action="#{tariff.editSetup}">
                            <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][tariff.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <br />
                        <h:commandLink value="Eliminar" action="#{tariff.destroy}" onclick="if (!confirm('¿Está seguro que desea eliminar este registro?')) return false">
                            <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][tariff.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
        </h:form>
        </body>
    </html>
</f:view>
