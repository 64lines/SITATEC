<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing Operator</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Editing Operator</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Id:"/>
                <h:outputText value="#{operator.operator.id}" title="Id" />
                <h:outputText value="OperatorName:"/>
                <h:inputText id="operatorName" value="#{operator.operator.operatorName}" title="OperatorName" required="true" requiredMessage="The operatorName field is required." />
                <h:outputText value="InitialRange:"/>
                <h:inputText id="initialRange" value="#{operator.operator.initialRange}" title="InitialRange" required="true" requiredMessage="The initialRange field is required." />
                <h:outputText value="FinalRange:"/>
                <h:inputText id="finalRange" value="#{operator.operator.finalRange}" title="FinalRange" required="true" requiredMessage="The finalRange field is required." />

            </h:panelGrid>
            <br />
            <h:commandLink action="#{operator.edit}" value="Save">
                <f:param name="jsfcrud.currentOperator" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][operator.operator][operator.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{operator.detailSetup}" value="Show" immediate="true">
                <f:param name="jsfcrud.currentOperator" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][operator.operator][operator.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <h:commandLink action="#{operator.listSetup}" value="Show All Operator Items" immediate="true"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
