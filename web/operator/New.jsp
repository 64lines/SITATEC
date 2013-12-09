<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Crear nuevo operador</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Crear nuevo operador</h1>
        <h:form>
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />&raquo; <h:commandLink action="#{operator.listSetup}" value="Lista de operadores" immediate="true"/>
            <br />
            <br />
            <h:inputHidden id="validateCreateField" validator="#{operator.validateCreate}" value="value"/>
            <h:panelGrid columns="2">
                <%--
                <h:outputText value="Id:"/>
                <h:inputText id="id" value="#{operator.operator.id}" title="Id" required="true" requiredMessage="The id field is required." />
                --%>
                <h:outputText value="Nombre del operador:"/>
                <h:inputText id="operatorName" value="#{operator.operator.operatorName}" title="OperatorName" required="true" requiredMessage="The operatorName field is required." />
                <h:outputText value="NIT:"/>
                <h:inputText id="nit" value="#{operator.operator.nit}" title="Nit" required="true" requiredMessage="The operatorName field is required." />
                <h:outputText value="Correo electrónico:"/>
                <h:inputText id="email" value="#{operator.operator.email}" title="Nit" required="true" requiredMessage="The operatorName field is required." />
                <h:outputText value="Rango inicial de numeración:"/>
                <h:inputText id="initialRange" value="#{operator.operator.initialRange}" title="InitialRange" required="true" requiredMessage="The initialRange field is required." />
                <h:outputText value="Rango final de numeración:"/>
                <h:inputText id="finalRange" value="#{operator.operator.finalRange}" title="FinalRange" required="true" requiredMessage="The finalRange field is required." />
                <h:outputText value="Tipo de operador:"/>
                <h:selectOneMenu id="operatorType" value="#{operator.operator.operatorType}" title="FinalRange" required="true" requiredMessage="The finalRange field is required.">
                    <f:selectItem itemValue="0" itemLabel="Telefonía Móvil"/>
                    <f:selectItem itemValue="1" itemLabel="Telefonía Fija"/>
                </h:selectOneMenu>
            </h:panelGrid>
            <br />
            <h:commandLink action="#{operator.create}" value="Crear operador"/>
        </h:form>
        </body>
    </html>
</f:view>
