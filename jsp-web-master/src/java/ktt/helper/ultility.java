/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ktt.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 500PING-PC
 */
public class ultility {
    static Connection con = null;
    public static synchronized Connection getCon(){
        try{
            String url = "jdbc:sqlserver://127.0.0.1:1433;databaseName=JAVA4";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url,"sa","123");
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
    
    public static void disCon(Connection c){
        if (c != null){
            try {
                c.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
