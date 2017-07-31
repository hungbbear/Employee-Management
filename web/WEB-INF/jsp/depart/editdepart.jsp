<%-- 
    Document   : editdepart
    Created on : Jun 29, 2017, 1:28:15 PM
    Author     : Hung
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
        <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Departs</h1>
        </div>
        <!-- /.col-lg-12 -->
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    ${result}
                    <div class="panel-heading">Edit</div>
                    <div class="panel-body">
                        <form:form role="form" action="depart/edit-depart.hung" modelAttribute="depart" method="POST">
                            <div class="form-group">
                                <label>Depart Id</label>
                                <input value="${depart.getId()}" disabled="true" class="form-control" placeholder="Depart Id"/>
                                <form:input path="Id" type="hidden" value="${depart.getId()}"/>
                            </div>
                            <div class="form-group">
                                <label>Depart name</label>
                                <form:input path="Name" value="${depart.getName()}" cssClass="form-control" placeholder="Depart name"/>
                            </div>
                            <button name="btnUpdate" class="btn btn-lg btn-success btn-block">Update</button>
                            <button name="btnDelete" class="btn btn-lg btn-danger btn-block">Delete</button>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
