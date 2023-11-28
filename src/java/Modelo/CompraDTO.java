/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Elkur
 */
public class CompraDTO {

    private float costo_individual;
    private int cantidad;
    private String nombre_producto;
    private String descripcion;
    
    public float getCosto_individual() {
        return costo_individual;
    }

    public CompraDTO setCosto_individual(float costo_individual) {
        this.costo_individual = costo_individual;
        return this;
    }

    public int getCantidad() {
        return cantidad;
    }

    public CompraDTO setCantidad(int cantidad) {
        this.cantidad = cantidad;
        return this;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public CompraDTO setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
        return this;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public CompraDTO setDescripcion(String descripcion) {
        this.descripcion = descripcion;
        return this;
    }

}
