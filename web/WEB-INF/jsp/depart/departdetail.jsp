<%-- 
    Document   : departdetail
    Created on : Jun 27, 2017, 7:29:35 PM
    Author     : Hung
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Depart Detail</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Departs
            </div>
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover" id="hungtable">
                    <thead>
                        <tr class="info">
                            <th>Id</th>
                            <th>Name</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="st" items="${departs}">
                        <tr>
                            <td>${st.getId()}</td>
                            <td>${st.getName()}</td>
                            <td><a href="depart/edit/${st.getId()}.hung"><span class="fa fa-pencil"></span></a></td>
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

