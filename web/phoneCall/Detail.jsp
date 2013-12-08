<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>PhoneCall Detail</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>PhoneCall Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Id:"/>
                <h:outputText value="#{phoneCall.phoneCall.id}" title="Id" />
                <h:outputText value="OriginNumber:"/>
                <h:outputText value="#{phoneCall.phoneCall.originNumber}" title="OriginNumber" />
                <h:outputText value="DestinationNumber:"/>
                <h:outputText value="#{phoneCall.phoneCall.destinationNumber}" title="DestinationNumber" />
                <h:outputText value="StartTime:"/>
                <h:outputText value="#{phoneCall.phoneCall.startTime}" title="StartTime" />
                <h:outputText value="EndTime:"/>
                <h:outputText value="#{phoneCall.phoneCall.endTime}" title="EndTime" />


            </h:panelGrid>
            <br />
            <h:commandLink action="#{phoneCall.destroy}" value="Destroy">
                <f:param name="jsfcrud.currentPhoneCall" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][phoneCall.phoneCall][phoneCall.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{phoneCall.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentPhoneCall" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][phoneCall.phoneCall][phoneCall.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{phoneCall.createSetup}" value="New PhoneCall" />
            <br />
            <h:commandLink action="#{phoneCall.listSetup}" value="Show All PhoneCall Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
