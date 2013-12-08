<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Operator Detail</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Operator Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Id:"/>
                <h:outputText value="#{operator.operator.id}" title="Id" />
                <h:outputText value="OperatorName:"/>
                <h:outputText value="#{operator.operator.operatorName}" title="OperatorName" />
                <h:outputText value="InitialRange:"/>
                <h:outputText value="#{operator.operator.initialRange}" title="InitialRange" />
                <h:outputText value="FinalRange:"/>
                <h:outputText value="#{operator.operator.finalRange}" title="FinalRange" />


            </h:panelGrid>
            <br />
            <h:commandLink action="#{operator.destroy}" value="Destroy">
                <f:param name="jsfcrud.currentOperator" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][operator.operator][operator.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{operator.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentOperator" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][operator.operator][operator.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{operator.createSetup}" value="New Operator" />
            <br />
            <h:commandLink action="#{operator.listSetup}" value="Show All Operator Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
