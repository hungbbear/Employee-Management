<%-- 
    Document   : layoutmember
    Created on : Jun 30, 2017, 9:32:33 AM
    Author     : Hung
--%>

<%@include file="header.jsp" %>
<body>
<div id="wrapper">
    <%@include file="navigation.jsp" %>
    <!-- Page Content -->
            <div id="page-wrapper"><div class="container-fluid">
                    
        <jsp:include page="${param.view}"></jsp:include>
        </div></div>
    
</div>
</body>
<%@include file="footer.jsp" %>
