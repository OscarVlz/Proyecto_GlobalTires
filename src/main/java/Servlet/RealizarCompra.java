/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Servlet;

import Modelo.dominio.Articulo;
import Modelo.dominio.Compra;
import Modelo.DTO.CompraDTO;
import Modelo.ModeloCompra;
import Modelo.ModeloProducto;
import Modelo.DTO.ComprasDTO;
import Modelo.DTO.ProductoDTO;
import Modelo.ModeloException;
import Modelo.dominio.Producto;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonSyntaxException;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Iterator;

/**
 *
 * @author Elkur
 */
@WebServlet(name = "RealizarCompra", urlPatterns = {"/RealizarCompra"})
public class RealizarCompra extends HttpServlet {

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
        ComprasDTO data = gson.fromJson(json, ComprasDTO.class);

        CompraDTO compra = data.getData();
        ArrayList<Integer> idsProductos = new ArrayList<>();
        ArrayList<Integer> cantidad = new ArrayList<>();
        Respuesta res = new Respuesta("exito");
        ModeloProducto modeloP = new ModeloProducto();
        boolean disponibles = true;
        for (ProductoDTO pro : compra.getProductos()) {
            System.out.println(pro);
            Producto p = modeloP.getProducto(Integer.parseInt(pro.getId()));
            if (p.getStock() < pro.getCantidad()) {
                res = new Respuesta("fallo").addValueRespuesta("mensaje", "El stock del producto " + p.getNombre() + " no es suficiente, se cuentan con: " + p.getStock());
                disponibles = false;
            }
            idsProductos.add(p.getId());
            cantidad.add(pro.getCantidad());
            modeloP.reconect();

        }

        if (disponibles) {
            ModeloCompra modelo = new ModeloCompra();

            int id = Integer.parseInt(request.getSession().getAttribute("id").toString());
            try {
                modelo.insertarCompra(id, compra);
                for (int i = 0; i < cantidad.size(); i++) {
                    modeloP.reconect();
                    Producto p = modeloP.getProducto(idsProductos.get(i));
                    System.out.println("-------------------------------");
                    System.out.println(p);
                    p.setStock(p.getStock() - cantidad.get(i));
                    System.out.println(p.getStock() - cantidad.get(i));
                    modeloP.reconect();
                    modeloP.actualizarProducto(p);
                }
            } catch (ModeloException e) {
                res = new Respuesta("fallo").addValueRespuesta("mensaje", "No se pudo concretar la compra");
            }

        }
        System.out.println(res);
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
