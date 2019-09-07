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
import ktt.model.NhanHieu;
import ktt.model.SanPham;

/**
 *
 * @author 500PING-PC
 */
public class SanPhamDAO {
    private static SanPham getSanPham(ResultSet rs) throws SQLException{        
        SanPham sp = new SanPham();
        sp.setMaSP(rs.getString(1));
        sp.setTenSP(rs.getString(2));
        sp.setDonGia(rs.getInt(3));
        sp.setTrangThai(rs.getString(4));
        sp.setMaLoai(rs.getString(5));
        sp.setNhanHieu(rs.getString(6));
        sp.setImage(rs.getString(7));
        sp.setMoTa(rs.getString(8));
       
        return sp;
    }
    
    public static ArrayList <SanPham> getAll(){
        String sql = "select * from SanPham";
        ArrayList <SanPham> ls = new ArrayList<>();
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                SanPham sp = getSanPham(rs);
                ls.add(sp);
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
    public static ArrayList <SanPham> getAllByCategory(String category){
        String sql = "select * from SanPham where MaLoai = N'"+category+"'";
        ArrayList <SanPham> ls = new ArrayList<>();
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                SanPham sp = getSanPham(rs);
                ls.add(sp);
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
    
    public static ArrayList <SanPham> getAllByBrand(String brand){
        String sql = "select * from SanPham where NhanHieu = N'"+brand+"'";
        ArrayList <SanPham> ls = new ArrayList<>();
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                SanPham sp = getSanPham(rs);
                ls.add(sp);
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
    
    public static ArrayList <NhanHieu> getNH(){
        String sql = "select distinct NhanHieu, COUNT(MaSP) as SoLuong from SanPham group by NhanHieu";
        ArrayList <NhanHieu> ls = new ArrayList<>();
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                NhanHieu nh = new NhanHieu();
                nh.setTenNH(rs.getString(1));
                nh.setSoLuong(rs.getInt(2));
                ls.add(nh);
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
    
    public static SanPham getSP(String maSP) {
        String sql = "select * from SanPham where MaSP = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, maSP);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                SanPham sp = getSanPham(rs);
                rs.close();
                return sp;
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
    
    public static void addSP(SanPham sp) {
        String sql = "insert into SanPham values (?,?,?,?,?,?,?,?)";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, sp.getMaSP());
            ps.setString(2, sp.getTenSP());
            ps.setInt(3, sp.getDonGia());
            ps.setString(4, sp.getTrangThai());
            ps.setString(5, sp.getMaLoai());
            ps.setString(6, sp.getNhanHieu());
            ps.setString(7, sp.getImage());
            ps.setString(8, sp.getMoTa());
            
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void updateSP(SanPham sp) {
        String sql = "update SanPham set TenSP = ?, GiaTien = ?, TrangThai = ?, MaLoai = ?,NhanHieu = ?, Image = ?, Mota = ? where MaSP = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);  
            ps.setString(1, sp.getTenSP());
            ps.setInt(2, sp.getDonGia());
            ps.setString(3, sp.getTrangThai());
            ps.setString(4, sp.getMaLoai());
            ps.setString(5, sp.getNhanHieu());
            ps.setString(6, sp.getImage());
            ps.setString(7, sp.getMoTa());
            ps.setString(8, sp.getMaSP());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void delSP(SanPham sp) {
        String sql = "delete SanPham where MaSP = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, sp.getMaSP());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
}
