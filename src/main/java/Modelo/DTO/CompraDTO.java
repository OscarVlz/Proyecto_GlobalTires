/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.DTO;

import java.util.List;

/**
 *
 * @author Elkur
 */
public class CompraDTO {

    private String numTarjeta;
    private String fechaVencimiento;
    private String numSeguridad;
    private List<ProductoDTO> productos;

    public CompraDTO(String numTarjeta, String fechaVencimiento, String numSeguridad, List<ProductoDTO> productos) {
        this.numTarjeta = numTarjeta;
        this.fechaVencimiento = fechaVencimiento;
        this.numSeguridad = numSeguridad;
        this.productos = productos;
    }

    public CompraDTO() {
    }

    public String getNumTarjeta() {
        return numTarjeta;
    }

    public void setNumTarjeta(String numTarjeta) {
        this.numTarjeta = numTarjeta;
    }

    public String getFechaVencimiento() {
        return fechaVencimiento;
    }

    public void setFechaVencimiento(String fechaVencimiento) {
        this.fechaVencimiento = fechaVencimiento;
    }

    public String getNumSeguridad() {
        return numSeguridad;
    }

    public void setNumSeguridad(String numSeguridad) {
        this.numSeguridad = numSeguridad;
    }

    public List<ProductoDTO> getProductos() {
        return productos;
    }

    public void setProductos(List<ProductoDTO> productos) {
        this.productos = productos;
    }

    @Override
    public String toString() {
        return "CompraDTO{" + "numTarjeta=" + numTarjeta + ", fechaVencimiento=" + fechaVencimiento + ", numSeguridad=" + numSeguridad + ", productos=" + productos + '}';
    }

}
