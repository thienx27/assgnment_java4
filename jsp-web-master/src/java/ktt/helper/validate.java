/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ktt.helper;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author 500PING-PC
 */
public class validate {
    public static boolean checkDupicate(String key, String data, String check){
        Connection con = ultility.getCon();
        String sql = "select "+key+" from "+data;
        try{
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            boolean chk = false;
            
            while (rs.next()){
                if (check.equalsIgnoreCase(rs.getString(1))){
                    chk = true;
                }
            }
            
            return chk;
        }catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
}
