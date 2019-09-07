<%-- 
    Document   : banner
    Created on : Nov 11, 2018, 4:14:32 PM
    Author     : 500PING-PC
--%>

<%@page import="ktt.dao.BannerDAO"%>
<%@page import="ktt.model.Banner"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>banner</title>
        <script src="js/jquery.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
                $('#banner-click').eq(0).addClass('active');
                $('#banner-picture').eq(0).addClass('active');
            });
        </script>
    </head>
    <body>
        <%
            ArrayList<Banner> ls = BannerDAO.getAll();
        %>
        <section id="slider"><!--slider-->
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
                        <div id="slider-carousel" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <%
                                    if (ls.size() > 0) {
                                        int i = 0;
                                        for (Banner bn : ls) {
                                %>
                                <li id="banner-click" data-target="#slider-carousel" data-slide-to="<%= i%>"></li>
                                <%
                                        i++;
                                        }
                                    }    
                                %>
                                <li id="banner-click" data-target="#slider-carousel" data-slide-to="<%= ls.size()%>"></li>
                                <li id="banner-click" data-target="#slider-carousel" data-slide-to="<%= ls.size() + 1%>"></li>
                                <li id="banner-click" data-target="#slider-carousel" data-slide-to="<%= ls.size() + 2%>"></li>
                            </ol>

                            <div class="carousel-inner">
                                <%
                                    if (ls.size() > 0) {
                                        for (Banner bn : ls) {
                                %>
                                <div id="banner-picture" class="item">
                                    <div class="col-sm-6">
                                        <h1><span>KTT</span>-SHOPPER</h1>
                                        <h2><%= bn.getTieuDe()%></h2>
                                        <p><%= bn.getNoiDung()%></p>
                                        <a href="<%= bn.getUrl()%>" class="btn btn-default get" target="_blank">Xem thêm</a>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/<%= bn.getImage()%>" style="height: 454px;width: 441px;" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                                <%
                                        }
                                    }
                                %>
                                <div id="banner-picture" class="item">
                                    <div class="col-sm-6">
                                        <h1><span>KTT</span>-SHOPPER</h1>
                                        <h2>Đẹp trai lỗi tại ai?</h2>
                                        <p>Gồm 3 thành viên Khánh, Thắng, Thành nổi tiếng đẹp trai nhất vịnh bắc bộ. Đặc biệt là Thắng với vẻ đẹp đéo khác gì hot boy Hàn Quốc </p>
                                        <a href="#" class="btn btn-default get">Xem thêm</a>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/girl1.jpg" style="height: 454px;width: 441px;" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                                <div id="banner-picture" class="item">
                                    <div class="col-sm-6">
                                        <h1><span>KTT</span>-SHOPPER</h1>
                                        <h2>> 200 IQ</h2>
                                        <p>Bên cạnh vẻ đẹp trai vốn có, nhóm chúng tôi còn tự hào là 3 trong số cả tỷ người trên thế giới có tổng số IQ lớn hơn 200. </p>
                                        <a href="#" class="btn btn-default get">Xem thêm</a>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/girl2.jpg" style="height: 454px;width: 441px;" class="girl img-responsive" alt="" />
                                    </div>
                                </div>

                                <div id="banner-picture" class="item">
                                    <div class="col-sm-6">
                                        <h1><span>KTT</span>-SHOPPER</h1>
                                        <h2>Hài hước nhưng không bao giờ chém gió</h2>
                                        <p>Phương trâm sống thật không trật với lòng, nhóm chúng tôi luôn luôn mang đến niềm tin cho thầy giáo cùng bạn bè. </p>
                                        <a href="#" class="btn btn-default get">Xem thêm</a>
                                    </div>
                                    <div class="col-sm-6">
                                        <img src="images/home/girl3.jpg" style="height: 454px;width: 441px;" class="girl img-responsive" alt="" />
                                    </div>
                                </div>
                            </div>

                            <a href="#slider-carousel" class="left control-carousel hidden-xs" data-slide="prev">
                                <i class="fa fa-angle-left"></i>
                            </a>
                            <a href="#slider-carousel" class="right control-carousel hidden-xs" data-slide="next">
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </div>

                    </div>
                </div>
            </div>
        </section><!--/slider-->
    </body>
</html>
