/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author oscar
 */
public class Consultas extends Conexion {

    public boolean autenticacion(String usuario, String clave) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "select * from cliente where usuario=? and pass=?";
            System.out.println("Consulta es;" + consulta);
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, clave);
            rs=pst.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if(getConexion()!=null){
                    getConexion().close();
                }
                if(pst!=null) pst.close();
                if(rs!=null) rs.close();

            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }

        }
        return false;
    }
    
    public boolean autenticacionAdmin(String usuario, String clave) {
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            String consulta = "select * from administrador where usuario=? and pass=?";
            System.out.println("Consulta es;" + consulta);
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, clave);
            rs=pst.executeQuery();
            if(rs.next()){
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if(getConexion()!=null){
                    getConexion().close();
                }
                if(pst!=null) pst.close();
                if(rs!=null) rs.close();

            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }

        }
        return false;
    }
    
    public boolean registrar(String usuario, String clave) {
        PreparedStatement pst = null;
        
        try {
            String consulta = "insert into cliente (usuario, pass) values(?,?)";
            System.out.println("Consulta es;" + consulta);
            pst = getConexion().prepareStatement(consulta);
            pst.setString(1, usuario);
            pst.setString(2, clave);
            if(pst.executeUpdate()==1){
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if(getConexion()!=null){
                    getConexion().close();
                }
                if(pst!=null) pst.close();
                

            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }

        }
        return false;
    }

}
