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
public class KhachHang {
    private int maKH;
    private String tenKH, email, pass, diaChi, dienThoai;

    public KhachHang(int maKH, String tenKH, String email, String pass, String diaChi, String dienThoai) {
        this.maKH = maKH;
        this.tenKH = tenKH;
        this.email = email;
        this.pass = pass;
        this.diaChi = diaChi;
        this.dienThoai = dienThoai;
    }

    public KhachHang() {
    }

    public int getMaKH() {
        return maKH;
    }

    public void setMaKH(int maKH) {
        this.maKH = maKH;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getDienThoai() {
        return dienThoai;
    }

    public void setDienThoai(String dienThoai) {
        this.dienThoai = dienThoai;
    }
    
    
}
