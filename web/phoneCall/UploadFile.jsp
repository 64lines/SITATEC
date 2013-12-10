<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Subir archivo de llamadas</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Subir archivo de llamadas</h1>

        <h:form>
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />&raquo; <h:commandLink action="#{phoneCall.listSetup}" value="Lista de llamadas telefónicas"/>
            <br />
            <br />
            <h:outputLabel value="Pegue aquí el archivo separado por (;)."/>
            <br />
            <h:outputLabel value="Texto del archivo de llamadas:"/>
            <br />
            <h:inputTextarea value="#{phoneCall.textFileCalls}" cols="100" rows="10"/>
            <br/>
            <h:commandLink action="#{phoneCall.uploadCallFile}" value="Subir archivo de llamadas"/>
        </h:form>
        </body>
    </html>
</f:view>