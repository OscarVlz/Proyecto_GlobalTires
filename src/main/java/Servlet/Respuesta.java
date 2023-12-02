/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servlet;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Elkur
 */
public class Respuesta {

    private String respuesta;
    private Map<String, String> valores;

    public Respuesta(String respueta) {
        this.respuesta = respueta;
        valores = new HashMap<>();
    }
    
    public Respuesta addValueRespuesta(String nombre, String valor){
        valores.put(nombre, valor);
        return this;
    }

    public Respuesta() {
    }

    public String getRespueta() {
        return respuesta;
    }

    public void setRespueta(String respueta) {
        this.respuesta = respueta;
    }

}
