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
import ktt.model.NhanVien;

/**
 *
 * @author 500PING-PC
 */
public class NhanVienDAO {
    private static NhanVien getNhanVien(ResultSet rs) throws SQLException{        
        NhanVien nv = new NhanVien();
        nv.setMaNV(rs.getString(1));
        nv.setTenNV(rs.getString(2));
        nv.setPass(rs.getString(3));
        if (rs.getString(4).equals("0")){
            nv.setChucVu("Admin");
        }else{
            nv.setChucVu("User");
        }
        
        
        return nv;
    }
    
    public static ArrayList <NhanVien> getAll(){
        String sql = "select * from NhanVien";
        ArrayList <NhanVien> ls = new ArrayList<>();
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                NhanVien nv = getNhanVien(rs);
                ls.add(nv);
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
    
    public static NhanVien getNV(String maNV) {
        String sql = "select * from NhanVien where MaNV = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, maNV);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                NhanVien nv = getNhanVien(rs);
                rs.close();
                return nv;
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
    
    public static void addNV(NhanVien nv) {
        String sql = "insert into NhanVien values (?,?,?,?)";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, nv.getMaNV());
            ps.setString(2, nv.getTenNV());
            ps.setString(3, nv.getPass());
            if (nv.getChucVu().equals("Admin")){
                ps.setString(4, "0");
            }else{
                ps.setString(4, "1");
            }
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void updateNV(NhanVien nv) {
        String sql = "update NhanVien set TenNV = ?, Password = ?, ChucVu = ? where MaNV = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, nv.getTenNV());
            ps.setString(2, nv.getPass());
            if (nv.getChucVu().equals("Admin")){
                ps.setString(3, "0");
            }else{
                ps.setString(3, "1");
            }
            ps.setString(4, nv.getMaNV());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void updatePass(String pass, String maNV) {
        String sql = "update NhanVien set MatKhau = ? where MaNV = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, pass);
            ps.setString(2, maNV);
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void delNV(NhanVien nv) {
        String sql = "delete NhanVien where MaNV = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, nv.getMaNV());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
}
