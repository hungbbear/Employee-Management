<%-- 
    Document   : header
    Created on : Jun 21, 2017, 7:19:53 AM
    Author     : Hung
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<base href="${pageContext.servletContext.contextPath}/">
<!DOCTYPE html>
<%-- <% 
    String uri = request.getRequestURI();

    String pageName = uri.substring(uri.lastIndexOf("/")+1);
    pageContext.setAttribute("pageName", pageName);
%>
<c:set var="login" value="login.hung"></c:set>
<c:set var="new" value="new.hung"></c:set>
<c:choose>
    <c:when test="${cookie.USER.value ==null}">
        <c:if test="${pageName == login}">
            <c:redirect url="/member/login.hung"/>
        </c:if>
        <c:out value="${pageName}"></c:out> 
    </c:when>
</c:choose>--%>
<html lang="en">

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>

    <!-- Bootstrap Core CSS -->
    <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="resources/vendor/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="resources/vendor/font-awesome/css/font-awesome.min.css"rel="stylesheet" type="text/css">
    
    <!-- jQuery -->
    <script src="resources/vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="resources/dist/js/sb-admin-2.js"></script>
     <!-- DataTables JavaScript -->
    <script src="resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
    
</head>
