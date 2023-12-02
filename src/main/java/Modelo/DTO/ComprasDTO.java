/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo.DTO;

import com.google.gson.annotations.SerializedName;

/**
 *
 * @author Elkur
 */
public class ComprasDTO {

    @SerializedName("CompraDTO")
    CompraDTO data;

    public ComprasDTO(CompraDTO data) {
        this.data = data;
    }

    public ComprasDTO() {
    }

    public CompraDTO getData() {
        return data;
    }

    public void setData(CompraDTO data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "ComprasDTO{" + "data=" + data + '}';
    }

}
