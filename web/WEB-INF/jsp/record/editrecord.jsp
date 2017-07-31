<%-- 
    Document   : editrecord
    Created on : Jun 29, 2017, 1:27:57 PM
    Author     : Hung
--%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Records</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                ${result}
                <div class="panel-heading">Edit Record</div>
                <div class="panel-body">
                    <form:form role="form" action="record/edit-record.hung" modelAttribute="record">
                        <div class="form-group">
                            <label>Record Id</label>
                            <input value="${record.getId()}" Class="form-control" placeholder="Id staff" disabled="true"/>
                            <form:input type="hidden" path="Id" value="${record.getId()}" />
                            <form:input type="hidden" path="StaffId" value="${record.getStaffId()}" />
                        </div>
                        <div class="form-group">
                            <label>Type</label>
                            <c:choose>
                                <c:when test="${record.isType() == true}">
                                    <c:set var="check" value="checked"></c:set>
                                </c:when>
                                <c:when test="${record.isType() == false}">
                                    <c:set var="check2" value="checked"></c:set>
                                </c:when>
                            </c:choose>
                            <label class="radio-inline"><form:radiobutton path="Type" value="true" checked="${check}"/>Good</label>
                            <label class="radio-inline"><form:radiobutton path="Type" value="false" checked="${check2}"/>Bad</label>
                        </div>
                        <div class="form-group">
                            <label>Reason</label>
                            <form:input path="Reason" value="${record.getReason()}" cssClass="form-control" placeholder="Reason why"/>
                        </div>
                        <div class="form-group">
                            <label>Time</label>
                            <form:input path="Time" value="${record.getTime()}" type="date" cssClass="form-control"/>
                            
                        </div> 
                            
                        <button name="btnUpdate" class="btn btn-lg btn-success btn-block">Update</button>
                        <button name="btnDelete" class="btn btn-lg btn-danger btn-block">Delete</button>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
  