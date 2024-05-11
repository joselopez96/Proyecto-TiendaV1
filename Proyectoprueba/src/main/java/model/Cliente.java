/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import ModelPrimary.Roles;

/**
 *
 * @author Usuario
 */
public class Cliente extends Roles{
    private String idusuario;
    private String nusuario;
    private String contra;
    private int estado;
    private String nombrepr;
    private String nombresec;
    private String apellidop;
    private String apellidom;
    private String correo;
    private String fechanac;
    private int sexo;

    public Cliente(String idusuario, String nusuario, String contra, int estado, String nombrepr, String nombresec, String apellidop, String apellidom, String correo, String fechanac, int sexo, String idrol, String nombrerol) {
        super(idrol, nombrerol);
        this.idusuario = idusuario;
        this.nusuario = nusuario;
        this.contra = contra;
        this.estado = estado;
        this.nombrepr = nombrepr;
        this.nombresec = nombresec;
        this.apellidop = apellidop;
        this.apellidom = apellidom;
        this.correo = correo;
        this.fechanac = fechanac;
        this.sexo = sexo;
    }

    public String getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(String idusuario) {
        this.idusuario = idusuario;
    }

    public String getNusuario() {
        return nusuario;
    }

    public void setNusuario(String nusuario) {
        this.nusuario = nusuario;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getNombrepr() {
        return nombrepr;
    }

    public void setNombrepr(String nombrepr) {
        this.nombrepr = nombrepr;
    }

    public String getNombresec() {
        return nombresec;
    }

    public void setNombresec(String nombresec) {
        this.nombresec = nombresec;
    }

    public String getApellidop() {
        return apellidop;
    }

    public void setApellidop(String apellidop) {
        this.apellidop = apellidop;
    }

    public String getApellidom() {
        return apellidom;
    }

    public void setApellidom(String apellidom) {
        this.apellidom = apellidom;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getFechanac() {
        return fechanac;
    }

    public void setFechanac(String fechanac) {
        this.fechanac = fechanac;
    }

    public int getSexo() {
        return sexo;
    }

    public void setSexo(int sexo) {
        this.sexo = sexo;
    }
    
    
    
    
}
