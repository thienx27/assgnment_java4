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
import ktt.model.DonHangChiTiet;

/**
 *
 * @author 500PING-LT
 */
public class DonHangChiTietDAO {
    private static DonHangChiTiet getDonHangChiTiet(ResultSet rs) throws SQLException{        
        DonHangChiTiet dhct = new DonHangChiTiet();
        dhct.setMaDHCT(rs.getInt(1));
        dhct.setMaDH(rs.getInt(2));
        dhct.setMaSP(rs.getString(3));
        dhct.setDonGia(rs.getInt(4));
        dhct.setSoLuong(rs.getInt(5));
       
        return dhct;
    }
    
    public static ArrayList <DonHangChiTiet> getAll(){
        String sql = "select * from DonHangChiTiet";
        ArrayList <DonHangChiTiet> ls = new ArrayList<>();
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                DonHangChiTiet dhct = getDonHangChiTiet(rs);
                ls.add(dhct);
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
    
    public static ArrayList <DonHangChiTiet> getDHCT(String maDH) {
        String sql = "select DonHangChiTiet.MaSP, DonHangChiTiet.DonGia, DonHangChiTiet.SoLuong, SanPham.TenSP from SanPham join DonHangChiTiet on SanPham.MaSP = DonHangChiTiet.MaSP\n" +
"   where MaDH = ?";
        ArrayList <DonHangChiTiet> ls = new ArrayList<>();
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, maDH);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()){
                DonHangChiTiet dhct = new DonHangChiTiet();
                dhct.setMaSP(rs.getString(1));
                dhct.setDonGia(rs.getInt(2));
                dhct.setSoLuong(rs.getInt(3));
                dhct.setTenSP(rs.getString(4));
                ls.add(dhct);
            }
            
            return ls;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
        return null;
    }
    
    public static void addDHCT(DonHangChiTiet dhct) {
        String sql = "insert into DonHangChiTiet values ((select IDENT_CURRENT ('DonHang')),?,?,?)";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, dhct.getMaSP());
            ps.setInt(2, dhct.getDonGia());
            ps.setInt(3, dhct.getSoLuong());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void delDHCT(int maDH) {
        String sql = "delete DonHangChiTiet where MaDH = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setInt(1, maDH);
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
}
