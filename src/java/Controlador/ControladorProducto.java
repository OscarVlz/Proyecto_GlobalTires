/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.ModeloProducto;
import Modelo.Producto;

/**
 *
 * @author JORGE
 */
public class ControladorProducto {

    public String getProductos() {
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        String tipo = "";
        for (Producto producto : mp.getAllProductos()) {
            if (producto.getTipo().equals("TodoTerreno")) {
                tipo = "gra";
            } else if (producto.getTipo().equals("Vehiculos")) {
                tipo = "des";
            } else if (producto.getTipo().equals("Pesados")) {
                tipo = "dev";
            }

            htmlcode
                    += "<div class=\"col-lg-4 col-md-4 all " + tipo + "\">"
                    + "<div class=\"product-item\">"
                    + "<img src=\"" + "assets/images" + "/" + producto.getTipo() + "/" + producto.getImg() + "\" alt=\"\">\n"
                    + "<div class=\"down-content\">\n"
                    + "<h4>" + producto.getNombre() + "</h4>\n"
                    + "<h6>$" + producto.getPrecio() + "</h6>\n"
                    + "<p>" + producto.getDescripcion() + "</p>\n"
                    + "<ul class=\"stars\">\n"
                    + "<li><a href=\"detallesProducto.jsp?id=" + producto.getId() + "\" class=\"filled-button\">Ver detalles</a></li>"
                    + "</ul>\n"
                    + "</div>\n"
                    + "</div>\n"
                    + "</div>";
        }
        return htmlcode;
    }
    
    public String getUltimosProductos() {
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        String tipo = "";
        for (Producto producto : mp.getAllProductosDesc()) {
            if (producto.getTipo().equals("TodoTerreno")) {
                tipo = "gra";
            } else if (producto.getTipo().equals("Vehiculos")) {
                tipo = "des";
            } else if (producto.getTipo().equals("Pesados")) {
                tipo = "dev";
            }

            htmlcode
                    += "<div class=\"col-lg-4 col-md-4 all " + tipo + "\">"
                    + "<div class=\"product-item\">"
                    + "<img src=\"" + "assets/images" + "/" + producto.getTipo() + "/" + producto.getImg() + "\" alt=\"\">\n"
                    + "<div class=\"down-content\">\n"
                    + "<h4>" + producto.getNombre() + "</h4>\n"
                    + "<h6>$" + producto.getPrecio() + "</h6>\n"
                    + "<p>" + producto.getDescripcion() + "</p>\n"
                    + "<ul class=\"stars\">\n"
                    + "<li><a href=\"detallesProducto.jsp?id=" + producto.getId() + "\" class=\"filled-button\">Ver detalles</a></li>"
                    + "</ul>\n"
                    + "</div>\n"
                    + "</div>\n"
                    + "</div>";
        }
        return htmlcode;
    }

    public String getProductosTabla() {
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        for (Producto producto : mp.getAllProductos()) {
            htmlcode
                    += "<tr>"
                    + "<td>"+producto.getId()+"</td>"
                    + "<td>"+producto.getNombre()+"</td>"
                    + "<td>"+producto.getTipo()+"</td>"
                    + "<td>"+producto.getImg()+"</td>"
                    + "<td>$"+producto.getPrecio()+"</td>"
                    + "<td>"+producto.getStock()+"</td>"
                    + "<td>"+producto.getDescripcion()+"</td>"
                    + "<td>Editar</td>"
                    + "<td>Eliminar</td>"
                    + "</tr>";
        }
        return htmlcode;
    }

    public Producto getProducto(int id) {
        return new ModeloProducto().getProducto(id);
    }
}
