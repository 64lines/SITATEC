<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<%@taglib uri="http://myfaces.apache.org/tomahawk" prefix="t" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
            <title>Lista de llamadas telefónicas</title>
            <link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
        <h:panelGroup id="messagePanel" layout="block">
            <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
        </h:panelGroup>
        <h1>Lista de llamadas telefónicas</h1>
        <h:form styleClass="jsfcrud_list_form">
            <h:commandLink value="Menú principal" action="welcome" immediate="true" />
            <br />
            <br />
            <h:commandLink action="#{phoneCall.createSetup}" value="Nueva llamada telefónica"/>
            <br />
            
            <br />
            <h:outputText escape="false" value="(No hay llamadas telefónicas disponibles)<br />" rendered="#{phoneCall.pagingInfo.itemCount == 0}" />
            <h:panelGroup rendered="#{phoneCall.pagingInfo.itemCount > 0}">
                <h:outputText value="Item #{phoneCall.pagingInfo.firstItem + 1}..#{phoneCall.pagingInfo.lastItem} of #{phoneCall.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{phoneCall.prev}" value="Previous #{phoneCall.pagingInfo.batchSize}" rendered="#{phoneCall.pagingInfo.firstItem >= phoneCall.pagingInfo.batchSize}"/>&nbsp;
                <h:commandLink action="#{phoneCall.next}" value="Next #{phoneCall.pagingInfo.batchSize}" rendered="#{phoneCall.pagingInfo.lastItem + phoneCall.pagingInfo.batchSize <= phoneCall.pagingInfo.itemCount}"/>&nbsp;
                <h:commandLink action="#{phoneCall.next}" value="Remaining #{phoneCall.pagingInfo.itemCount - phoneCall.pagingInfo.lastItem}"
                               rendered="#{phoneCall.pagingInfo.lastItem < phoneCall.pagingInfo.itemCount && phoneCall.pagingInfo.lastItem + phoneCall.pagingInfo.batchSize > phoneCall.pagingInfo.itemCount}"/>
                <h:dataTable value="#{phoneCall.phoneCallItems}" var="item" border="0" cellpadding="2" cellspacing="0" rowClasses="jsfcrud_odd_row,jsfcrud_even_row" rules="all" style="border:solid 1px">
                    <%--
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Id"/>
                        </f:facet>
                        <h:outputText value="#{item.id}"/>
                    </h:column>
                    --%>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Número de origen"/>
                        </f:facet>
                        <h:outputText value="#{item.originNumber}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Operador del número de origen"/>
                        </f:facet>
                        <h:outputText value="#{item.originOperadorName}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Número de destino"/>
                        </f:facet>
                        <h:outputText value="#{item.destinationNumber}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Operador del número de destino"/>
                        </f:facet>
                        <h:outputText value="#{item.destinationOperadorName}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Hora inicial de la llamada"/>
                        </f:facet>
                        <h:outputText value="#{item.startTime}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Hora final de la llamada"/>
                        </f:facet>
                        <h:outputText value="#{item.endTime}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Duración"/>
                        </f:facet>
                        <h:outputText value="#{item.duration}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText value="Valor total"/>
                        </f:facet>
                        <h:outputText value="$ #{item.cost}"/>
                    </h:column>
                    <h:column>
                        <f:facet name="header">
                            <h:outputText escape="false" value="Acciones"/>
                        </f:facet>
                        <h:commandLink value="Ver" action="#{phoneCall.detailSetup}">
                            <f:param name="jsfcrud.currentPhoneCall" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][phoneCall.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <br />
                        <h:commandLink value="Modificar" action="#{phoneCall.editSetup}">
                            <f:param name="jsfcrud.currentPhoneCall" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][phoneCall.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                        <br />
                        <h:commandLink value="Eliminar" onclick="if (!confirm('¿Está seguro que desea eliminar este registro?')) return false" action="#{phoneCall.destroy}">
                            <f:param name="jsfcrud.currentPhoneCall" value="#{jsfcrud_class['com.sitatec.bean.util.JsfUtil'].jsfcrud_method['getAsConvertedString'][item][phoneCall.converter].jsfcrud_invoke}"/>
                        </h:commandLink>
                    </h:column>
                </h:dataTable>
            </h:panelGroup>
            <br />
            <h:form enctype="multipart/form-data">
                <t:inputFileUpload id="uploadedFile" value="#{phoneCall.uploadedFile}" size="20" />
                <h:commandButton value="Cargar" action="#{phoneCall.upload}" />
            </h:form>
        </h:form>
        </body>
    </html>
</f:view>
