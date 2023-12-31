/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Modelo.DTO.ClienteDTO;
import Modelo.DTO.CompraDTO;
import Modelo.DTO.ComprasDTO;
import Modelo.dominio.Cliente;
import Modelo.ModeloCliente;
import Modelo.ModeloCompra;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;

/**
 *
 * @author Equipo 2
 */
@WebServlet(name = "CrudClientes", urlPatterns = {"/CrudClientes"})
public class CrudClientes extends HttpServlet {

    String consultar = "crudClientes.jsp";
    String editar = "editCliente.jsp";
    String nuevo = "nuevoCliente.jsp";
    Cliente cliente;
    String eliminar = "eliminarCliente.jsp";
    ModeloCliente modelC = new ModeloCliente();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CrudClientes</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CrudClientes at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = "";
        String action = request.getParameter("accion");
        if (action.equalsIgnoreCase("consultar")) {
            modelC.reconect();
            acceso = consultar;
        } else if (action.equalsIgnoreCase("editar")) {
            modelC.reconect();
            request.setAttribute("idper", request.getParameter("id"));
            acceso = editar;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            modelC.reconect();
            int id = Integer.parseInt(request.getParameter("txtid"));
            String usuario = request.getParameter("usuario");
            String contra = request.getParameter("pass");
            String correo = request.getParameter("correo");
            String nombres = request.getParameter("nombres");
            String apellidoM = request.getParameter("apellidoM");
            String  apellidoP = request.getParameter("apellidoP");
            
            cliente = new Cliente(id, usuario, contra, correo, apellidoP, apellidoM, nombres);
            modelC.actualizarCliente(cliente);
            acceso = consultar;
        } else if (action.equalsIgnoreCase("Eliminar")) {
            modelC.reconect();
            int id = Integer.parseInt(request.getParameter("id"));
            cliente = new Cliente(id);
            modelC.eliminarCliente(id);
            acceso = consultar;
        } else if (action.equalsIgnoreCase("mostrarcreado")) {
            modelC.reconect();
            String usuario = request.getParameter("usuario");
            String pass = request.getParameter("pass");
            String nombres = request.getParameter("nombres");
            String apellidoP = request.getParameter("apellidoP");
            String apellidoM = request.getParameter("apellidoM");
            String correo = request.getParameter("correo");

            cliente = new Cliente(usuario, pass);
            modelC.insertarCliente(usuario, pass, correo, nombres, apellidoP, apellidoM);

            acceso = consultar;
        } else if (action.equalsIgnoreCase("crear")) {
            acceso = nuevo;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");

        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String json = sb.toString();

        Gson gson = new Gson();
        ClienteDTO data = gson.fromJson(json, ClienteDTO.class);

        ModeloCliente modelo = new ModeloCliente();
        System.out.println(data.getCliente());
        modelC.actualizarCliente(data.getCliente());

        String respuesta = gson.toJson(new Respuesta("Valores actualizados").addValueRespuesta("usuario", data.getCliente().getUsuario()));
        System.out.println(respuesta);
        PrintWriter out = response.getWriter();
        out.print(respuesta);
        out.flush();
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
