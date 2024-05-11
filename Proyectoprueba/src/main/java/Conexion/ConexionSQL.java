/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Usuario
 */
public class ConexionSQL {
    public static Connection EstablecerConexion()
    {
            String url="jdbc:sqlserver://localhost:1433;" +
			"database=proyectoVenta1;user=sa; password=admin123;loginTimeout=30;encrypt=true;trustServerCertificate=true";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection conn=DriverManager.getConnection(url);
            System.out.println("conexion exitossa");
            return conn;
            //Statement stm=conn.createStatement();
        } catch (SQLException | ClassNotFoundException e) {
            System.out.println(e.toString());
            return null;
        }
        
    }
    /*public void desconectar(){
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }*/
    /*public static void main(String[] args) {
        ConexionSQL.EstablecerConexion();
    }*/
    
}
