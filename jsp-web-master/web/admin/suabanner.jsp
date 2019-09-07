<%-- 
    Document   : themmoisanpham
    Created on : Nov 14, 2018, 3:21:06 PM
    Author     : 500PING-PC
--%>

<%@page import="ktt.dao.BannerDAO"%>
<%@page import="ktt.model.Banner"%>
<%@page import="ktt.dao.SanPhamDAO"%>
<%@page import="ktt.model.SanPham"%>
<%@page import="ktt.model.LoaiSP"%>
<%@page import="ktt.dao.LoaiSpDAO"%>
<%@page import="java.util.ArrayList"%>
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
                $("#input-file").change(function () {
                    var fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'bmp'];
                    if ($.inArray($(this).val().split('.').pop().toLowerCase(), fileExtension) === -1) {
                        $('#input-file')[0].setCustomValidity("Không phải định dạng ảnh");
                    } else {
                        $('#input-file')[0].setCustomValidity("");
                    }
                });
            });

            function previewFile() {
                var preview = document.querySelector('img');
                var file = document.querySelector('input[type=file]').files[0];
                var reader = new FileReader();

                reader.addEventListener("load", function () {
                    preview.src = reader.result;
                }, false);

                if (file) {
                    reader.readAsDataURL(file);
                }
            }
        </script>

    </head>

    <body>
        <%
            Banner bn = BannerDAO.getBN(request.getParameter("MaBN"));
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
                            <h1 class="page-header">Thêm mới banner</h1>
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
                                            <form role="form" action="/KTT_-_SHOP/UploadFile" method="post" enctype="multipart/form-data">
                                                <div class="form-group">
                                                    <label>Mã banner</label>
                                                    <input type="text" value="<%= bn.getMaBN()%>" name="sbnMBN" class="form-control" readonly="" required="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Tiêu đề</label>
                                                    <input type="text" value="<%= bn.getTieuDe()%>" maxlength="255" name="sbnTD" class="form-control" placeholder="Nhập tiêu đề" required="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Nội dung</label>
                                                    <textarea class="form-control" name="sbnND" maxlength="255" rows="3" style="resize: none;" placeholder="Nhập nội dung" required="true"><%= bn.getNoiDung()%></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label>Hình ảnh</label>
                                                    <input type="file" id="input-file" name="sbnImage" accept="image/*" onchange="previewFile()">
                                                    <img src="../images/home/<%= bn.getImage()%>" id="showImage" style="height: 450px;width: 450px" alt="Banner preview..."/>
                                                    <input type="text" name="sbnImage1" value="<%= bn.getImage()%>" hidden="">
                                                </div>
                                                <div class="form-group">
                                                    <label>Landing page</label>
                                                    <input type="url" value="<%= bn.getUrl()%>" maxlength="255" name="sbnURL" class="form-control" placeholder="example: https://www.youtube.com/" required="true">
                                                </div>
                                                <input type="submit" name="action" value="Update Banner" class="btn btn-default"/>
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
