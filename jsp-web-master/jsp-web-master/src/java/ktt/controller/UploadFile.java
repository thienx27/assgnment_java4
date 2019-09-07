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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import ktt.dao.BannerDAO;
import ktt.dao.SanPhamDAO;
import ktt.model.Banner;
import ktt.model.SanPham;

@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 10,
        maxFileSize = 1024 * 1024 * 50,
        maxRequestSize = 1024 * 1024 * 100
)
public class UploadFile extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String action = request.getParameter("action");
        if (action.equals("Add Product")) {
            String maSP = request.getParameter("tmspMaSP");
            String tenSP = request.getParameter("tmspTenSP");
            String giaTien = request.getParameter("tmspGia");
            String trangThai = request.getParameter("tmspTrangThai");
            String loai = request.getParameter("tmspLoai");
            String nhanHieu = request.getParameter("tmspNhanHieu");
            Part filePart = request.getPart("tmspImage"); // Retrieves <input type="file" name="file">
            String image = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            String moTa = request.getParameter("tmspMoTa");

            SanPham sp = new SanPham();
            sp.setMaSP(maSP);
            sp.setTenSP(tenSP);
            sp.setDonGia(Integer.valueOf(giaTien));
            if (trangThai.equals("0")) {
                sp.setTrangThai("Còn hàng");
            } else {
                sp.setTrangThai("Hết hàng");
            }
            sp.setMaLoai(loai);
            sp.setNhanHieu(nhanHieu);
            sp.setImage(image);
            sp.setMoTa(moTa);

            SanPhamDAO.addSP(sp);

            String applicationPath = request.getServletContext().getRealPath("");
            String basePath = applicationPath + File.separator + "images\\shop" + File.separator;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new File(basePath + image);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {

            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }

            response.sendRedirect("admin/danhsachsanpham.jsp");
        } else if (action.equals("Update Product")) {
            String maSP = request.getParameter("sspMaSP");
            String tenSP = request.getParameter("sspTenSP");
            String giaTien = request.getParameter("sspGia");
            String trangThai = request.getParameter("sspTrangThai");
            String loai = request.getParameter("sspLoai");
            String nhanHieu = request.getParameter("sspNhanHieu");
            Part filePart = request.getPart("sspImage"); // Retrieves <input type="file" name="file">
            String image = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            String moTa = request.getParameter("sspMoTa");

            if (image.equals("")) {
                image = request.getParameter("sspImage1");
            } else {
                String applicationPath = request.getServletContext().getRealPath("");
                String basePath = applicationPath + File.separator + "images\\shop" + File.separator;
                InputStream inputStream = null;
                OutputStream outputStream = null;
                try {
                    File outputFilePath = new File(basePath + image);
                    inputStream = filePart.getInputStream();
                    outputStream = new FileOutputStream(outputFilePath);
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                    while ((read = inputStream.read(bytes)) != -1) {
                        outputStream.write(bytes, 0, read);
                    }
                } catch (Exception e) {

                } finally {
                    if (inputStream != null) {
                        inputStream.close();
                    }
                    if (outputStream != null) {
                        outputStream.close();
                    }
                }
            }

            SanPham sp = new SanPham();
            sp.setMaSP(maSP);
            sp.setTenSP(tenSP);
            sp.setDonGia(Integer.valueOf(giaTien));
            if (trangThai.equals("0")) {
                sp.setTrangThai("Còn hàng");
            } else {
                sp.setTrangThai("Hết hàng");
            }
            sp.setMaLoai(loai);
            sp.setNhanHieu(nhanHieu);
            sp.setImage(image);
            sp.setMoTa(moTa);

            SanPhamDAO.updateSP(sp);

            response.sendRedirect("admin/danhsachsanpham.jsp");

        } else if (action.equals("Add Banner")) {
            String tieuDe = request.getParameter("tmbnTD");
            String noiDung = request.getParameter("tmbnND");
            Part filePart = request.getPart("tmbnImage"); // Retrieves <input type="file" name="file">
            String image = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            String url = request.getParameter("tmbnURL");

            Banner bn = new Banner();
            bn.setTieuDe(tieuDe);
            bn.setNoiDung(noiDung);
            bn.setImage(image);
            bn.setUrl(url);
            
            BannerDAO.addBN(bn);

            String applicationPath = request.getServletContext().getRealPath("");
            String basePath = applicationPath + File.separator + "images\\home" + File.separator;
            InputStream inputStream = null;
            OutputStream outputStream = null;
            try {
                File outputFilePath = new File(basePath + image);
                inputStream = filePart.getInputStream();
                outputStream = new FileOutputStream(outputFilePath);
                int read = 0;
                final byte[] bytes = new byte[1024];
                while ((read = inputStream.read(bytes)) != -1) {
                    outputStream.write(bytes, 0, read);
                }
            } catch (Exception e) {

            } finally {
                if (inputStream != null) {
                    inputStream.close();
                }
                if (outputStream != null) {
                    outputStream.close();
                }
            }

            response.sendRedirect("admin/danhsachbanner.jsp");
            
        } else if (action.equals("Update Banner")) {
            String maBN = request.getParameter("sbnMBN");
            String tieuDe = request.getParameter("sbnTD");
            String noiDung = request.getParameter("sbnND");
            Part filePart = request.getPart("sbnImage"); // Retrieves <input type="file" name="file">
            String image = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            String url = request.getParameter("sbnURL");

            if (image.equals("")) {
                image = request.getParameter("sbnImage1");
            } else {
                String applicationPath = request.getServletContext().getRealPath("");
                String basePath = applicationPath + File.separator + "images\\home" + File.separator;
                InputStream inputStream = null;
                OutputStream outputStream = null;
                try {
                    File outputFilePath = new File(basePath + image);
                    inputStream = filePart.getInputStream();
                    outputStream = new FileOutputStream(outputFilePath);
                    int read = 0;
                    final byte[] bytes = new byte[1024];
                    while ((read = inputStream.read(bytes)) != -1) {
                        outputStream.write(bytes, 0, read);
                    }
                } catch (Exception e) {

                } finally {
                    if (inputStream != null) {
                        inputStream.close();
                    }
                    if (outputStream != null) {
                        outputStream.close();
                    }
                }
            }

            Banner bn = new Banner();
            bn.setMaBN(Integer.valueOf(maBN));
            bn.setTieuDe(tieuDe);
            bn.setNoiDung(noiDung);
            bn.setImage(image);
            bn.setUrl(url);
            
            BannerDAO.updateBN(bn);

            response.sendRedirect("admin/danhsachbanner.jsp");

        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
