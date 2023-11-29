/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Modelo.ModeloProducto;
import Modelo.Producto;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author Equipo 2
 */
@MultipartConfig
public class CrudProductos extends HttpServlet {

//    String consultar="consultarProductos.jsp";
    String consultar = "consultarProductos.jsp";
    String editar = "editProducto.jsp";
    String crear = "nuevoProducto.jsp";
    Producto producto;
    ModeloProducto modeloProducto = new ModeloProducto();

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

        String acceso = "";
        String action = request.getParameter("accion");

        modeloProducto.reconect();
        if (action.equalsIgnoreCase("consultar")) {
            acceso = consultar;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idper", request.getParameter("id"));
            acceso = editar;
        } else if (action.equalsIgnoreCase("Eliminar")) {
            int id = Integer.parseInt(request.getParameter("id"));
            producto = new Producto(id);
            modeloProducto.eliminarProducto(id);
            acceso = consultar;

        } else if (action.equalsIgnoreCase("crear")) {
            acceso = crear;
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
        String acceso = "";
        String action = request.getParameter("accion");

        if (action.equalsIgnoreCase("Actualizar")) {
            int id = Integer.parseInt(request.getParameter("txtid"));
            String nombre = request.getParameter("txtNom");
            double precio = Double.parseDouble(request.getParameter("txtPrecio"));
            String img = request.getParameter("txtimg");
            int stock = Integer.parseInt(request.getParameter("txtStock"));
            String descripcion = request.getParameter("txtDescripcion");
            String tipo = request.getParameter("txtTipo");

            producto = new Producto(id, nombre, tipo, img, precio, stock, descripcion);
            modeloProducto.actualizarProducto(producto);
            acceso = consultar;
        } else if (action.equalsIgnoreCase("mostrarCreado")) {
            String nombre = request.getParameter("txtNom");
            double precio = Double.parseDouble(request.getParameter("txtPrecio"));

            Part filePart = request.getPart("txtimg");
            String fileName = filePart.getSubmittedFileName();

            String uploadPath = getServletContext().getRealPath("") + "assets" + File.separator + "images" + File.separator + "Pesados";
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, new File(uploadPath, fileName).toPath(), StandardCopyOption.REPLACE_EXISTING);
            }

            int stock = Integer.parseInt(request.getParameter("txtStock"));
            String descripcion = request.getParameter("txtDescripcion");
            String tipo = request.getParameter("txtTipo");

            producto = new Producto(nombre, fileName, precio, stock, descripcion, tipo);
            modeloProducto.insertarProducto(nombre, tipo, fileName, precio, stock, descripcion);
            acceso = consultar;

        }

        response.sendRedirect(acceso);
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
