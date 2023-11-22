package com.example.pj4a;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil{
    public static Connection getConnection(){
        Connection con=null;
        try{
            Class.forName("org.mariadb.jdbc.Driver");
            con= DriverManager.getConnection("jdbc:mariadb://walab.handong.edu:3306/p233_22200429","p233_22200429","EekeD5");
        }catch(Exception e){
            System.out.println(e);
        }
        return con;
    }


  }


