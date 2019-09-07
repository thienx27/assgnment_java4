/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ktt.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import ktt.dao.BannerDAO;
import ktt.dao.DonHangDAO;
import ktt.dao.KhachHangDAO;
import ktt.dao.LoaiSpDAO;
import ktt.dao.NhanVienDAO;
import ktt.dao.SanPhamDAO;
import ktt.model.Banner;
import ktt.model.DonHang;
import ktt.model.KhachHang;
import ktt.model.LoaiSP;
import ktt.model.NhanVien;
import ktt.model.SanPham;

/**
 *
 * @author 500PING-LT
 */
public class AdController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();
        if (action.equals("Delete Member")) {
            String check = (String) session.getAttribute("id");
            String maNV = request.getParameter("MaNV");
            if (check.equals(maNV)){
                response.sendRedirect("admin/danhsachthanhvien.jsp");
                session.setAttribute("alert", "Bạn không thể xóa chính mình");
            } else{
                NhanVien nv = new NhanVien();
                nv.setMaNV(maNV);

                NhanVienDAO.delNV(nv);

                response.sendRedirect("admin/danhsachthanhvien.jsp");
                session.setAttribute("alert", null);
            }     
        } else if (action.equals("Delete Customer")) {
            String maKH = request.getParameter("MaKH");
            KhachHang kh = new KhachHang();
            kh.setMaKH(Integer.valueOf(maKH));

            KhachHangDAO.delKH(kh);

            response.sendRedirect("admin/danhsachkhachhang.jsp");
        } else if (action.equals("Delete Product")) {
            String maSP = request.getParameter("MaSP");
            SanPham sp = new SanPham();
            sp.setMaSP(maSP);

            SanPhamDAO.delSP(sp);

            response.sendRedirect("admin/danhsachsanpham.jsp");
        } else if (action.equals("Delete Category")) {
            String maLoai = request.getParameter("MaLoai");
            LoaiSP lsp = new LoaiSP();
            lsp.setMaLoai(maLoai);

            LoaiSpDAO.delLSP(lsp);

            response.sendRedirect("admin/danhsachloaisp.jsp");
        } else if (action.equals("Delete Order")) {
            String maDH = request.getParameter("MaDH");
            DonHang dh = new DonHang();
            dh.setMaDH(Integer.valueOf(maDH));

            DonHangDAO.delDH(dh);

            response.sendRedirect("admin/danhsachdonhang.jsp");
        } else if (action.equals("Log out")) {
            session.removeAttribute("USER");
            session.removeAttribute("id");
            
            response.sendRedirect("admin/login.jsp");
        } else if (action.equals("Delete Banner")) {
            int maBN = Integer.valueOf(request.getParameter("MaBN"));
            Banner bn = new Banner();
            bn.setMaBN(maBN);
            BannerDAO.delBN(bn);
            response.sendRedirect("admin/danhsachbanner.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        try {
            PrintWriter out = response.getWriter();
            String action = request.getParameter("action");
            if (action.equals("Add Customer")) {
                String name = request.getParameter("tmkhName");
                String mail = request.getParameter("tmkhMail");
                String pass = request.getParameter("tmkhPass");
                String address = request.getParameter("tmkhAddress");
                String phone = request.getParameter("tmkhPhone");

                KhachHang kh = new KhachHang();
                kh.setTenKH(name);
                kh.setEmail(mail);
                kh.setPass(pass);
                kh.setDiaChi(address);
                kh.setDienThoai(phone);

                KhachHangDAO.addKH(kh);

                response.sendRedirect("admin/danhsachkhachhang.jsp");

            } else if (action.equals("Add Category")) {
                String maLoai = request.getParameter("tmlML");
                String tenLoai = request.getParameter("tmlTL");

                LoaiSP lsp = new LoaiSP();
                lsp.setMaLoai(maLoai);
                lsp.setTenLoai(tenLoai);

                LoaiSpDAO.addLSP(lsp);

                response.sendRedirect("admin/danhsachloaisp.jsp");

            } else if (action.equals("Add Member")) {
                String mail = request.getParameter("tmtvMail");
                String pass = request.getParameter("tmtvPass");
                String name = request.getParameter("tmtvName");
                String role = request.getParameter("tmtvRole");

                NhanVien nv = new NhanVien();
                nv.setMaNV(mail);
                nv.setPass(pass);
                nv.setTenNV(name);
                if (role.equals("0")) {
                    nv.setChucVu("Admin");
                } else {
                    nv.setChucVu("User");
                }

                NhanVienDAO.addNV(nv);

                response.sendRedirect("admin/danhsachthanhvien.jsp");

            } else if (action.equals("Login")) {
                String mail = request.getParameter("email");
                String pass = request.getParameter("password");

                ArrayList<NhanVien> ls = NhanVienDAO.getAll();
                HttpSession session = request.getSession(true);
                boolean chk = false;

                for (NhanVien nv : ls) {
                    if (nv.getMaNV().equals(mail) && nv.getPass().equals(pass)) {
                        session.setAttribute("USER", nv.getTenNV());
                        session.setAttribute("id", nv.getMaNV());
                        response.sendRedirect("admin/index.jsp");
                        chk = true;
                        break;
                    }
                }

                if (chk == false) {
                    session.setAttribute("USER", null);
                    session.setAttribute("id", null);
                    response.sendRedirect("admin/login.jsp");
                }
            } else if (action.equals("Update Member")) {
                String mail = request.getParameter("stvMail");
                String pass = request.getParameter("stvPass");
                String name = request.getParameter("stvName");
                String role = request.getParameter("stvRole");

                NhanVien nv = new NhanVien();
                nv.setMaNV(mail);
                nv.setPass(pass);
                nv.setTenNV(name);
                if (role.equals("0")) {
                    nv.setChucVu("Admin");
                } else {
                    nv.setChucVu("User");
                }

                NhanVienDAO.updateNV(nv);

                response.sendRedirect("admin/danhsachthanhvien.jsp");

            } else if (action.equals("Update Customer")) {
                String id = request.getParameter("skhID");
                String name = request.getParameter("skhName");
                String mail = request.getParameter("skhMail");
                String pass = request.getParameter("skhPass");
                String address = request.getParameter("skhAddress");
                String phone = request.getParameter("skhPhone");

                KhachHang kh = new KhachHang();
                kh.setMaKH(Integer.valueOf(id));
                kh.setTenKH(name);
                kh.setEmail(mail);
                kh.setPass(pass);
                kh.setDiaChi(address);
                kh.setDienThoai(phone);

                KhachHangDAO.updateKH(kh);

                response.sendRedirect("admin/danhsachkhachhang.jsp");

            } else if (action.equals("Update Category")) {
                String maLoai = request.getParameter("slML");
                String tenLoai = request.getParameter("slTL");

                LoaiSP lsp = new LoaiSP();
                lsp.setMaLoai(maLoai);
                lsp.setTenLoai(tenLoai);

                LoaiSpDAO.updateLSP(lsp);

                response.sendRedirect("admin/danhsachloaisp.jsp");

            }
        } catch (Exception e) {

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
