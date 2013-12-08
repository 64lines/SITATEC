<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Operator Items</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listing Operator Items</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Operator Items Found)<br />" rendered="#{operator.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{operator.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{operator.pagingInfo.firstItem + 1}..#{operator.pagingInfo.lastItem} of #{operator.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{operator.prev}" value="Previous #{operator.pagingInfo.batchSize}" rendered="#{operator.pagingInfo.firstItem >= operator.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{operator.next}" value="Next #{operator.pagingInfo.batchSize}" rendered="#{operator.pagingInfo.lastItem + operator.pagingInfo.batchSize <= operator.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{operator.next}" value="Remaining #{operator.pagingInfo.itemCount - operator.pagingInfo.lastItem}"
                               rendered="#{operator.pagingInfo.lastItem < operator.pagingInfo.itemCount && operator.pagingInfo.lastItem + operator.pagingInfo.batchSize > operator.pagingInfo.itemCount}"/>
                <h:dataTable value="#{operator.operatorItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Id"/>
                        </f:facet>
                        <h:outputText value="#{item.id}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="OperatorName"/>
                        </f:facet>
                        <h:outputText value="#{item.operatorName}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="InitialRange"/>
                        </f:facet>
                        <h:outputText value="#{item.initialRange}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="FinalRange"/>
                        </f:facet>
                        <h:outputText value="#{item.finalRange}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Show" action="#{operator.detailSetup}">
                            <f:param name="jsfcrud.currentOperator" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][operator.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{operator.editSetup}">
                            <f:param name="jsfcrud.currentOperator" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][operator.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{operator.destroy}">
                            <f:param name="jsfcrud.currentOperator" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][operator.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{operator.createSetup}" value="New Operator"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />


        </h:form>
        </body>
    </html>
</f:view>
