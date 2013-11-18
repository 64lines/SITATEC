<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>RegisteredUser Detail</title>
            <link rel="stylesheet" type="text/css" href="/SITATEC/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>RegisteredUser Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Id:"/>
                <h:outputText value="#{registeredUser.registeredUser.id}" title="Id" />
                <h:outputText value="Username:"/>
                <h:outputText value="#{registeredUser.registeredUser.username}" title="Username" />
                <h:outputText value="Password:"/>
                <h:outputText value="#{registeredUser.registeredUser.password}" title="Password" />
                <h:outputText value="FirstName:"/>
                <h:outputText value="#{registeredUser.registeredUser.firstName}" title="FirstName" />
                <h:outputText value="LastName:"/>
                <h:outputText value="#{registeredUser.registeredUser.lastName}" title="LastName" />
                <h:outputText value="MobilePhone:"/>
                <h:outputText value="#{registeredUser.registeredUser.mobilePhone}" title="MobilePhone" />
                <h:outputText value="Phone:"/>
                <h:outputText value="#{registeredUser.registeredUser.phone}" title="Phone" />
                <h:outputText value="Address:"/>
                <h:outputText value="#{registeredUser.registeredUser.address}" title="Address" />


            </h:panelGrid>
            <br />
            <h:commandLink action="#{registeredUser.destroy}" value="Destroy">
                <f:param name="jsfcrud.currentRegisteredUser" value="#{jsfcrud_class['com.sitatec.model.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][registeredUser.registeredUser][registeredUser.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{registeredUser.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentRegisteredUser" value="#{jsfcrud_class['com.sitatec.model.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][registeredUser.registeredUser][registeredUser.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{registeredUser.createSetup}" value="New RegisteredUser" />
            <br />
            <h:commandLink action="#{registeredUser.listSetup}" value="Show All RegisteredUser Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
