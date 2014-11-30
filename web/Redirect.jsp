<%-- 
    Document   : Redirect
    Created on : Jul 5, 2014, 11:39:54 PM
    Author     : eMaM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
response.sendRedirect(request.getContextPath()+"/FO/Portal.jsp");
%>