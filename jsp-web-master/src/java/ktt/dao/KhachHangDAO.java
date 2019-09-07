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
import ktt.model.KhachHang;

/**
 *
 * @author 500PING-PC
 */
public class KhachHangDAO {
    private static KhachHang getKhachHang(ResultSet rs) throws SQLException{        
        KhachHang kh = new KhachHang();
        kh.setMaKH(rs.getInt(1));
        kh.setTenKH(rs.getString(2));
        kh.setEmail(rs.getString(3));
        kh.setPass(rs.getString(4));
        kh.setDiaChi(rs.getString(5));
        kh.setDienThoai(rs.getString(6));
       
        return kh;
    }
    
    public static ArrayList <KhachHang> getAll(){
        String sql = "select * from KhachHang";
        ArrayList <KhachHang> ls = new ArrayList<>();
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                KhachHang kh = getKhachHang(rs);
                ls.add(kh);
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
    
    public static KhachHang getKH(String maKH) {
        String sql = "select * from KhachHang where MaKH = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, maKH);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                KhachHang kh = getKhachHang(rs);
                rs.close();
                return kh;
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
    
    public static void addKH(KhachHang kh) {
        String sql = "insert into KhachHang values (?,?,?,?,?)";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, kh.getTenKH());
            ps.setString(2, kh.getEmail());
            ps.setString(3, kh.getPass());
            ps.setString(4, kh.getDiaChi());
            ps.setString(5, kh.getDienThoai());
            
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void updateKH(KhachHang kh) {
        String sql = "update KhachHang set TenKH = ?, Email = ?, Password = ?, DiaChi = ?, DienThoai = ? where MaKH = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, kh.getTenKH());
            ps.setString(2, kh.getEmail());
            ps.setString(3, kh.getPass());
            ps.setString(4, kh.getDiaChi());
            ps.setString(5, kh.getDienThoai());
            ps.setInt(6, kh.getMaKH());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void restorePass(String email, String pass) {
        String sql = "update KhachHang set Password = ? where Email = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, pass);
            ps.setString(2, email);
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void delKH(KhachHang kh) {
        String sql = "delete KhachHang where MaKH = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setInt(1, kh.getMaKH());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
}
