/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.dominio.Cliente;
import Modelo.ModeloCliente;

/**
 *
 * @author Equipo 2
 */
public class ControladorCliente {

    public String getClientesTabla() {
        ModeloCliente mc = new ModeloCliente();
        String htmlcode = "";
        for (Cliente cliente : mc.getAllClientes()) {
            htmlcode
                    += "<tr>"
                    + "<td>" + cliente.getId() + "</td>"
                    + "<td>" + cliente.getUsuario() + "</td>"
                    + "<td>" + cliente.getClave() + "</td>"
                    + "<td>" + "<a href=\"CrudClientes?accion=editar&id=" + cliente.getId() + "\">Editar</a>" + "</td>"
                    + "<td>" + "<a href=\"CrudClientes?accion=eliminar&id=" + cliente.getId() + "\">Eliminar</a>" + "</td>"
                    + "</tr>";
        }
        return htmlcode;
    }

    public Cliente getCliente(int id) {
        return new ModeloCliente().getCliente(id);
    }
}
