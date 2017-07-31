<%-- 
    Document   : editstaff
    Created on : Jun 26, 2017, 5:14:10 PM
    Author     : Hung
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Edit Staff</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            ${result}
            <div class="panel-heading">Edit a staff</div>
            <div class="panel-body">
                <form role="form" method="POST" action="staff/edit-staff.hung" modelAttribute="staff" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Id</label>
                        <input name="Id" class="form-control" value="${staff.getId()}" disabled="true"/>
                        <input type="hidden" value="${staff.getId()}" name="Idstaff"/>
                    </div>
                    <div class="form-group">
                        <label>Name</label>
                        <input name="Name" class="form-control" value="${staff.getName()}"/>
                    </div>
                    <div class="form-group">
                        <label>Gender</label><br>
                        <label name="radio-inline"><input type="radio" name="Gender" value="true" checked/>Male</label>
                        <label name="radio-inline"><input type="radio" name="Gender" value="false"/>Female</label>
                    </div>
                    <div class="form-group">
                        <label>Birthday</label>
                        <input name="Birthday" type="date" value="${staff.getBirthday()}" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Photo</label>
                        <input type="file" name="Photo" class="form-control" />
                        <input type="hidden" name="oldPhoto" value="${staff.getPhoto()}" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input name="Email" value="${staff.getEmail()}" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input name="Phone" value="${staff.getPhone()}" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Salary</label>
                        <input name="Salary" value="${staff.getSalary()}" class="form-control" />
                    </div>
                    <div class="form-group">
                        <label>Note</label>
                        <input type="text" name="Note" value="${staff.getNote()}" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Depart</label>
                        <select name="Depart" class="form-control">
                            <c:forEach var="d" items="departlist">
                                <option value="${d.getId()}">${d.getName()}</option>
                            </c:forEach>
                            
                        </select>
                    </div>
                    <button name="btnUpdate" class="btn btn-lg btn-success btn-block">Update</button>
                    <button name="btnDelete" class="btn btn-lg btn-danger btn-block">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>
