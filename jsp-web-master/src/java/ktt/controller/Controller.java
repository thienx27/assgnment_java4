/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ktt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import ktt.dao.DonHangChiTietDAO;
import ktt.dao.DonHangDAO;
import ktt.dao.KhachHangDAO;
import ktt.model.Cart;
import ktt.model.DonHang;
import ktt.model.DonHangChiTiet;
import ktt.model.KhachHang;
import ktt.model.Products;

/**
 *
 * @author 500PING-PC
 */
public class Controller extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        if (action.equals("logout")){
            HttpSession session = request.getSession(true);
            session.removeAttribute("Username");
            session.removeAttribute("id");
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        if (action.equals("login")) {
            String email = request.getParameter("dnEmail");
            String pass = request.getParameter("dnPass");
            
            boolean chk = true;
            
            ArrayList<KhachHang> ls = KhachHangDAO.getAll();
            
            for (KhachHang kh : ls){
                if (email.equalsIgnoreCase(kh.getEmail()) && pass.equalsIgnoreCase(kh.getPass())){
                    session.setAttribute("Username", kh.getTenKH());
                    session.setAttribute("id", kh.getMaKH());
                    response.sendRedirect("index.jsp");
                    chk = false;
                    break;
                }
            }
            
            if (chk){
                response.sendRedirect("login.jsp");
            }
        } else if (action.equals("signup")){
            String name = request.getParameter("dkName");
            String email = request.getParameter("dkMail");
            String pass = request.getParameter("dkPass");
            String address = request.getParameter("dkAddress");
            String phone = request.getParameter("dkPhone");
            
            KhachHang kh = new KhachHang();
            kh.setTenKH(name);
            kh.setEmail(email);
            kh.setPass(pass);
            kh.setDiaChi(address);
            kh.setDienThoai(phone);
            
            KhachHangDAO.addKH(kh);
            
            session.setAttribute("Username", kh.getTenKH());
            session.setAttribute("id", kh.getMaKH());
            response.sendRedirect("index.jsp");
            
            
        } else if (action.equals("checkout")){
            Cart shop = (Cart) session.getAttribute("SHOP");
            if (shop == null || shop.isEmpty()){
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Cart is empty!');");
                out.println("</script>");
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
            } else{
                String tenKH = request.getParameter("chkoutTen");
                String phone = request.getParameter("chkoutPhone");
                String diaChi = request.getParameter("chkoutAddress");
                String tongTien = request.getParameter("chkoutSum");
                String moTa = request.getParameter("chkoutMoTa");
                
                DonHang dh = new DonHang();
                dh.setTenKH(tenKH);
                dh.setDienThoai(phone);
                dh.setDiaChi(diaChi);
                dh.setTongTien(Integer.valueOf(tongTien));
                dh.setMoTa(moTa);
                
                DonHangDAO.addDH(dh);
                
                HashMap<String, Products> map = shop;
                for (Map.Entry<String, Products> list : map.entrySet()){
                    DonHangChiTiet dhct = new DonHangChiTiet();
                    dhct.setMaSP(list.getValue().getSp().getMaSP());
                    dhct.setDonGia(list.getValue().getSp().getDonGia());
                    dhct.setSoLuong(list.getValue().getSoLuong());
                    
                    DonHangChiTietDAO.addDHCT(dhct);
                }
                     
                shop.clear();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Đặt hàng thành công!');");
                out.println("</script>");
                
                RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                rd.include(request, response);
            }
        }else if (action.equals("restore")){
            String email = request.getParameter("ReEmail");
            String pass = request.getParameter("RePass");
            
            KhachHangDAO.restorePass(email, pass);
            
            response.sendRedirect("login.jsp");
            
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
