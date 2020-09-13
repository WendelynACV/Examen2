<%--
  Created by IntelliJ IDEA.
  User: Wen
  Date: 12/9/2020
  Time: 6:20 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Toyotito</title>
    <!-- This will include the whole javascript file including ajax handling  -->
    <script lang="javascript" src="./js"></script>

    <!-- Write the javascript code for accessing REST APIs -->
    <script lang="javascript">

      function listarVehiculos() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            var vehiculos = JSON.parse(this.responseText);
            document.getElementById("error").innerHTML = "<h2><span style='color:red'>" + this.responseText.resultado + " !!</span></h2>";
          }
        };
        xhttp.open("GET", "/Examen2_war_exploded/Toyotito/Planta_ServiceRest/Listar_Vehiculos", true);
        xhttp.setRequestHeader("Content-type", "application/json");
        xhttp.send();
      }

      function reservarVehiculo()
      {
        //Collect input from html page
        var modelo = document.getElementById("modelo").value;
        var marca = document.getElementById("marca").value;

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            document.getElementById("error").innerHTML = "<h2><span style='color:red'>" + this.responseText + " !!</span></h2>";
          }
        };
        xhttp.open("POST", "/Examen2_war_exploded/Toyotito/Planta_ServiceRest/Reservar_vehículo/"+marca+"/"+modelo, true);
        xhttp.setRequestHeader("Content-type", "application/json");
        xhttp.send();
      }
    </script>
  </head>
  <body>
    <h1>Toyotito</h1>

    <h2>Agregar Vehiculo</h2>

    <h2>Resevar Vehiculo</h2>

    <div id="error"></div>
    <form method="post">
      <p>Modelo: <input type="text" name="modelo" id="modelo"/></p>
      <p>Marca: <input type="text" name="marca" id="marca"/></p>
      <input type="button" value="Reservar" onclick="reservarVehiculo()" />
    </form>

    <h2>Lusta de Vehiculo</h2>
    <div id="listaVehiculos"></div>
  
  </body>
</html>
