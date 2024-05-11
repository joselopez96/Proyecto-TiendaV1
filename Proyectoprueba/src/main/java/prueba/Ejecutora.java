/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package prueba;

import Controller.*;
import java.util.ArrayList;
import model.Producto;

/**
 *
 * @author Usuario
 */
public class Ejecutora {
    public static void main(String[] args) {
        DaoProducto daop= new DaoProducto();
        ArrayList<Producto> lista= daop.leer();

        for(Producto p: lista){
            System.out.println(p.getIdproducto()+" "+p.getNombreproducto()+" "+p.getDescripcion()
            +" "+p.getCostouni()
            +" "+p.getStock()
            +" "+p.getFechaing()
            +" "+p.getFechacad()
            +" "+p.getRutaimg()
            +" "+p.getEstado()
            +" "+p.getIdcategoria());
        }
        
    }
}
