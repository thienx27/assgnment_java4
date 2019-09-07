<%-- 
    Document   : themmoithanhvien
    Created on : Nov 14, 2018, 3:05:20 PM
    Author     : 500PING-PC
--%>

<%@page import="ktt.dao.NhanVienDAO"%>
<%@page import="ktt.model.NhanVien"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>KTT</title>

        <!-- Bootstrap Core CSS -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

        <!-- MetisMenu CSS -->
        <link href="vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="dist/css/sb-admin-2.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
        <!-- jQuery -->
        <script src="vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="dist/js/sb-admin-2.js"></script>
        <script>
            $(document).ready(function () {
                $('#repass').keyup(function () {
                    var pass = $('#pass').val();
                    var repass = $('#repass').val();
                    
                    $('#repass')[0].setCustomValidity("Password Don't Match");
                    
                    if (repass.length === 0){
                        $('#repass')[0].setCustomValidity('');
                    }

                    if (pass === repass) {
                        $('#repass')[0].setCustomValidity('');
                    }
                });
            });
        </script>

    </head>

    <body>
        <%
            NhanVien nv = NhanVienDAO.getNV(request.getParameter("MaNV"));
            String role = nv.getChucVu().equals("Admin")?"0":"1"; 
        %>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">

                <jsp:include page="header.jsp"></jsp:include>

                    <!-- /.navbar-top-links -->

                <jsp:include page="sidebar.jsp"></jsp:include>

                <!-- /.navbar-static-side -->
            </nav>

            <!-- Page Content -->
            <div id="page-wrapper">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Sửa thành viên</h1>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    Nhập thông tin
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <form role="form" action="/KTT_-_SHOP/AdController" method="post" onsubmit=" return checkSubmit()">
                                                <div class="form-group">
                                                    <label>Email</label>
                                                    <input type="email" id="mail" name="stvMail" class="form-control" value="<%= request.getParameter("MaNV")%>" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Password</label>
                                                    <input type="password" id="pass" name="stvPass" maxlength="50" minlength="5" value="<%= nv.getPass()%>" class="form-control" placeholder="Nhập password" required="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Re-Password</label>
                                                    <input type="password" id="repass" name="stvRePass" value="<%= nv.getPass()%>" maxlength="50" minlength="5" class="form-control" placeholder="Nhập password" required="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Họ và tên</label>
                                                    <input type="text" value="<%= nv.getTenNV()%>" name="stvName" maxlength="50" class="form-control" placeholder="Nhập họ và tên" required="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Chức vụ</label>
                                                    <select class="form-control" name="stvRole">
                                                        <option value="<%= role%>" hidden=""><%= nv.getChucVu()%></option>
                                                        <option value="0">Admin</option>
                                                        <option value="1">User</option>
                                                    </select>
                                                </div>
                                                <input type="submit" name="action" value="Update Member" class="btn btn-default"/>
                                                <input type="reset" value="Reset Button" class="btn btn-default"/>
                                            </form>
                                        </div>
                                        <!-- /.col-lg-6 (nested) -->
                                    </div>
                                    <!-- /.row (nested) -->
                                </div>
                                <!-- /.panel-body -->
                            </div>
                        </div>
                        <!-- /.col-lg-12 -->
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- /#page-wrapper -->

        </div>
        <!-- /#wrapper -->

    </body>
</html>
