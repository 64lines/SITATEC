<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%--
    This file is an entry point for JavaServer Faces application.
--%>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
            <title>JSP Page</title>
<link rel="stylesheet" type="text/css" href="/Sitatec_Project/faces/jsfcrud.css" />
        </head>
        <body>
            <h1><h:outputText value="Proyecto SITATEC"/></h1>
            <h2><h:outputText value="Menú principal"/></h2>
                <h:form>
                    <h:commandLink action="#{person.listSetup}" value="Usuarios"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{tariff.listSetup}" value="Tarifas"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{phoneCall.listSetup}" value="Llamadas telefónicas"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{operator.listSetup}" value="Operadores"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{discountWeekDay.listSetup}" value="Descuentos de días de semana"/>
                </h:form>

                <h:form>
                    <h:commandLink action="#{discountHolyDate.listSetup}" value="Descuentos de días especiales"/>
                </h:form>

        </body>
    </html>
</f:view>
