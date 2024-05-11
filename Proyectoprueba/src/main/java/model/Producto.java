/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import ModelPrimary.ProductoCategory;

/**
 *
 * @author Usuario
 */
public class Producto extends ProductoCategory{
    private String idproducto;
    private String nombreproducto;
    private String descripcion;
    private double costouni;
    private int stock;
    private String fechaing;
    private String fechacad;
    private String rutaimg;
    private int estado;

    public Producto(String idproducto, String nombreproducto, String descripcion, double costouni, int stock, String fechaing, String fechacad, String rutaimg, int estado, String idcategoria) {
        super(idcategoria);
        this.idproducto = idproducto;
        this.nombreproducto = nombreproducto;
        this.descripcion = descripcion;
        this.costouni = costouni;
        this.stock = stock;
        this.fechaing = fechaing;
        this.fechacad = fechacad;
        this.rutaimg = rutaimg;
        this.estado = estado;
    }

    public String getIdproducto() {
        return idproducto;
    }

    public void setIdproducto(String idproducto) {
        this.idproducto = idproducto;
    }

    public String getNombreproducto() {
        return nombreproducto;
    }

    public void setNombreproducto(String nombreproducto) {
        this.nombreproducto = nombreproducto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getCostouni() {
        return costouni;
    }

    public void setCostouni(double costouni) {
        this.costouni = costouni;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getFechaing() {
        return fechaing;
    }

    public void setFechaing(String fechaing) {
        this.fechaing = fechaing;
    }

    public String getFechacad() {
        return fechacad;
    }

    public void setFechacad(String fechacad) {
        this.fechacad = fechacad;
    }

    public String getRutaimg() {
        return rutaimg;
    }

    public void setRutaimg(String rutaimg) {
        this.rutaimg = rutaimg;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    
  
    
}
