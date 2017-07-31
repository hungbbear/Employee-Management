<%-- 
    Document   : newstaff
    Created on : May 31, 2017, 8:33:00 AM
    Author     : Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Staffs</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            ${result}
            <div class="panel-heading">Create a staff</div>
            <div class="panel-body">
                <form role="form" method="POST" action="staff/new-staff.hung" modelAttribute="staff" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Name</label>
                        <input name="Name" class="form-control" placeholder="User Name"/>
                    </div>
                    <div class="form-group">
                        <label>Gender</label>
                        <label name="radio-inline"><input type="radio" name="Gender" value="true"/>Male</label>
                        <label name="radio-inline"><input type="radio" name="Gender" value="false"/>Female</label>
                    </div>
                    <div class="form-group">
                        <label>Birthday</label>
                        <input name="Birthday" type="date" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Photo</label>
                        <input type="file" name="Photo" class="form-control" placeholder="User Name"/>
                    </div>
                    <div class="form-group">
                        <label>Email</label>
                        <input name="Email" class="form-control" placeholder="User Name"/>
                    </div>
                    <div class="form-group">
                        <label>Phone</label>
                        <input name="Phone" class="form-control" placeholder="User Name"/>
                    </div>
                    <div class="form-group">
                        <label>Salary</label>
                        <input name="Salary" class="form-control" placeholder="User Name"/>
                    </div>
                    <div class="form-group">
                        <label>Note</label>
                        <input type="text" name="Note" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label>Depart</label>
                        <select name="Depart" class="form-control">
                            <c:forEach items="${departlist}" var="d" >
                                <option value="${d.getId()}">${d.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button class="btn btn-lg btn-success btn-block">Register</button>
                </form>
            </div>
        </div>
    </div>
</div>
