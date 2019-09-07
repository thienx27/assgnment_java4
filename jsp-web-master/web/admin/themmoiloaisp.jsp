<%-- 
    Document   : themmoiloaisp
    Created on : Nov 14, 2018, 3:21:13 PM
    Author     : 500PING-PC
--%>

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
                $('#maloai').keyup(function () {
                    var maloai = $('#maloai').val();

                    if (maloai.length === 0) {
                        $('#maloai')[0].setCustomValidity('');
                    }

                    $.ajax({
                        type: 'POST',
                        data: {
                            maloai: maloai,
                            action: 'loaisp'
                        },
                        url: "/KTT_-_SHOP/CheckDupicate",
                        async: false,
                        success: function (data) {
                            if (data === "0") {
                                $('#maloai')[0].setCustomValidity("This id has already exit");
                            } else {
                                $('#maloai')[0].setCustomValidity('');
                            }
                        }
                    });
                });
            });
        </script>

    </head>

    <body>

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
                            <h1 class="page-header">Thêm mới loại sản phẩm</h1>
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
                                                    <label>Mã loại</label>
                                                    <input type="text" id="maloai" maxlength="50" pattern="[a-zA-Z0-9]+" title="Mã loại chỉ gồm chữ và số" name="tmlML" class="form-control" placeholder="Nhập mã loại" required="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Tên loại</label>
                                                    <input type="text" name="tmlTL" maxlength="50" class="form-control" placeholder="Nhập tên loại" required="true">
                                                </div>
                                                <input type="submit" name="action" value="Add Category" class="btn btn-default"/>
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

        <!-- jQuery -->
        <script src="vendor/jquery/jquery.min.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <!-- Metis Menu Plugin JavaScript -->
        <script src="vendor/metisMenu/metisMenu.min.js"></script>

        <!-- Custom Theme JavaScript -->
        <script src="dist/js/sb-admin-2.js"></script>

    </body>
</html>
