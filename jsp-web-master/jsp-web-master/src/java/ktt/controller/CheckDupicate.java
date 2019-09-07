/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ktt.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ktt.dao.KhachHangDAO;
import ktt.helper.ultility;
import ktt.helper.validate;
import ktt.model.KhachHang;

/**
 *
 * @author 500PING-LT
 */
public class CheckDupicate extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");
        if (action.equals("thanhvien")) {
            String mail = request.getParameter("mail");
            if (validate.checkDupicate("MaNV", "NhanVien", mail)) {
                out.print("0");
            }
        } else if (action.equals("sanpham")) {
            String masp = request.getParameter("masp");
            if (validate.checkDupicate("MaSP", "SanPham", masp)) {
                out.print("0");
            }
        } else if (action.equals("loaisp")) {
            String maloai = request.getParameter("maloai");
            if (validate.checkDupicate("MaLoai", "LoaiSP", maloai)) {
                out.print("0");
            }
        } else if (action.equals("khachhang")) {
            String mail = request.getParameter("mail");
            if (validate.checkDupicate("Email", "KhachHang", mail)) {
                out.print("0");
            }
        } else if (action.equals("upkhachhang")) {
            String mail = request.getParameter("mail");
            String id = request.getParameter("id");
            Connection con = ultility.getCon();
            String sql = "select Email from KhachHang where MaKH not like '"+id+"'";
            try {
                PreparedStatement ps = con.prepareCall(sql);
                ResultSet rs = ps.executeQuery();
                boolean chk = false;

                while (rs.next()) {
                    if (mail.equalsIgnoreCase(rs.getString(1))) {
                        out.print("0");
                    }
                }
            } catch (Exception e) {
                
            }
        }else if (action.equals("khlogin")) {
            String mail = request.getParameter("mail");
            String pass = request.getParameter("pass");
            boolean chk = true;
            
            ArrayList<KhachHang> ls = KhachHangDAO.getAll();
            for (KhachHang kh : ls){
                if (mail.equalsIgnoreCase(kh.getEmail()) && pass.equalsIgnoreCase(kh.getPass())){
                    chk = false;
                    break;
                }
            }
            
            if (chk){
                out.print("0");
            }
        } else if (action.equals("khregis")) {
            String mail = request.getParameter("mail");
            if (validate.checkDupicate("Email", "KhachHang", mail)) {
                out.print("0");
            }
        } else if (action.equals("restorePass")) {
            String mail = request.getParameter("mail");
            if (validate.checkDupicate("Email", "KhachHang", mail)) {
                out.print("0");
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
