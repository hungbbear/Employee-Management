<%-- 
    Document   : newdepart
    Created on : Jun 25, 2017, 6:27:57 AM
    Author     : Hung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <div class="panel-heading">Create a Depart</div>
                    <div class="panel-body">
                        <form role="form" action="depart/new-depart.hung" method="POST">
                            <div class="form-group">
                                <label>Depart name</label>
                                <input name="Name" class="form-control" placeholder="Depart name"/>
                            </div>
                            <button class="btn btn-lg btn-success btn-block">Add new Depart</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

