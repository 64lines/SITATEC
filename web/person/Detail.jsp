<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Person Detail</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Person Detail</h1>
        <h:form>
            <h:panelGrid columns="2">
                <h:outputText value="Id:"/>
                <h:outputText value="#{person.person.id}" title="Id" />
                <h:outputText value="Username:"/>
                <h:outputText value="#{person.person.username}" title="Username" />
                <h:outputText value="Password:"/>
                <h:outputText value="#{person.person.password}" title="Password" />
                <h:outputText value="FirstName:"/>
                <h:outputText value="#{person.person.firstName}" title="FirstName" />
                <h:outputText value="LastName:"/>
                <h:outputText value="#{person.person.lastName}" title="LastName" />
                <h:outputText value="MobilePhone:"/>
                <h:outputText value="#{person.person.mobilePhone}" title="MobilePhone" />
                <h:outputText value="Phone:"/>
                <h:outputText value="#{person.person.phone}" title="Phone" />
                <h:outputText value="Address:"/>
                <h:outputText value="#{person.person.address}" title="Address" />
                <h:outputText value="IsSuperuser:"/>
                <h:outputText value="#{person.person.isSuperuser}" title="IsSuperuser" />
            </h:panelGrid>
            <br />
            <h:commandLink action="#{person.destroy}" value="Destroy">
                <f:param name="jsfcrud.currentPerson" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][person.person][person.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <br />
            <h:commandLink action="#{person.editSetup}" value="Edit">
                <f:param name="jsfcrud.currentPerson" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][person.person][person.converter].jsfcrud_invoke}" />
            </h:commandLink>
            <br />
            <h:commandLink action="#{person.createSetup}" value="New Person" />
            <br />
            <h:commandLink action="#{person.listSetup}" value="Show All Person Items"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />

        </h:form>
        </body>
    </html>
</f:view>
