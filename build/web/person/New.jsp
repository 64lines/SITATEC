<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Crear un nuevo usuario</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Crear un nuevo usuario</h1>
        <h:form>
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />&raquo; <h:commandLink action="#{person.listSetup}" value="Lista de usuarios" immediate="true"/>
            <br/>
            <br/>
            <h:inputHidden id="validateCreateField" validator="#{person.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <%--
                <h:outputText value="Id:"/>
                <h:inputText id="id" value="#{person.person.id}" title="Id" required="true" requiredMessage="The id field is required." />
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
            <h:commandLink action="#{person.create}" value="Crear usuario"/>
        </h:form>
        </body>
    </html>
</f:view>
