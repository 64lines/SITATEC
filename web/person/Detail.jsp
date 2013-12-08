<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Detalle de usuario</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Detalle de usuario</h1>
        <h:form>
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />&raquo <h:commandLink action="#{person.listSetup}" value="Lista de usuarios" immediate="true"/>
            <br/>
            <br/>
            <h:panelGrid columns="2">
                <%--
                <h:outputText value="Id:"/>
                <h:outputText value="#{person.person.id}" title="Id" />
                --%>
                <h:outputText value="Nombre de usuario:"/>
                <h:outputText value="#{person.person.username}" title="Nombre de usuario" />
                <h:outputText value="Contraseña:"/>
                <h:outputText value="****" title="Contraseña" />
                <h:outputText value="Nombres:"/>
                <h:outputText value="#{person.person.firstName}" title="Nombres" />
                <h:outputText value="Apellidos:"/>
                <h:outputText value="#{person.person.lastName}" title="Apellidos" />
                <h:outputText value="Teléfono celular:"/>
                <h:outputText value="#{person.person.mobilePhone}" title="Teléfono celular" />
                <h:outputText value="Teléfono fijo:"/>
                <h:outputText value="#{person.person.phone}" title="Teléfono fijo" />
                <h:outputText value="Dirección:"/>
                <h:outputText value="#{person.person.address}" title="Dirección" />
                <h:outputText value="Administrador:"/>
                <h:selectBooleanCheckbox value="#{person.person.booleanIsSuperUser}" title="Administrador" />
            </h:panelGrid>
            <br />
            <h:commandLink action="#{person.destroy}" onclick="if (!confirm('¿Está seguro que desea eliminar este registro?')) return false" value="Eliminar">
                <f:param name="jsfcrud.currentPerson" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][person.person][person.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{person.editSetup}" value="Modificar">
                <f:param name="jsfcrud.currentPerson" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][person.person][person.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{person.createSetup}" value="Crear un nuevo usuario" />
            <br />
        </h:form>
        </body>
    </html>
</f:view>
