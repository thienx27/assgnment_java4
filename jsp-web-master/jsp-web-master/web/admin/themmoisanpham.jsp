<%-- 
    Document   : themmoisanpham
    Created on : Nov 14, 2018, 3:21:06 PM
    Author     : 500PING-PC
--%>

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

                $('#masp').keyup(function () {
                    var masp = $('#masp').val();

                    if (masp.length === 0) {
                        $('#masp')[0].setCustomValidity('');
                    }

                    $.ajax({
                        type: 'POST',
                        data: {
                            masp: masp,
                            action: 'sanpham'
                        },
                        url: "/KTT_-_SHOP/CheckDupicate",
                        async: false,
                        success: function (data) {
                            if (data === "0") {
                                $('#masp')[0].setCustomValidity("This id has already exit");
                            } else {
                                $('#masp')[0].setCustomValidity('');
                            }
                        }
                    });
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
            
            function removeImage(){
                document.querySelector('img').src = '#';
            }
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
                                <h1 class="page-header">Thêm mới sản phẩm</h1>
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
                                                    <div class="form-group" action="/KTT_-_SHOP/AdController" method="post" enctype="multipart/form-data">
                                                        <label>Mã sản phẩm</label>
                                                        <input type="text" id="masp" name="tmspMaSP" maxlength="50" pattern="[a-zA-Z0-9]+" title="Mã sản phẩm chỉ gồm chữ và số" class="form-control" placeholder="Nhập mã sản phẩm" required="true">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Tên sản phẩm</label>
                                                        <input type="text" name="tmspTenSP" maxlength="50" class="form-control" placeholder="Nhập tên sản phẩm" required="true">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Giá tiền</label>
                                                        <input type="number" name="tmspGia" min="0" class="form-control" placeholder="Nhập giá tiền" required="true">
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Trạng thái</label>
                                                        <select class="form-control" name="tmspTrangThai">
                                                            <option value="0">Còn hàng</option>
                                                            <option value="1">Hết hàng</option>
                                                        </select>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Loại sản phẩm</label>
                                                        <select class="form-control" name="tmspLoai">
                                                        <%
                                                            ArrayList<LoaiSP> ls = LoaiSpDAO.getAll();
                                                            for (LoaiSP lsp : ls) {

                                                        %>
                                                        <option value="<%= lsp.getMaLoai()%>"><%= lsp.getTenLoai()%></option>
                                                        <%}%>
                                                    </select>
                                                </div>
                                                <div class="form-group">
                                                    <label>Nhãn hiệu</label>
                                                    <input type="text" name="tmspNhanHieu" class="form-control" maxlength="50" placeholder="Nhập nhãn hiệu" required="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Hình ảnh</label>
                                                    <input type="file" name="tmspImage" id="input-file" accept="image/*" onchange="previewFile()" required="true">
                                                    <img src="#" id="showImage" style="height: 200px"/>
                                                </div>
                                                <div class="form-group">
                                                    <label>Mô tả</label>
                                                    <textarea class="form-control" maxlength="255" name="tmspMoTa" rows="3" style="resize: none;" placeholder="Nhập mô tả" required="true"></textarea>
                                                </div>
                                                <input type="submit" name="action" value="Add Product" class="btn btn-default"/>
                                                <input type="reset" onclick="removeImage()" value="Reset Button" class="btn btn-default"/>
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
