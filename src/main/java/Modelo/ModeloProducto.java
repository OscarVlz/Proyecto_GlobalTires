/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import Modelo.dominio.Producto;
import Controlador.Conexion;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Equipo 2
 */
public class ModeloProducto extends Conexion{
    
     public ArrayList<Producto> getAllProductos(){
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        
        try {
            String sql = "SELECT * FROM productos";
            pst = getConexion().prepareStatement(sql);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                productos.add(new Producto(rs.getInt("id"), rs.getString("nombre"), rs.getString("tipo"),
                        rs.getString("img_producto"), rs.getDouble("precio"), rs.getInt("stock"), rs.getString("descripcion")));
            }
        } catch (Exception e){
            
        }finally{
            try{
                if(rs != null){
                    rs.close();
                }
                if(pst != null){
                    pst.close();
                }
                if(getConexion()!=null){
                    getConexion().close();
                }
            }catch (Exception e){
                
            }
        }
        return productos;
    }
     
     public ArrayList<Producto> getAllProductosDesc(){
        ArrayList<Producto> productos = new ArrayList<>();
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        
        try {
            String sql = "SELECT * FROM productos ORDER BY id DESC";
            pst = getConexion().prepareStatement(sql);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                productos.add(new Producto(rs.getInt("id"), rs.getString("nombre"), rs.getString("tipo"),
                        rs.getString("img_producto"), rs.getDouble("precio"), rs.getInt("stock"), rs.getString("descripcion")));
            }
        } catch (Exception e){
            
        }finally{
            try{
                if(rs != null){
                    rs.close();
                }
                if(pst != null){
                    pst.close();
                }
                if(getConexion()!=null){
                    getConexion().close();
                }
            }catch (Exception e){
                
            }
        }
        return productos;
    }
    
    public Producto getProducto(int id){
        Producto producto = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try{
            String sql = "SELECT * FROM productos WHERE id = ?";
            pst = getConexion().prepareStatement(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                producto = new Producto(rs.getInt("id"), rs.getString("nombre"), rs.getString("tipo"),
                        rs.getString("img_producto"), rs.getDouble("precio"), rs.getInt("stock"), rs.getString("descripcion"));
            }
        }catch (Exception e){
            
        }finally{
            try{
                if(rs != null){
                    rs.close();
                }
                if(pst != null){
                    pst.close();
                }
                if(getConexion() !=null){
                    getConexion().close();
                }
            }catch (Exception e){
                
            }
        }
        return producto;
    }
    
    
    public Producto insertarProducto(String nombre, String tipo, String img, double precio, int stock, String descripcion){
        Producto producto = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            this.reconect();
            String insert = "insert into productos(nombre,tipo,img_producto,precio,stock,descripcion) values (?,?,?,?,?,?);";
            System.out.println("Insert es;" + insert);
            pst = getConexion().prepareStatement(insert,Statement.RETURN_GENERATED_KEYS);
            pst.setString(1, nombre);
            pst.setString(2, tipo);
            pst.setString(3, img);
            pst.setDouble(4, precio);
            pst.setInt(5, stock);
            pst.setString(6, descripcion);
            
            pst.executeUpdate();
            rs=pst.getGeneratedKeys();
            if(rs.next()){
                Integer pk = rs.getInt(1);
                producto = new Producto(pk,nombre,tipo,img,precio,stock,descripcion);
            }
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if(getConexion()!=null){
                    getConexion().close();
                }
                if(pst!=null) pst.close();
                if(rs!=null) rs.close();

            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }

        }
        return producto;
    }
    
    
    public int actualizarProducto(Producto producto){
        PreparedStatement pst = null;
        int result = -1;
        try {
            String update = "update productos set nombre=?, tipo=? ,img_producto=? ,precio=? ,stock=? ,descripcion=? where id=?";
            System.out.println("update es;" + update);
            pst = getConexion().prepareStatement(update);
            pst.setString(1, producto.getNombre());
            pst.setString(2, producto.getTipo());
            pst.setString(3, producto.getImg());
            pst.setDouble(4, producto.getPrecio());
            pst.setInt(5, producto.getStock());
            pst.setString(6, producto.getDescripcion());
            pst.setInt(7,producto.getId());
            
            result = pst.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if(getConexion()!=null){
                    getConexion().close();
                }
                if(pst!=null) pst.close();
                

            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }

        }
        return result;
        
    }

    public void eliminarProducto(int id){
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String delete = "delete from productos where id=?";
            System.out.println("delete es;" + delete);
            pst = getConexion().prepareStatement(delete);
            pst.setInt(1,id);
            
            pst.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en: " + e);
        } finally {
            try {
                if(getConexion()!=null){
                    getConexion().close();
                }
                if(pst!=null) pst.close();
                

            } catch (Exception e) {
                System.out.println("Error en: " + e);
            }

        }
    }
    
    
}
