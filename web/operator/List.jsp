<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Lista de operadores</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Lista de operadores</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />
            <br />
            <h:commandLink action="#{operator.createSetup}" value="Crear nuevo operador"/>
            <br />
            <br />
            <h:outputText escape="false" value="(No hay operadores disponibles)<br />" rendered="#{operator.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{operator.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{operator.pagingInfo.firstItem + 1}..#{operator.pagingInfo.lastItem} of #{operator.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{operator.prev}" value="Previous #{operator.pagingInfo.batchSize}" rendered="#{operator.pagingInfo.firstItem >= operator.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{operator.next}" value="Next #{operator.pagingInfo.batchSize}" rendered="#{operator.pagingInfo.lastItem + operator.pagingInfo.batchSize <= operator.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{operator.next}" value="Remaining #{operator.pagingInfo.itemCount - operator.pagingInfo.lastItem}"
                               rendered="#{operator.pagingInfo.lastItem < operator.pagingInfo.itemCount && operator.pagingInfo.lastItem + operator.pagingInfo.batchSize > operator.pagingInfo.itemCount}"/>
                <h:dataTable value="#{operator.operatorItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                            <h:outputText value="Nombre del operador"/>
                        </f:facet>
                        <h:outputText value="#{item.operatorName}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Rango inicial de numeración"/>
                        </f:facet>
                        <h:outputText value="#{item.initialRange}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Rango final de numeración"/>
                        </f:facet>
                        <h:outputText value="#{item.finalRange}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="Acciones"/>
                        </f:facet>
                        <h:commandLink value="Mostrar" action="#{operator.detailSetup}">
                            <f:param name="jsfcrud.currentOperator" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][operator.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <br />
                        <h:commandLink value="Modificar" action="#{operator.editSetup}">
                            <f:param name="jsfcrud.currentOperator" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][operator.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <br />
                        <h:commandLink value="Eliminar" onclick="if (!confirm('¿Está seguro que desea eliminar este registro?')) return false" action="#{operator.destroy}">
                            <f:param name="jsfcrud.currentOperator" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][operator.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>            
        </h:form>
        </body>
    </html>
</f:view>
