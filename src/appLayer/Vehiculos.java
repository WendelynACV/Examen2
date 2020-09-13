package appLayer;

import appLayer.Vehiculo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public enum Vehiculos {

    instance;

    private Map<String, Vehiculo> contentProvider = new HashMap<>();

    private Vehiculos(){
        agregarVehiculo(new Vehiculo("wcv-123","", 2017, "BMW", 40, 5));
        agregarVehiculo(new Vehiculo("srg-456","", 2018, "Toyota", 200, 2));
    }

    public void agregarVehiculo(Vehiculo vehiculo){
        contentProvider.put(vehiculo.getPlaca(), vehiculo);
    }

    public void borrarVehiculo(Vehiculo vehiculo){
        contentProvider.remove(vehiculo.getPlaca(), vehiculo);
    }

    public Map<String, Vehiculo> getModel(){
        return contentProvider;
    }

    public String resevarVehiculo(String marca, int modelo){
        Vehiculo vehiculo = buscarVehiculoDisponibles(marca, modelo);
        if (vehiculo != null) {
            vehiculo.setCantidadDisponibleDelAuto(vehiculo.getCantidadDisponibleDelAuto() - 1);
            contentProvider.put(vehiculo.getPlaca(), vehiculo);
            return "El vehiculo se reservo exitosamente";
        } else {
            return "No hay vehiculos disponibles";
        }
    }

    private Vehiculo buscarVehiculoDisponibles(String marca, int modelo) {
        List<Vehiculo> vehiculos = new ArrayList<>();
        vehiculos.addAll(Vehiculos.instance.getModel().values());
        Vehiculo resultado = null;

        for(int i = 0; i < vehiculos.size(); i ++){
            if(vehiculos.get(i).getMarca().equals(marca) && vehiculos.get(i).getModelo() == modelo && vehiculos.get(i).getCantidadDisponibleDelAuto() > 0) {
                resultado = vehiculos.get(i);
                break;
            }
        }
        return resultado;
    }

}
