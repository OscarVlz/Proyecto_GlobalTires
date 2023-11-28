/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Controlador.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Elkur
 */
public class ModeloCompra extends Conexion {

    public Compra insertarCompra(int id_usuario, double costo_individual, int cantidad, int id_producto) {
        Compra compra = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String insert = "insert into compra(id_cliente,cantidad,id_producto, costo_individual) values (?,?,?,?);";
            System.out.println("Insert es;" + insert);
            pst = getConexion().prepareStatement(insert, Statement.RETURN_GENERATED_KEYS);
            pst.setInt(1, id_usuario);
            pst.setInt(2, cantidad);
            pst.setInt(3, id_producto);
            pst.setDouble(4, costo_individual);

            pst.executeUpdate();
            rs = pst.getGeneratedKeys();
            if (rs.next()) {
                Integer pk = rs.getInt(1);
                compra = new Compra(pk, cantidad, id_producto, id_usuario, costo_individual);
            }
        } catch (Exception e) {
            System.out.println("Error en: " + e);
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
        return compra;
    }

    public ArrayList<CompraDTO> getAllCompras(int id) {
        ArrayList<CompraDTO> compras = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT compra.*, p.nombre, p.descripcion, c.usuario FROM global_tires.compra INNER JOIN cliente c INNER JOIN producto p on c.id_cliente = ? AND p.id_producto = compra.id_producto;";
            pst = getConexion().prepareStatement(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();

            while (rs.next()) {
                compras.add(new CompraDTO()
                        .setCantidad(rs.getInt("cantidad"))
                        .setCosto_individual(rs.getInt("costo_individual"))
                        .setDescripcion(rs.getString("descripcion"))
                        .setNombre_producto(rs.getString("nombre"))
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
