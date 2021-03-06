<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Detalle de operador</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
            <!-- Latest compiled and minified CSS -->
            <link rel="stylesheet" href="/Sitatec_Project/faces/bootstrap.min.css">

            <!-- Optional theme -->
            <link rel="stylesheet" href="/Sitatec_Project/faces/bootstrap-theme.min.css">

            <!-- Latest compiled and minified JavaScript -->
            <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Detalle de operador</h1>
        <h:form>
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />&raquo; <h:commandLink action="#{operator.listSetup}" value="Lista de operadores" immediate="true"/>
            <br/>
            <br/>
            <h:panelGrid columns="2">
                <%--
                <h:outputText value="Id:"/>
                <h:outputText value="#{operator.operator.id}" title="Id" />
                --%>
                <h:outputText value="Nombre del operador:"/>
                <h:outputText value="#{operator.operator.operatorName}" title="OperatorName" />
                <h:outputText value="NIT:"/>
                <h:outputText value="#{operator.operator.nit}" title="NIT" />
                <h:outputText value="Correo electrónico:"/>
                <h:outputText value="#{operator.operator.email}" title="Correo electrónico" />
                <h:outputText value="Rango inicial de numeración:"/>
                <h:outputText value="#{operator.operator.initialRange}" title="InitialRange" />
                <h:outputText value="Rango final de numeración:"/>
                <h:outputText value="#{operator.operator.finalRange}" title="FinalRange" />
                <h:outputText value="Tipo de operador:"/>
                <h:outputText value="#{operator.operator.operatorTypeName}" title="Tipo de operador" />
            </h:panelGrid>
            <br />
            <h:commandLink action="#{operator.destroy}" onclick="if (!confirm('¿Está seguro que desea eliminar este registro?')) return false" value="Eliminar">
                <f:param name="jsfcrud.currentOperator" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][operator.operator][operator.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{operator.editSetup}" value="Modificar">
                <f:param name="jsfcrud.currentOperator" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][operator.operator][operator.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{operator.createSetup}" value="Crear nuevo operador" />
            <br />
        </h:form>
        </body>
    </html>
</f:view>
