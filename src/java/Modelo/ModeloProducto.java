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
            String sql = "call selectProductos()";
            pst = getConexion().prepareCall(sql);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                productos.add(new Producto(rs.getInt("id_producto"), rs.getString("nombre"), rs.getString("tipo"),
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
            String sql = "call selectProductosDesc()";
            pst = getConexion().prepareCall(sql);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                productos.add(new Producto(rs.getInt("id_producto"), rs.getString("nombre"), rs.getString("tipo"),
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
            String sql = "call selectProducto(?)";
            pst = getConexion().prepareCall(sql);
            pst.setInt(1, id);
            rs = pst.executeQuery();
            
            while (rs.next()) {
                producto = new Producto(rs.getInt("id_producto"), rs.getString("nombre"), rs.getString("tipo"),
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
            String insert = "insert into producto(nombre,tipo,img_producto,precio,stock,descripcion) values (?,?,?,?,?,?);";
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
    
    
    public Producto actualizarProducto(Producto producto){
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String update = "update producto set nombre=?, tipo=? ,img_producto=? ,precio=? ,stock=? ,descripcion=? where id_producto=?";
            System.out.println("update es;" + update);
            pst = getConexion().prepareStatement(update);
            pst.setString(1, producto.getNombre());
            pst.setString(2, producto.getTipo());
            pst.setString(3, producto.getImg());
            pst.setDouble(4, producto.getPrecio());
            pst.setInt(5, producto.getStock());
            pst.setString(6, producto.getDescripcion());
            pst.setInt(7,producto.getId());
            
           
            pst.executeUpdate();
            if(rs.next()){
                producto.setNombre(rs.getString("nombre"));
                producto.setTipo(rs.getString("tipo"));
                producto.setImg(rs.getString("img_producto"));
                producto.setPrecio(rs.getDouble("precio"));
                producto.setStock(rs.getInt("stock"));
                producto.setDescripcion(rs.getString("descripcion"));
            }
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
        return producto;
        
    }

    public void eliminarProducto(int id){
        PreparedStatement pst = null;
        ResultSet rs = null;
        
        try {
            String delete = "delete from producto where id_producto=?";
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
