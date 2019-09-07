/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ktt.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import ktt.helper.ultility;
import ktt.model.DonHang;

/**
 *
 * @author 500PING-PC
 */
public class DonHangDAO {
    private static DonHang getDonHang(ResultSet rs) throws SQLException{        
        DonHang dh = new DonHang();
        dh.setMaDH(rs.getInt(1));
        dh.setTenKH(rs.getString(2));
        dh.setDienThoai(rs.getString(3));
        dh.setDiaChi(rs.getString(4));
        dh.setTongTien(rs.getInt(5));
        dh.setNgayXuat(rs.getString(6));
        dh.setMoTa(rs.getString(7));
       
        return dh;
    }
    
    public static ArrayList <DonHang> getAll(){
        String sql = "select * from DonHang";
        ArrayList <DonHang> ls = new ArrayList<>();
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                DonHang dh = getDonHang(rs);
                ls.add(dh);
            }
            rs.close();
            return ls;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
        return null;
    }
    
    public static DonHang getDH(String maDH) {
        String sql = "select * from DonHang where MaDH = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, maDH);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                DonHang dh = getDonHang(rs);
                rs.close();
                return dh;
            }
            else{
                rs.close();
                return null;
            }
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
        return null;
    }
    
    public static void addDH(DonHang dh) {
        String sql = "insert into DonHang (TenKH, DienThoai, DiaChi, TongTien, MoTa) values (?,?,?,?,?)";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, dh.getTenKH());
            ps.setString(2, dh.getDienThoai());
            ps.setString(3, dh.getDiaChi());
            ps.setInt(4, dh.getTongTien());
            ps.setString(5, dh.getMoTa());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void updateDH(DonHang dh) {
        String sql = "update DonHang set TenKH = ?, DienThoai = ?, DiaChi = ?, TongTien = ?, NgayXuat = ?, Mota = ? where MaDH = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, dh.getTenKH());
            ps.setString(2, dh.getDienThoai());
            ps.setString(3, dh.getDiaChi());
            ps.setInt(4, dh.getTongTien());
            ps.setString(5, dh.getNgayXuat());
            ps.setString(6, dh.getMoTa());
            ps.setInt(7, dh.getMaDH());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void delDH(DonHang dh) {
        String sql = "delete DonHang where MaDH = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setInt(1, dh.getMaDH());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
}
