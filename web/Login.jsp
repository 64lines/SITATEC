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
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Ingreso</title>
            <link rel="stylesheet" type="text/css" href="/SITATEC/faces/jsfcrud.css" />
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" type="text/css" href="/SITATEC/faces/bootstrap.min.css">

            <!-- Optional theme -->
            <link rel="stylesheet" type="text/css" href="/SITATEC/faces/bootstrap-theme.min.css">

            <!-- Latest compiled and minified JavaScript -->
            <script src="/SITATEC/faces/bootstrap.min.js"></script>
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Iniciar Sesi&oacute;n</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Username:"/>
                <h:inputText id="username" value="#{registeredUser.registeredUser.username}" title="Username" required="true" requiredMessage="The username field is required." />
                <h:outputText value="Password:"/>
                <h:inputSecret id="password" value="#{registeredUser.registeredUser.password}" title="Password" required="true" requiredMessage="The password field is required." />
            </h:panelGrid>
            <h:commandButton action="#{registeredUser.loginUser}" value="Ingresar"/>
        </h:form>
        
        </body>
    </html>
</f:view>
