/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModelPrimary;

/**
 *
 * @author Usuario
 */
public class ProductoCategory {
    private String idcategoria;
    private String nombrecat;

    public ProductoCategory(String idcategoria) {
        this.idcategoria = idcategoria;
    }

   

    public String getIdcategoria() {
        return idcategoria;
    }

    public void setIdcategoria(String idcategoria) {
        this.idcategoria = idcategoria;
    }

    public String getNombrecat() {
        return nombrecat;
    }

    public void setNombrecat(String nombrecat) {
        this.nombrecat = nombrecat;
    }
    
}
