/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ktt.model;

import java.io.Serializable;

/**
 *
 * @author 500PING-LT
 */
public class Products implements Serializable{
    private SanPham sp;
    private int soLuong;

    public Products(SanPham sp) {
        this.sp = sp;
        this.soLuong = 1;
    }

    public SanPham getSp() {
        return sp;
    }

    public void setSp(SanPham sp) {
        this.sp = sp;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }
    
    
}
