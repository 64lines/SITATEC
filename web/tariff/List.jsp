<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing Tariff Items</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listing Tariff Items</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No Tariff Items Found)<br />" rendered="#{tariff.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{tariff.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{tariff.pagingInfo.firstItem + 1}..#{tariff.pagingInfo.lastItem} of #{tariff.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{tariff.prev}" value="Previous #{tariff.pagingInfo.batchSize}" rendered="#{tariff.pagingInfo.firstItem >= tariff.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{tariff.next}" value="Next #{tariff.pagingInfo.batchSize}" rendered="#{tariff.pagingInfo.lastItem + tariff.pagingInfo.batchSize <= tariff.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{tariff.next}" value="Remaining #{tariff.pagingInfo.itemCount - tariff.pagingInfo.lastItem}"
                               rendered="#{tariff.pagingInfo.lastItem < tariff.pagingInfo.itemCount && tariff.pagingInfo.lastItem + tariff.pagingInfo.batchSize > tariff.pagingInfo.itemCount}"/>
                <h:dataTable value="#{tariff.tariffItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Id"/>
                        </f:facet>
                        <h:outputText value="#{item.id}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="OriginOperator"/>
                        </f:facet>
                        <h:outputText value="#{item.originOperator}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="DestinationOperator"/>
                        </f:facet>
                        <h:outputText value="#{item.destinationOperator}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="ValueFee"/>
                        </f:facet>
                        <h:outputText value="#{item.valueFee}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Show" action="#{tariff.detailSetup}">
                            <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][tariff.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{tariff.editSetup}">
                            <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][tariff.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{tariff.destroy}">
                            <f:param name="jsfcrud.currentTariff" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][tariff.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{tariff.createSetup}" value="New Tariff"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />


        </h:form>
        </body>
    </html>
</f:view>
