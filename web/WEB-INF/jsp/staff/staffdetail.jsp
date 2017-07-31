<%-- 
    Document   : staffdetail
    Created on : Jun 26, 2017, 3:41:04 PM
    Author     : Hung
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Staff Detail</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Staffs
            </div>
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover" id="hungtable">
                    <thead>
                        <tr class="info">
                            <th>Id</th>
                            <th>Name</th>
                            <th>Gender</th>
                            <th>Birthday</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Salary</th>
                            <th>Note</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="st" items="${staffs}">
                        <tr>
                            <td>${st.getId()}</td>
                            <td>${st.getName()}</td>
                            <c:choose>
                                <c:when test="${st.isGender() == true}">
                                    <td>Male</td>
                                </c:when>
                                <c:otherwise>
                                    <td>Female</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${st.getBirthday()}</td>
                            <td>${st.getEmail()}</td>
                            <td>${st.getPhone()}</td>
                            <td>${st.getSalary()}</td>
                            <td>${st.getNote()}</td>
                            <td><a href="staff/edit/${st.getId()}.hung"><span class="fa fa-pencil"></span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#hungtable').DataTable({
            responsive: true
        });
    });
    </script>