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
public class DonHangChiTiet {
    private int maDHCT, maDH, donGia, soLuong;
    private String maSP, tenSP;

    public DonHangChiTiet(int maDHCT, int maDH, int donGia, int soLuong, String maSP, String tenSP) {
        this.maDHCT = maDHCT;
        this.maDH = maDH;
        this.donGia = donGia;
        this.soLuong = soLuong;
        this.maSP = maSP;
        this.tenSP = tenSP;
    }

    

    public DonHangChiTiet() {
    }

    public int getMaDHCT() {
        return maDHCT;
    }

    public void setMaDHCT(int maDHCT) {
        this.maDHCT = maDHCT;
    }

    public int getMaDH() {
        return maDH;
    }

    public void setMaDH(int maDH) {
        this.maDH = maDH;
    }

    public int getDonGia() {
        return donGia;
    }

    public void setDonGia(int donGia) {
        this.donGia = donGia;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public String getMaSP() {
        return maSP;
    }

    public void setMaSP(String maSP) {
        this.maSP = maSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }
    
    
}
