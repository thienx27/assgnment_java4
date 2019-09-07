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
import ktt.model.Banner;

/**
 *
 * @author 500PING-LT
 */
public class BannerDAO {
    private static Banner getBanner(ResultSet rs) throws SQLException{        
        Banner bn = new Banner();
        bn.setMaBN(rs.getInt(1));
        bn.setTieuDe(rs.getString(2));
        bn.setNoiDung(rs.getString(3));
        bn.setImage(rs.getString(4));
        bn.setUrl(rs.getString(5));
       
        return bn;
    }
    
    public static ArrayList <Banner> getAll(){
        String sql = "select * from Banner";
        ArrayList <Banner> ls = new ArrayList<>();
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()){
                Banner bn = getBanner(rs);
                ls.add(bn);
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
    
    public static Banner getBN(String maBN) {
        String sql = "select * from Banner where MaBN = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, maBN);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()){
                Banner bn = getBanner(rs);
                rs.close();
                return bn;
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
    
    public static void addBN(Banner bn) {
        String sql = "insert into Banner values (?,?,?,?)";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, bn.getTieuDe());
            ps.setString(2, bn.getNoiDung());
            ps.setString(3, bn.getImage());
            ps.setString(4, bn.getUrl());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void updateBN(Banner bn) {
        String sql = "update Banner set TieuDe = ?, NoiDung = ?, Image = ?, Url = ? where MaBN = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);  
            ps.setString(1, bn.getTieuDe());
            ps.setString(2, bn.getNoiDung());
            ps.setString(3, bn.getImage());
            ps.setString(4, bn.getUrl());
            ps.setInt(5, bn.getMaBN());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
    
    public static void delBN(Banner bn) {
        String sql = "delete Banner where MaBN = ?";
        Connection con = ultility.getCon();
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ps.setInt(1, bn.getMaBN());
            
            ps.executeUpdate();
        }catch(SQLException e){
            e.printStackTrace();
        }finally{
            ultility.disCon(con);
        }
    }
}
