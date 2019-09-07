/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ktt.model;

/**
 *
 * @author 500PING-LT
 */
public class NhanHieu {
    private String tenNH;
    private int soLuong;

    public NhanHieu(String tenNH, int soLuong) {
        this.tenNH = tenNH;
        this.soLuong = soLuong;
    }

    public NhanHieu() {
    }

    public String getTenNH() {
        return tenNH;
    }

    public void setTenNH(String tenNH) {
        this.tenNH = tenNH;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
    
    
}
