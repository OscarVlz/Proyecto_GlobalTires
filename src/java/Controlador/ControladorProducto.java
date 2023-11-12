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

//    public String getProductos(){
//        ModeloProducto mp = new ModeloProducto();
//        String htmlcode = "";
//        for (Producto producto : mp.getAllProductos()) {
//            htmlcode
//                    += "<div class=\"col-sm-4\">\n"
//                    + "           <div class=\"card\">\n"
//                    + "	    <div class=\"productinfo text-center\">\n"
//                    + "	    <img src=\"" + producto.getImg() + "\" alt=\"\" width=\"230\" height=\"230\" />\n"
//                    + "	    <h2>$" + producto.getPrecio() + "</h2>\n"
//                    + "	    <p>" + producto.getNombre() + "</p>\n"
//                    + "	    <a href=\"product-details.jsp?id=" + producto.getId() + "\" class=\"btn btn-default add-to-cart\"><i class=\"fa fa-shopping-cart\"></i>Ver detalles</a>\n"
//                    + "	    </div>\n"
//                    + "	    <div class=\"card-footer\">\n"
//                    + "	    <li><a href=\"\"><i class=\"fa fa-plus-square\"></i>Agregar al carrito</a></li>\n"
//                    + "	    </div>\n"
//                    + "	    </div><br>\n"
//                    + "	    </div>";
//        }
//        return htmlcode;
//    }
    public String getProductos() {
        ModeloProducto mp = new ModeloProducto();
        String htmlcode = "";
        String tipo = "";
        String imgTipo="";
        for (Producto producto : mp.getAllProductos()) {
            if(producto.getTipo().equals("Todo Terreno")){
                tipo="gra";
                imgTipo="TodoTerreno";
            }else if(producto.getTipo().equals("Vehiculo")){
                tipo="des";
                imgTipo="Vehiculos";
            }else if(producto.getTipo().equals("Pesado")){
                tipo="dev";
                imgTipo="Pesados";
            }
            
            htmlcode
                    += "<div class=\"col-lg-4 col-md-4 all "+ tipo +"\">"
                    + "<div class=\"product-item\">"
                    + "<img src=\"" + "assets/images"+"/"+imgTipo+"/"+ producto.getImg() + "\" alt=\"\">\n"
                    + "<div class=\"down-content\">\n"
                    + "<h4>" + producto.getNombre() + "</h4>\n"
                    + "<h6>$" + producto.getPrecio() + "</h6>\n"
                    + "<p>" + producto.getDescripcion() + "</p>\n"
                    + "<ul class=\"stars\">\n"
                    + "<li><a href=\"\" class=\"filled-button\" data-toggle=\"modal\" data-target=\"#loginModal\">Ver detalles</a></li>"
                    + "</ul>\n"
                    + "</div>\n"
                    + "</div>\n"
                    + "</div>";
        }
        return htmlcode;
    }

    public Producto getProducto(int id) {
        return new ModeloProducto().getProducto(id);
    }
}
