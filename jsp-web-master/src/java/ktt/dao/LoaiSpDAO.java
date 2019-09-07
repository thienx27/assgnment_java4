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
import ktt.model.LoaiSP;
import ktt.model.SanPham;

/**
 *
 * @author 500PING-PC
 */
public class LoaiSpDAO {
    private static LoaiSP getLoaiSP(ResultSet rs) throws SQLException{        
        LoaiSP lsp = new LoaiSP();
        lsp.setMaLoai(rs.getString(1));
        lsp.setTenLoai(rs.getString(2));
       
        return lsp;
    }
    
    public static ArrayList <LoaiSP> getAll(){
        String sql = "select * from LoaiSP";
        ArrayList <LoaiSP> ls = new ArrayList<>();
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                LoaiSP lsp = getLoaiSP(rs);
                ls.add(lsp);
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
    
    public static ArrayList <String> getLSP() {
        String sql = "select distinct TenLoai from LoaiSP";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            
            ArrayList <String> ls = new ArrayList<>();
            while (rs.next()){
                ls.add(rs.getString(1));
            }
            return ls;
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
        return null;
    }
    
    public static LoaiSP getLSPbyML(String MaLoai) {
        String sql = "select * from LoaiSP where MaLoai = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, MaLoai);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                LoaiSP lsp = getLoaiSP(rs);
                rs.close();
                return lsp;
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
    
    public static void addLSP(LoaiSP lsp) {
        String sql = "insert into LoaiSP values (?,?)";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, lsp.getMaLoai());
            ps.setString(2, lsp.getTenLoai());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void updateLSP(LoaiSP lsp) {
        String sql = "update LoaiSP set TenLoai = ? where MaLoai = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, lsp.getTenLoai());
            ps.setString(2, lsp.getMaLoai());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void delLSP(LoaiSP lsp) {
        String sql = "delete LoaiSP where MaLoai = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, lsp.getMaLoai());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
}
