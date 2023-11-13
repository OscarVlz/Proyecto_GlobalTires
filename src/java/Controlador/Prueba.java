/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package Controlador;

import Modelo.ModeloProducto;

/**
 *
 * @author oscar
 */
public class Prueba {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Conexion co= new Conexion();
        co.getConexion();
        
        ModeloProducto mp = new ModeloProducto();
        System.out.println(mp.getAllProductosDesc());
    }
    
}
