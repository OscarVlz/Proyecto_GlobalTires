/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Controlador.Consultas;
import Modelo.DTO.ClienteDTO;
import Modelo.ModeloCliente;
import Modelo.dominio.Cliente;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;

/**
 *
 * @author Equipo 2
 */
public class RegistrarUsuarios extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        String usuario = request.getParameter("usuario");
        String clave = request.getParameter("pass");
        String nombres = request.getParameter("nombres");
        String apellidoP = request.getParameter("apellidoP");
        String apellidoM = request.getParameter("apellidoM");
        String correo = request.getParameter("correo");

        Consultas sql = new Consultas();

        if (sql.registrar(usuario, clave, nombres, apellidoP, apellidoM, correo)) {
            response.sendRedirect("index.jsp");

        } else {
            response.sendRedirect("registro.jsp");

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        processRequest(request, response);
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
        Cliente c = data.getCliente();
        System.out.println(c);
        System.out.println(json);
        Respuesta res = new Respuesta("fallo").addValueRespuesta("mensaje", "No se pudo realizar el registro");

        if (c != null) {
            Consultas cons = new Consultas();

            if (!cons.verificarUsuario(c.getUsuario())) {
                res = new Respuesta("fallo").addValueRespuesta("mensaje", "El usuario ingresado ya esta en uso");
            } else if (!cons.verificarCorreo(c.getCorreo())) {
                res = new Respuesta("fallo").addValueRespuesta("mensaje", "El correo ingresado ya esta en uso");
            } else if (cons.registrar(c.getUsuario(), c.getPass(), c.getNombres(), c.getApellidoP(), c.getApellidoM(), c.getCorreo())) {
                res = new Respuesta("exito").addValueRespuesta("mensaje", "Bienvenido " + c.getUsuario());
            }
        }

        String respuesta = gson.toJson(res);

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
