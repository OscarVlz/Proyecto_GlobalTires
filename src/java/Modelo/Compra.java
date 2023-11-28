/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Elkur
 */
public class Compra {

    private int id;
    private int cantidad;
    private int id_producto;
    private int id_cliente;
    private double costo_individual;

    public Compra(int id, int cantidad, int id_producto, int id_cliente, double costo_individual) {
        this.id = id;
        this.cantidad = cantidad;
        this.id_producto = id_producto;
        this.id_cliente = id_cliente;
        this.costo_individual = costo_individual;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public double getCosto_individual() {
        return costo_individual;
    }

    public void setCosto_individual(double costo_individual) {
        this.costo_individual = costo_individual;
    }

}
