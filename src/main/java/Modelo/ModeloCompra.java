/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Modelo.dominio.Compra;
import Modelo.DTO.CompraDTO;
import Controlador.Conexion;
import Modelo.DTO.ConsultaDTO;
import Modelo.DTO.ProductoDTO;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Elkur
 */
public class ModeloCompra extends Conexion {

    public void insertarCompra(int id_usuario, CompraDTO compra) throws ModeloException{
        PreparedStatement pst = null;
        ResultSet rs = null;
        Integer pkPago = -1;
        Integer pkCompra = -1;

        try {
            String pago = "INSERT INTO pagos(num_tarjeta, fecha_vencimiento, numSeguridad,cantidad_pagada) VALUES (?,?,?,?)";
            System.out.println("Insert es;" + pago);

            pst = getConexion().prepareStatement(pago, Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, compra.getNumTarjeta());
            pst.setDate(2, parseDateSQL(compra.getFechaVencimiento()));
            pst.setString(3, compra.getNumSeguridad());
            pst.setDouble(4, getTotal(compra.getProductos()));

            pst.executeUpdate();
            rs = pst.getGeneratedKeys();
            if (rs.next()) {
                pkPago = rs.getInt(1);
            }
        } catch (Exception e) {
            throw new ModeloException("La insersion fallo");
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }

            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }

        }
        try {
            this.reconect();
            String compraQuery = "INSERT INTO compras(id_pago,id_cliente) VALUES(?,?)";
            pst = getConexion().prepareStatement(compraQuery, Statement.RETURN_GENERATED_KEYS);

            pst.setInt(1, pkPago);
            pst.setInt(2, id_usuario);

            pst.executeUpdate();

            rs = pst.getGeneratedKeys();

            if (rs.next()) {
                pkCompra = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (getConexion() != null) {
                    getConexion().close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (rs != null) {
                    rs.close();
                }

            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }
        }
        for (ProductoDTO prod : compra.getProductos()) {
            try {
                this.reconect();

                String compraQuery = "INSERT INTO articulos(cantidad,costo_individual,id_producto,id_compra) VALUES(?,?,?,?)";
                pst = getConexion().prepareStatement(compraQuery);

                pst.setInt(1, prod.getCantidad());
                pst.setDouble(2, prod.getPrecio());
                pst.setInt(3, Integer.parseInt(prod.getId()));
                pst.setInt(4, pkCompra);

                pst.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (getConexion() != null) {
                        getConexion().close();
                    }
                    if (pst != null) {
                        pst.close();
                    }
                    if (rs != null) {
                        rs.close();
                    }

                } catch (Exception e) {
                    System.out.println("Error en: " + e);
                }
            }
        }

    }

    public java.sql.Date parseDateSQL(String date) {

        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");

        java.util.Date fecha;
        try {
            fecha = formater.parse(date);
            java.sql.Date fechasql = new java.sql.Date(fecha.getTime());

            return fechasql;
        } catch (ParseException ex) {
            Logger.getLogger(ModeloCompra.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public double getTotal(List<ProductoDTO> productos) {
        double subtotal = 0;
        for (ProductoDTO pro : productos) {
            subtotal += pro.getTotalProducto();
        }

        return subtotal * 1.16;
    }

    public ArrayList<ConsultaDTO> getAllCompras(int id) {
        ArrayList<ConsultaDTO> compras = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT c.id, pr.nombre, a.cantidad, a.costo_individual  FROM compras c INNER JOIN articulos a INNER JOIN pagos p INNER JOIN productos pr ON c.id = a.id_compra AND p.id = c.id_pago AND pr.id = a.id_producto WHERE c.id_cliente = ? ORDER BY c.id;";
            pst = getConexion().prepareStatement(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();

            while (rs.next()) {
                compras.add(new ConsultaDTO()
                        .setId_compra(rs.getInt("id"))
                        .setNombreProducto(rs.getString("nombre"))
                        .setCantidadProducto(rs.getInt("cantidad"))
                        .setCosto_individual(rs.getDouble("costo_individual"))
                );
            }
        } catch (Exception e) {

        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pst != null) {
                    pst.close();
                }
                if (getConexion() != null) {
                    getConexion().close();
                }
            } catch (Exception e) {

            }
        }
        return compras;
    }
}
