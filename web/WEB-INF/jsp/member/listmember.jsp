<%-- 
    Document   : listmember
    Created on : Jun 27, 2017, 7:34:58 PM
    Author     : Hung
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Member list</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Members
            </div>
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover" id="hungtable">
                    <thead>
                        <tr class="info">
                            <th>User</th>
                            <th>Fullname</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="st" items="${members}">
                        <tr>
                            <td>${st.getUsername()}</td>
                            <td>${st.getFullname()}</td>
                            <td><a href="member/${st.getUsername()}.hung"><span class="fa fa-pencil"></span></a></td>
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
