<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>Proyecto SITATEC - Ingreso</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
            <h1 id="mainTitle"><h:outputText value="Proyecto SITATEC"/></h1>
            <h2 id="mainSubtitle"><h:outputText value="Ingreso"/></h2>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table" styleClass="centerTable"/>
            </h:panelGroup>
            <h:form>
                <h:panelGrid columns="2" styleClass="centerTable">
                    <h:outputText value="Nombre de usuario:"/>
                    <h:inputText value="#{person.person.username}"/>
                    <h:outputText value="Contraseña:"/>
                    <h:inputText value="#{person.person.password}"/>
                    <br />
                    <h:commandButton action="#{person.login}" value="Ingresar"/>
                </h:panelGrid>
            </h:form>
        </body>
    </html>
</f:view>
