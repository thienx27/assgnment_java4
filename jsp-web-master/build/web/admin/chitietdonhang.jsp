<%-- 
    Document   : chitietdonhang
    Created on : Nov 17, 2018, 8:58:12 PM
    Author     : 500PING-LT
--%>

<%@page import="ktt.dao.DonHangDAO"%>
<%@page import="ktt.model.DonHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="ktt.dao.DonHangChiTietDAO"%>
<%@page import="ktt.model.DonHangChiTiet"%>
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

        </script>

    </head>

    <body>
        <%
            DonHang dh = DonHangDAO.getDH(request.getParameter("MaDH"));
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
                                <h1 class="page-header">Chi tiết đơn hàng</h1>
                            </div>
                            <!-- /.col-lg-12 -->
                        </div>
                        <!-- /.row -->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        Thông tin đơn hàng
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <form role="form" action="/KTT_-_SHOP/AdController" method="post" onsubmit=" return checkSubmit()">
                                                    <div class="form-group">
                                                        <label>Mã đơn hàng</label>
                                                        <input type="text" value="<%= request.getParameter("MaDH")%>" class="form-control" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Tên khách hàng</label>
                                                    <input type="text" value="<%= dh.getTenKH()%>" class="form-control" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Số điện thoại</label>
                                                    <input type="text" value="<%= dh.getDienThoai()%>" class="form-control" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Địa chỉ người nhận</label>
                                                    <input type="text" value="<%= dh.getDiaChi()%>" class="form-control" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Tổng tiền</label>
                                                    <input type="number" value="<%= dh.getTongTien()%>" class="form-control" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Ngày xuất</label>
                                                    <input type="text" value="<%= dh.getNgayXuat()%>" class="form-control" readonly="true">
                                                </div>
                                                <div class="form-group">
                                                    <label>Mô tả</label>
                                                    <textarea class="form-control" style="resize: none;" readonly="true"><%= dh.getMoTa()%></textarea>
                                                </div>
                                                <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                    <thead>
                                                        <tr>
                                                            <th>Mã sản phẩm</th>
                                                            <th>Tên sản phẩm</th>
                                                            <th>Đơn giá</th>
                                                            <th>Số lượng</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%
                                                            ArrayList <DonHangChiTiet> ls = DonHangChiTietDAO.getDHCT(request.getParameter("MaDH"));
                                                            for (DonHangChiTiet dhct : ls){
                                                        %>
                                                        <tr class="odd gradeX">
                                                            <td><%= dhct.getMaSP()%></td>
                                                            <td><%= dhct.getTenSP()%></td>
                                                            <td><%= dhct.getDonGia()%></td>
                                                            <td><%= dhct.getSoLuong()%></td>
                                                        </tr>
                                                        <%}%>
                                                    </tbody>
                                                </table>
                                                <a href="danhsachdonhang.jsp" class="btn btn-default">Back to table</a>
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
