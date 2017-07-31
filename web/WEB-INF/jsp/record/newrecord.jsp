<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
                <div class="panel-heading">New Record</div>
                <div class="panel-body">
                    <form:form role="form" action="record/new-record.hung" modelAttribute="record">
                        <div class="form-group">
                            <label>Staff Id</label>
                            <form:input path="StaffId" cssClass="form-control" placeholder="Id staff"/>
                        </div>
                        <div class="form-group">
                            <label>Type</label>
                            <label class="radio-inline"><form:radiobutton path="Type" value="true"/>Good</label>
                            <label class="radio-inline"><form:radiobutton path="Type" value="false"/>Bad</label>
                        </div>
                        <div class="form-group">
                            <label>Reason</label>
                            <form:input path="Reason" cssClass="form-control" placeholder="Reason why"/>
                        </div>
                        <div class="form-group">
                            <label>Time</label>
                            <form:input path="Time" type="date" cssClass="form-control"/>
                        </div>                            
                        <button class="btn btn-lg btn-success btn-block">Register</button>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
  