/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ktt.model;

/**
 *
 * @author 500PING-PC
 */
public class DonHang {
    private int maDH, tongTien;
    private String tenKH, dienThoai, diaChi, ngayXuat, moTa;

    public DonHang(int maDH, int tongTien, String tenKH, String dienThoai, String diaChi, String ngayXuat, String moTa) {
        this.maDH = maDH;
        this.tongTien = tongTien;
        this.tenKH = tenKH;
        this.dienThoai = dienThoai;
        this.diaChi = diaChi;
        this.ngayXuat = ngayXuat;
        this.moTa = moTa;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    

    public DonHang() {
    }

    public int getMaDH() {
        return maDH;
    }

    public void setMaDH(int maDH) {
        this.maDH = maDH;
    }

    public int getTongTien() {
        return tongTien;
    }

    public void setTongTien(int tongTien) {
        this.tongTien = tongTien;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public String getDienThoai() {
        return dienThoai;
    }

    public void setDienThoai(String dienThoai) {
        this.dienThoai = dienThoai;
    }

    public String getNgayXuat() {
        return ngayXuat;
    }

    public void setNgayXuat(String ngayXuat) {
        this.ngayXuat = ngayXuat;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    
    
    
}
