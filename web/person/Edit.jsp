<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Modificar usuario</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Modificar usuario</h1>
        <h:form>
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />&raquo; <h:commandLink action="#{person.listSetup}" value="Lista de usuarios" immediate="true"/>
            <br/>
            <br/>
            <h:commandLink action="#{person.detailSetup}" value="Detalle de usuario" immediate="true">
                <f:param name="jsfcrud.currentPerson" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][person.person][person.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br/>
            <br/>
            <h:panelGrid columns="2">
                <%--
                <h:outputText value="Id:"/>
                <h:outputText value="#{person.person.id}" title="Id" />
                --%>
                <h:outputText value="Nombre de usuario:"/>
                <h:inputText id="username" value="#{person.person.username}" title="Username" required="true" requiredMessage="The username field is required." />
                <h:outputText value="Contraseña:"/>
                <h:inputSecret id="password" value="#{person.person.password}" title="Password" required="true" requiredMessage="The password field is required." />
                <h:outputText value="Nombres:"/>
                <h:inputText id="firstName" value="#{person.person.firstName}" title="FirstName" required="true" requiredMessage="The firstName field is required." />
                <h:outputText value="Apellidos:"/>
                <h:inputText id="lastName" value="#{person.person.lastName}" title="LastName" required="true" requiredMessage="The lastName field is required." />
                <h:outputText value="Teléfono celular:"/>
                <h:inputText id="mobilePhone" value="#{person.person.mobilePhone}" title="MobilePhone" required="true" requiredMessage="The mobilePhone field is required." />
                <h:outputText value="Teléfono fijo:"/>
                <h:inputText id="phone" value="#{person.person.phone}" title="Phone" required="true" requiredMessage="The phone field is required." />
                <h:outputText value="Dirección:"/>
                <h:inputText id="address" value="#{person.person.address}" title="Address" required="true" requiredMessage="The address field is required." />
                <h:outputText value="Administrador:"/>
                <h:selectBooleanCheckbox id="isSuperuser" value="#{person.person.booleanIsSuperUser}" title="IsSuperuser" required="true" requiredMessage="The isSuperuser field is required." />
            </h:panelGrid>
            <br />
            <h:commandLink action="#{person.edit}" value="Guardar">
                <f:param name="jsfcrud.currentPerson" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][person.person][person.converter].jsfcrud_invoke}"/>
            </h:commandLink>
        </h:form>
        </body>
    </html>
</f:view>
