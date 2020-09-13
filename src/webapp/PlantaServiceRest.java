package webapp;

import appLayer.Vehiculo;
import appLayer.Vehiculos;
import javax.ws.rs.*;
import java.util.ArrayList;
import java.util.List;

@Path("/Planta_ServiceRest")
public class PlantaServiceRest {

    @POST
    @Path("/Agregar_vehículo")
    @Produces("application/json")
    @Consumes("application/json")
    public Vehiculo guardarVehiculo(Vehiculo vehiculo) {
        Vehiculos.instance.agregarVehiculo(vehiculo);
        return vehiculo;
    }

    @GET
    @Path("/Listar_Vehiculos")
    @Produces("application/json")
    public List<Vehiculo> obtenerVehiculos() {
        List<Vehiculo> vehiculos = new ArrayList<>();
        vehiculos.addAll(Vehiculos.instance.getModel().values());
        return vehiculos;
    }

    @POST
    @Path("/Reservar_vehículo/{marca}/{modelo}")
    @Produces("application/json")
    @Consumes("application/json")
    public String reservarVehiculo(@PathParam("marca") String marca, @PathParam("modelo") int modelo) {
        String resultado = Vehiculos.instance.resevarVehiculo(marca, modelo);
        return resultado;
    }

}
