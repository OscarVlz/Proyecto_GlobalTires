/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import Modelo.Cliente;
import Modelo.ModeloCliente;

/**
 *
 * @author JORGE
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
                    + "<td>Editar</td>"
                    + "<td>Eliminar</td>"
                    + "</tr>";
        }
        return htmlcode;
    }

    public Cliente getCliente(int id) {
        return new ModeloCliente().getCliente(id);
    }
}
