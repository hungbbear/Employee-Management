<%-- 
    Document   : recorddetail
    Created on : Jun 27, 2017, 7:24:09 PM
    Author     : Hung
--%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">Record Detail</h1>
    </div>
    <!-- /.col-lg-12 -->
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Records
            </div>
            <div class="panel-body">
                <table width="100%" class="table table-striped table-bordered table-hover" id="hungtable">
                    <thead>
                        <tr class="info">
                            <th>Id</th>
                            <th>Type</th>
                            <th>Reason</th>
                            <th>Time</th>
                            <th>Edit</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="st" items="${records}">
                        <tr>
                            <td>${st.getId()}</td>
                            <c:choose>
                                <c:when test="${st.isType() == true}">
                                    <td>Good</td>
                                </c:when>
                                <c:otherwise>
                                    <td>Bad</td>
                                </c:otherwise>
                            </c:choose>
                            <td>${st.getReason()}</td>
                            <td>${st.getTime()}</td>
                            <td><a href="record/edit/${st.getId()}.hung"><span class="fa fa-pencil"></span></a></td>
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
