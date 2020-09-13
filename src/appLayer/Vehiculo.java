package appLayer;

public class Vehiculo {

    private String placa;
    private String imagen;
    private int modelo;
    private String marca;
    private int kilometrajeActual;
    private int cantidadDisponibleDelAuto;

    public Vehiculo(String placa, String imagen, int modelo,String marca, int kilometrajeActual, int cantidadDisponibleDelAuto){
        this.placa = placa;
        this.imagen = imagen;
        this.modelo = modelo;
        this.marca = marca;
        this.kilometrajeActual = kilometrajeActual;
        this.cantidadDisponibleDelAuto = cantidadDisponibleDelAuto;
    }

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    public int getModelo() {
        return modelo;
    }

    public void setModelo(int modelo) {
        this.modelo = modelo;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public int getKilometrajeActual() {
        return kilometrajeActual;
    }

    public void setKilometrajeActual(int kilometrajeActual) {
        this.kilometrajeActual = kilometrajeActual;
    }

    public int getCantidadDisponibleDelAuto() {
        return cantidadDisponibleDelAuto;
    }

    public void setCantidadDisponibleDelAuto(int cantidadDisponibleDelAuto) {
        this.cantidadDisponibleDelAuto = cantidadDisponibleDelAuto;
    }
}
