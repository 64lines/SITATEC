<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Lista de usuarios</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Lista de usuarios</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />
            <br/>
            <br/>
            <h:commandLink action="#{person.createSetup}" value="Crear nuevo usuario"/>
            <br/>
            <br/>
            <h:outputText escape="false" value="(No Person Items Found)<br />" rendered="#{person.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{person.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{person.pagingInfo.firstItem + 1}..#{person.pagingInfo.lastItem} of #{person.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{person.prev}" value="Previous #{person.pagingInfo.batchSize}" rendered="#{person.pagingInfo.firstItem >= person.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{person.next}" value="Next #{person.pagingInfo.batchSize}" rendered="#{person.pagingInfo.lastItem + person.pagingInfo.batchSize <= person.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{person.next}" value="Remaining #{person.pagingInfo.itemCount - person.pagingInfo.lastItem}"
                               rendered="#{person.pagingInfo.lastItem < person.pagingInfo.itemCount && person.pagingInfo.lastItem + person.pagingInfo.batchSize > person.pagingInfo.itemCount}"/>
                <h:dataTable value="#{person.personItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
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
                            <h:outputText value="Nombre de usuario"/>
                        </f:facet>
                        <h:outputText value="#{item.username}"/>
                    </h:column>
                    <%--
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Contraseña"/>
                        </f:facet>
                        <h:outputText value="#{item.password}"/>
                    </h:column>
                    --%>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Nombres"/>
                        </f:facet>
                        <h:outputText value="#{item.firstName}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Apellidos"/>
                        </f:facet>
                        <h:outputText value="#{item.lastName}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Teléfono celular"/>
                        </f:facet>
                        <h:outputText value="#{item.mobilePhone}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Teléfono fijo"/>
                        </f:facet>
                        <h:outputText value="#{item.phone}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Dirección"/>
                        </f:facet>
                        <h:outputText value="#{item.address}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Administrador"/>
                        </f:facet>
                        <h:selectBooleanCheckbox id="isSuperuser" value="#{item.booleanIsSuperUser}" />
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Ver" action="#{person.detailSetup}">
                            <f:param name="jsfcrud.currentPerson" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][person.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <br/>
                        <h:commandLink value="Modificar" action="#{person.editSetup}">
                            <f:param name="jsfcrud.currentPerson" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][person.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <br/>
                        <h:commandLink value="Eliminar" action="#{person.destroy}">
                            <f:param name="jsfcrud.currentPerson" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][person.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
        </h:form>
        </body>
    </html>
</f:view>
