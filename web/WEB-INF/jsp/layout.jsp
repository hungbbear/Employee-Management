<%@include file="header.jsp" %>
<body>
<div id="wrapper">
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.hung">Hung Admin v1.0</a>
            </div>
            <!-- /.navbar-header -->
            <ul class="nav navbar-top-links navbar-right">
         
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                    <c:choose>
                    <c:when test="${!not empty cookie.USERNAME.value}">
                        <li><a href="member/login.hung"><i class="fa fa-user fa-fw"></i> Login</a></li>
                        <li><a href="member/new.hung"><i class="fa fa-user fa-fw"></i> Register</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="member/logout.hung"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </c:otherwise>
                    </c:choose>
                        
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
    <!-- Page Content -->
        <jsp:include page="${param.view}"></jsp:include>
        
    
</div>
</body>
<%@include file="footer.jsp" %>