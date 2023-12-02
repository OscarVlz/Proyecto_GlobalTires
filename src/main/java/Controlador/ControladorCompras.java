/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.DTO.CompraDTO;
import Modelo.DTO.ConsultaDTO;
import Modelo.ModeloCompra;

/**
 *
 * @author Elkur
 */
public class ControladorCompras {

    public String getProductosTabla(int id) {
        ModeloCompra mc = new ModeloCompra();
        String htmlcode = "";
        for (ConsultaDTO compra : mc.getAllCompras(id)) {
            htmlcode
                    += "<tr>"
                    + "<td>" + compra.getId_compra() + "</td>"
                    + "<td>" + compra.getNombreProducto() + "</td>"
                    + "<td>" + compra.getCantidadProducto() + "</td>"
                    + "<td>" + compra.getCosto_individual() + "</td>"
                    + "<td>" + compra.getCantidadProducto() * compra.getCosto_individual() + "</td>"
                    + "</tr>";
        }
        return htmlcode;
    }
}
