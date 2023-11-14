/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author Equipo 2
 */
public class Producto {
    private int id;
    private String nombre;
    private String img;
    private double precio;
    private int stock;
    private String descripcion;
    private String tipo;

    public Producto() {
    }

    public Producto(int id, String nombre, String tipo, String img, double precio, int stock, String descripcion) {
        this.id = id;
        this.nombre = nombre;
        this.tipo = tipo;
        this.img = img;
        this.precio = precio;
        this.stock = stock;
        this.descripcion = descripcion;
    }

    public Producto(String nombre, String img, double precio, int stock, String descripcion, String tipo) {
        this.nombre = nombre;
        this.img = img;
        this.precio = precio;
        this.stock = stock;
        this.descripcion = descripcion;
        this.tipo = tipo;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    @Override
    public String toString() {
        return "Producto{" + "id=" + id + ", nombre=" + nombre + ", img=" + img + ", precio=" + precio + ", stock=" + stock + ", descripcion=" + descripcion + ", tipo=" + tipo + '}';
    }
      
    
}
