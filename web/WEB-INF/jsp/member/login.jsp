<%-- 
    Document   : login
    Created on : Jun 21, 2017, 7:21:23 AM
    Author     : Hung

        <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">/Member</h1>
        </div>
        <!-- /.col-lg-12 -->
        </div>--%>
        <div class="row">
            ${result}
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" action="member/login-member.hung" method="post">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Id" name="txtUsername" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" placeholder="Password" name="txtPassword" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="txtRemember" type="checkbox" value="true" checked>Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <button class="btn btn-lg btn-success btn-block">Login</button>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    
