<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing PhoneCall Items</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listing PhoneCall Items</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No PhoneCall Items Found)<br />" rendered="#{phoneCall.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{phoneCall.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{phoneCall.pagingInfo.firstItem + 1}..#{phoneCall.pagingInfo.lastItem} of #{phoneCall.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{phoneCall.prev}" value="Previous #{phoneCall.pagingInfo.batchSize}" rendered="#{phoneCall.pagingInfo.firstItem >= phoneCall.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{phoneCall.next}" value="Next #{phoneCall.pagingInfo.batchSize}" rendered="#{phoneCall.pagingInfo.lastItem + phoneCall.pagingInfo.batchSize <= phoneCall.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{phoneCall.next}" value="Remaining #{phoneCall.pagingInfo.itemCount - phoneCall.pagingInfo.lastItem}"
                               rendered="#{phoneCall.pagingInfo.lastItem < phoneCall.pagingInfo.itemCount && phoneCall.pagingInfo.lastItem + phoneCall.pagingInfo.batchSize > phoneCall.pagingInfo.itemCount}"/>
                <h:dataTable value="#{phoneCall.phoneCallItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Id"/>
                        </f:facet>
                        <h:outputText value="#{item.id}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="OriginNumber"/>
                        </f:facet>
                        <h:outputText value="#{item.originNumber}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="DestinationNumber"/>
                        </f:facet>
                        <h:outputText value="#{item.destinationNumber}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="StartTime"/>
                        </f:facet>
                        <h:outputText value="#{item.startTime}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="EndTime"/>
                        </f:facet>
                        <h:outputText value="#{item.endTime}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Show" action="#{phoneCall.detailSetup}">
                            <f:param name="jsfcrud.currentPhoneCall" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][phoneCall.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{phoneCall.editSetup}">
                            <f:param name="jsfcrud.currentPhoneCall" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][phoneCall.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{phoneCall.destroy}">
                            <f:param name="jsfcrud.currentPhoneCall" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][phoneCall.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{phoneCall.createSetup}" value="New PhoneCall"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />


        </h:form>
        </body>
    </html>
</f:view>
