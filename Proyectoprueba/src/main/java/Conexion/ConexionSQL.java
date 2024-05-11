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
    private String URL="jdbc:sqlserver://localhost:1433;database=proyectoVenta1;";
    private String USER="sa";
    private String PASSWORD="admin123";
    Connection conn=null;
    public Connection EstablecerConexion()
    {
        try {
            
            conn=DriverManager.getConnection(URL, USER, PASSWORD);
            //Statement stm=conn.createStatement();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
    public void desconectar(){
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
