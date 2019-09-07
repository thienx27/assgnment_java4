<%-- 
    Document   : sidebar
    Created on : Nov 14, 2018, 9:02:28 AM
    Author     : 500PING-PC
--%>

<%@page import="ktt.model.LoaiSP"%>
<%@page import="ktt.dao.SanPhamDAO"%>
<%@page import="ktt.model.NhanHieu"%>
<%@page import="ktt.dao.LoaiSpDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sidebar</title>
    </head>
    <body>
        <div class="left-sidebar">
            <h2>Thể loại</h2>
            <div class="panel-group category-products" id="accordian"><!--category-productsr-->
                <%
                    ArrayList<LoaiSP> ls = LoaiSpDAO.getAll();
                    for (LoaiSP lsp : ls) {
                %>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title"><a href="shop.jsp?&MaLoai=<%= lsp.getMaLoai()%>"><%= lsp.getTenLoai()%></a></h4>
                    </div>
                </div>
                <%}%>
            </div><!--/category-products-->

            <div class="brands_products"><!--brands_products-->
                <h2>Thương hiệu</h2>
                <div class="brands-name">
                    <ul class="nav nav-pills nav-stacked">
                        <%
                            ArrayList<NhanHieu> ls1 = SanPhamDAO.getNH();
                            for (NhanHieu nh : ls1

                            
                                ) {
                        %>
                        <li><a href="shop.jsp?&NhanHieu=<%= nh.getTenNH()%>"> <span class="pull-right">(<%= nh.getSoLuong()%>)</span><%= nh.getTenNH()%></a></li>
                            <%}%>
                    </ul>
                </div>
            </div><!--/brands_products-->

            <div class="price-range"><!--price-range-->
                <h2>Price Range</h2>
                <div class="well text-center">
                    <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
                    <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
                </div>
            </div><!--/price-range-->

            <div class="shipping text-center" style="margin-bottom: 50px;"><!--shipping-->
                <img src="images/home/shipping.jpg" alt="" />
            </div><!--/shipping-->

        </div>
    </body>
</html>
