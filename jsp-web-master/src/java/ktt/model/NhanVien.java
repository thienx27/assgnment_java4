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
public class NhanVien {
    private String maNV, tenNV, pass, chucVu;

    public NhanVien(String maNV, String tenNV, String pass, String chucVu) {
        this.maNV = maNV;
        this.tenNV = tenNV;
        this.pass = pass;
        this.chucVu = chucVu;
    }

    public NhanVien() {
    }

    public String getMaNV() {
        return maNV;
    }

    public void setMaNV(String maNV) {
        this.maNV = maNV;
    }

    public String getTenNV() {
        return tenNV;
    }

    public void setTenNV(String tenNV) {
        this.tenNV = tenNV;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getChucVu() {
        return chucVu;
    }

    public void setChucVu(String chucVu) {
        this.chucVu = chucVu;
    }
    
    
}
