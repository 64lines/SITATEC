<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Listing DiscountWeekDay Items</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Listing DiscountWeekDay Items</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:outputText escape="false" value="(No DiscountWeekDay Items Found)<br />" rendered="#{discountWeekDay.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{discountWeekDay.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{discountWeekDay.pagingInfo.firstItem + 1}..#{discountWeekDay.pagingInfo.lastItem} of #{discountWeekDay.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{discountWeekDay.prev}" value="Previous #{discountWeekDay.pagingInfo.batchSize}" rendered="#{discountWeekDay.pagingInfo.firstItem >= discountWeekDay.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{discountWeekDay.next}" value="Next #{discountWeekDay.pagingInfo.batchSize}" rendered="#{discountWeekDay.pagingInfo.lastItem + discountWeekDay.pagingInfo.batchSize <= discountWeekDay.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{discountWeekDay.next}" value="Remaining #{discountWeekDay.pagingInfo.itemCount - discountWeekDay.pagingInfo.lastItem}"
                               rendered="#{discountWeekDay.pagingInfo.lastItem < discountWeekDay.pagingInfo.itemCount && discountWeekDay.pagingInfo.lastItem + discountWeekDay.pagingInfo.batchSize > discountWeekDay.pagingInfo.itemCount}"/>
                <h:dataTable value="#{discountWeekDay.discountWeekDayItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Id"/>
                        </f:facet>
                        <h:outputText value="#{item.id}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Description"/>
                        </f:facet>
                        <h:outputText value="#{item.description}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="DiscountCost"/>
                        </f:facet>
                        <h:outputText value="#{item.discountCost}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="WeekDay"/>
                        </f:facet>
                        <h:outputText value="#{item.weekDay}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="&nbsp;"/>
                        </f:facet>
                        <h:commandLink value="Show" action="#{discountWeekDay.detailSetup}">
                            <f:param name="jsfcrud.currentDiscountWeekDay" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][discountWeekDay.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Edit" action="#{discountWeekDay.editSetup}">
                            <f:param name="jsfcrud.currentDiscountWeekDay" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][discountWeekDay.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <h:outputText value=" "/>
                        <h:commandLink value="Destroy" action="#{discountWeekDay.destroy}">
                            <f:param name="jsfcrud.currentDiscountWeekDay" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][discountWeekDay.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>

                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:commandLink action="#{discountWeekDay.createSetup}" value="New DiscountWeekDay"/>
            <br />
            <br />
            <h:commandLink value="Index" action="welcome" immediate="true" />


        </h:form>
        </body>
    </html>
</f:view>
