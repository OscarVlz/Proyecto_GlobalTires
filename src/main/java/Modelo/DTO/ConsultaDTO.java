/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.DTO;

/**
 *
 * @author Elkur
 */
public class ConsultaDTO {

    private int id_compra;
    private String nombreProducto;
    private int cantidadProducto;
    private double costo_individual;

    public int getId_compra() {
        return id_compra;
    }

    public ConsultaDTO setId_compra(int id_compra) {
        this.id_compra = id_compra;
        return this;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public ConsultaDTO setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
        return this;
    }

    public int getCantidadProducto() {
        return cantidadProducto;
    }

    public ConsultaDTO setCantidadProducto(int cantidadProducto) {
        this.cantidadProducto = cantidadProducto;
        return this;
    }

    public double getCosto_individual() {
        return costo_individual;
    }

    public ConsultaDTO setCosto_individual(double costo_individual) {
        this.costo_individual = costo_individual;
        return this;
    }

    
    
    
    @Override
    public String toString() {
        return "ConsultaDTO{" + "id_compra=" + id_compra + ", nombreProducto=" + nombreProducto + ", cantidadProducto=" + cantidadProducto + ", costo_individual=" + costo_individual + '}';
    }
    
    

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 53 * hash + this.id_compra;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ConsultaDTO other = (ConsultaDTO) obj;
        return this.id_compra == other.id_compra;
    }

}
