<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Editing PhoneCall</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Editing PhoneCall</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Id:"/>
                <h:outputText value="#{phoneCall.phoneCall.id}" title="Id" />
                <h:outputText value="OriginNumber:"/>
                <h:inputText id="originNumber" value="#{phoneCall.phoneCall.originNumber}" title="OriginNumber" required="true" requiredMessage="The originNumber field is required." />
                <h:outputText value="DestinationNumber:"/>
                <h:inputText id="destinationNumber" value="#{phoneCall.phoneCall.destinationNumber}" title="DestinationNumber" required="true" requiredMessage="The destinationNumber field is required." />
                <h:outputText value="StartTime:"/>
                <h:inputText id="startTime" value="#{phoneCall.phoneCall.startTime}" title="StartTime" required="true" requiredMessage="The startTime field is required." />
                <h:outputText value="EndTime:"/>
                <h:inputText id="endTime" value="#{phoneCall.phoneCall.endTime}" title="EndTime" required="true" requiredMessage="The endTime field is required." />

            </h:panelGrid>
            <br />
            <h:commandLink action="#{phoneCall.edit}" value="Save">
                <f:param name="jsfcrud.currentPhoneCall" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][phoneCall.phoneCall][phoneCall.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{phoneCall.detailSetup}" value="Show" immediate="true">
                <f:param name="jsfcrud.currentPhoneCall" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][phoneCall.phoneCall][phoneCall.converter].jsfcrud_invoke}"/>
            </h:commandLink>
            <br />
            <h:commandLink action="#{phoneCall.listSetup}" value="Show All PhoneCall Items" immediate="true"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
