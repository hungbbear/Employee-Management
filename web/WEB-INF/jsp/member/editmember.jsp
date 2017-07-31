<%-- 
    Document   : editmember
    Created on : Jun 29, 2017, 1:28:07 PM
    Author     : Hung
--%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
   <%--  <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">/Member</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>--%>
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Registration</h3>
                    </div>
                    <div class="panel-body">
                        <form:form role="form" action="member/edit-member.hung" modelAttribute="user">
                            <div class="form-group">
                                <label>Username</label>
                                <form:input path="Username" value="${user.getUsername()}" cssClass="form-control" placeholder="User Name"/>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <form:input path="Password" value="${user.getPassword()}" cssClass="form-control" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <label>Fullname</label>
                                <form:input path="Fullname" value="${user.getFullname()}" cssClass="form-control" placeholder="Your Name"/>
                            </div>
                            <button name="btnUpdate" class="btn btn-lg btn-success btn-block">Update</button>
                            <button name="btnDelete" class="btn btn-lg btn-success btn-block">Update</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

