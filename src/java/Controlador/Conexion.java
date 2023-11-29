/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Equipo 2
 */
public class Conexion {

    private String USERNAME = "root";
    private String PASSWORD = "BaseDeDatos*";
    private String HOST = "localhost";
    private String PORT = "3306";
    private String DATABASE = "global_tires";
    private String CLASSNAME = "com.mysql.cj.jdbc.Driver";
    private String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;
    private Connection con;

    public Conexion() {
        try {
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

        } catch (ClassNotFoundException e) {
            System.out.println("Error en:" + e);
        } catch (SQLException e) {
            System.out.println("Error en: " + e);
        }
    }

    public Connection getConexion() {
        return con;
    }

    public void reconect() {
        try {
            Class.forName(CLASSNAME);
            con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

        } catch (ClassNotFoundException e) {
            System.out.println("Error en:" + e);
        } catch (SQLException e) {
            System.out.println("Error en: " + e);
        }
    }
}
