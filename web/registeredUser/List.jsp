<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Lista de los usuarios registrados</title>
            <link rel="stylesheet" type="text/css" href="/SITATEC/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Lista de los usuarios registrados</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No RegisteredUser Items Found)<br />" rendered="#{registeredUser.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{registeredUser.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{registeredUser.pagingInfo.firstItem + 1}..#{registeredUser.pagingInfo.lastItem} of #{registeredUser.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{registeredUser.prev}" value="Previous #{registeredUser.pagingInfo.batchSize}" rendered="#{registeredUser.pagingInfo.firstItem >= registeredUser.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{registeredUser.next}" value="Next #{registeredUser.pagingInfo.batchSize}" rendered="#{registeredUser.pagingInfo.lastItem + registeredUser.pagingInfo.batchSize <= registeredUser.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{registeredUser.next}" value="Remaining #{registeredUser.pagingInfo.itemCount - registeredUser.pagingInfo.lastItem}"
                               rendered="#{registeredUser.pagingInfo.lastItem < registeredUser.pagingInfo.itemCount && registeredUser.pagingInfo.lastItem + registeredUser.pagingInfo.batchSize > registeredUser.pagingInfo.itemCount}"/>
                <h:dataTable value="#{registeredUser.registeredUserItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Id"/>
                        </f:facet>
                        <h:outputText value="#{item.id}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Username"/>
                        </f:facet>
                        <h:outputText value="#{item.username}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Password"/>
                        </f:facet>
                        <h:outputText value="#{item.password}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="FirstName"/>
                        </f:facet>
                        <h:outputText value="#{item.firstName}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="LastName"/>
                        </f:facet>
                        <h:outputText value="#{item.lastName}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="MobilePhone"/>
                        </f:facet>
                        <h:outputText value="#{item.mobilePhone}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Phone"/>
                        </f:facet>
                        <h:outputText value="#{item.phone}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Address"/>
                        </f:facet>
                        <h:outputText value="#{item.address}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Show" action="#{registeredUser.detailSetup}">
                            <f:param name="jsfcrud.currentRegisteredUser" value="#{jsfcrud_class['com.sitatec.model.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][registeredUser.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{registeredUser.editSetup}">
                            <f:param name="jsfcrud.currentRegisteredUser" value="#{jsfcrud_class['com.sitatec.model.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][registeredUser.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{registeredUser.destroy}">
                            <f:param name="jsfcrud.currentRegisteredUser" value="#{jsfcrud_class['com.sitatec.model.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][registeredUser.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{registeredUser.createSetup}" value="Nuevo usuario"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />
        </h:form>
        </body>
    </html>
</f:view>
