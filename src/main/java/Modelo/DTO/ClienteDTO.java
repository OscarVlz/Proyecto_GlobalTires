/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.DTO;

import Modelo.dominio.Cliente;
import com.google.gson.annotations.SerializedName;
import java.util.Objects;

/**
 *
 * @author Elkur
 */
public class ClienteDTO {

    @SerializedName("ClienteDTO")
    private Cliente cliente;

    public ClienteDTO(Cliente cliente) {
        this.cliente = cliente;
    }

    public ClienteDTO() {
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + Objects.hashCode(this.cliente);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final ClienteDTO other = (ClienteDTO) obj;
        return Objects.equals(this.cliente, other.cliente);
    }

}
