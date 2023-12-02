/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.dominio;

import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Equipo 2
 */
public class Cliente {

    private int id;

    private String usuario;

    private String pass;

    private String correo;

    private String apellidoP;

    private String apellidoM;

    private String nombres;

    public Cliente(int id, String usuario, String pass, String correo, String apellidoP, String apellidoM, String nombres) {
        this.id = id;
        this.usuario = usuario;
        this.pass = pass;
        this.correo = correo;
        this.apellidoP = apellidoP;
        this.apellidoM = apellidoM;
        this.nombres = nombres;
    }

    public Cliente(int id, String usuario, String pass) {
        this.id = id;
        this.usuario = usuario;
        this.pass = pass;
    }

    public Cliente(int id) {
        this.id = id;
    }

    public Cliente(String usuario, String pass) {
        this.usuario = usuario;
        this.pass = pass;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getApellidoP() {
        return apellidoP;
    }

    public void setApellidoP(String apellidoP) {
        this.apellidoP = apellidoP;
    }

    public String getApellidoM() {
        return apellidoM;
    }

    public void setApellidoM(String apellidoM) {
        this.apellidoM = apellidoM;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    @Override
    public String toString() {
        return "Cliente{" + "id=" + id + ", usuario=" + usuario + ", clave=" + pass + ", correo=" + correo + ", apellidoP=" + apellidoP + ", apellidoM=" + apellidoM + ", nombres=" + nombres + '}';
    }

}
