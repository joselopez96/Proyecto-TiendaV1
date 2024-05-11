/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Services;

import java.util.ArrayList;

/**
 *
 * @author Usuario
 */
public interface DAOinterface <T>{
    public void crear(T elemento);
    public ArrayList<T> leer();
    public ArrayList<T> leerporid(String idprod);
    public void actualizar(T elemento);
    public void eliminar(String idprod);
}
