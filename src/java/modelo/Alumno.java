/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author VB
 */
public class Alumno {
    private int codigo;
    private String nombre;
    private double parcial;
    private double finall;
    private double practicas;

    public Alumno(int codigo, String nombre, double parcial, double finall, double practicas) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.parcial = parcial;
        this.finall = finall;
        this.practicas = practicas;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getParcial() {
        return parcial;
    }

    public void setParcial(double parcial) {
        this.parcial = parcial;
    }

    public double getFinall() {
        return finall;
    }

    public void setFinall(double finall) {
        this.finall = finall;
    }

    public double getPracticas() {
        return practicas;
    }

    public void setPracticas(double practicas) {
        this.practicas = practicas;
    }
    
    
           
}
