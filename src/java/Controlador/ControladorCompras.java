/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.CompraDTO;
import Modelo.ModeloCompra;

/**
 *
 * @author Elkur
 */
public class ControladorCompras {

    public String getProductosTabla(int id) {
        ModeloCompra mc = new ModeloCompra();
        String htmlcode = "";
        for (CompraDTO compra : mc.getAllCompras(id)) {
            htmlcode
                    += "<tr>"
                    + "<td>" + compra.getNombre_producto()+ "</td>"
                    + "<td>" + compra.getDescripcion()+ "</td>"
                    + "<td>" + compra.getCantidad()+ "</td>"
                    + "<td>" + compra.getCosto_individual()+ "</td>"
                    + "<td>" + compra.getCantidad()*compra.getCosto_individual() + "</td>"
                    + "</tr>";
        }
        return htmlcode;
    }
}
