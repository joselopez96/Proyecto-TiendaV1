/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller;

import java.sql.SQLException;
import Conexion.ConexionSQL;
import Services.DAOinterface;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Producto;
/**
 *
 * @author Usuario
 */
public class DaoProducto implements DAOinterface<Producto>{
    ConexionSQL conx = new ConexionSQL();
    private String query;
    CallableStatement cs = null;
    ResultSet rs=null;
    ArrayList <Producto>  prod =new ArrayList<>();

    @Override
    public void crear(Producto elemento) {
        
    }

    @Override
    public ArrayList<Producto> leer() {
        query = "{call sp_leer_productos}";
        
        try {
            Connection con=conx.EstablecerConexion();
            cs = con.prepareCall(query);
            
            rs=cs.executeQuery();
            while(rs.next()){
                Producto p=new Producto(rs.getString(1), rs.getString(2), rs.getString(3), 
                        rs.getInt(4), rs.getInt(5), rs.getString(6), rs.getString(7), rs.getString(8),
                        rs.getInt(9), rs.getString(10));
                prod.add(p);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return prod;
    }

    

    @Override
    public void actualizar(Producto elemento) {
   
    }

    @Override
    public ArrayList<Producto> leerporid(String idprod) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void eliminar(String idprod) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

  

    


    
}
