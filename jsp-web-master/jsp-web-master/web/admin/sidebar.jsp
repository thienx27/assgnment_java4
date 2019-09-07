<%-- 
    Document   : sidebar
    Created on : Nov 14, 2018, 2:34:03 PM
    Author     : 500PING-PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sidebar</title>
    </head>
    <body>
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li>
                        <a href="index.jsp"><i class="fa fa-dashboard fa-fw"></i> Trang chủ</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-user fa-fw"></i> Quản lý thành viên<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="danhsachthanhvien.jsp">Danh sách thành viên</a>
                            </li>
                            <li>
                                <a href="themmoithanhvien.jsp">Thêm mới thành viên</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-users fa-fw"></i> Quản lý khách hàng<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="danhsachkhachhang.jsp">Danh sách khách hàng</a>
                            </li>
                            <li>
                                <a href="themmoikhachhang.jsp">Thêm mới khách hàng</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-archive fa-fw"></i> Quản lý sản phẩm<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="danhsachsanpham.jsp">Danh sách sản phẩm</a>
                            </li>
                            <li>
                                <a href="themmoisanpham.jsp">Thêm mới sản phẩm</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-filter fa-fw"></i> Quản lý loại sp<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="danhsachloaisp.jsp">Danh sách loại sp</a>
                            </li>
                            <li>
                                <a href="themmoiloaisp.jsp">Thêm mới loại sp</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-archive fa-fw"></i> Quản lý banner<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="danhsachbanner.jsp">Danh sách banner</a>
                            </li>
                            <li>
                                <a href="themmoibanner.jsp">Thêm mới banner</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-print fa-fw"></i> Quản lý đơn hàng<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="danhsachdonhang.jsp">Danh sách đơn hàng</a>
                            </li>
                        </ul>
                        <!-- /.nav-second-level -->
                    </li>
                </ul>
            </div>
            <!-- /.sidebar-collapse -->
        </div>
    </body>
</html>
