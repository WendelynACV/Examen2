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
            document.getElementById("listaVehiculos").innerHTML = "<h2><span style='color:blue'>" + this.responseText + " !!</span></h2>";
          }
        };
        xhttp.open("GET", "/Examen2_war_exploded/Toyotito/Planta_ServiceRest/Listar_Vehiculos", true);
        xhttp.setRequestHeader("Content-type", "application/json");
        xhttp.send();
      }

      function agregarVehiculo() {

        var placa = document.getElementById("placa").value;
        var imagen = document.getElementById("imagen").value;
        var modelo = document.getElementById("add-modelo").value;
        var marca = document.getElementById("add-marca").value;
        var kilometrajeActual = document.getElementById("kilometraje").value;
        var cantidadDisponibleDelAuto = document.getElementById("cantidad").value;

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            document.getElementById("error-add-car").innerHTML = "<h2><span style='color:red'>Agregado exitosamente !!</span></h2>";
          }
        };
        xhttp.open("POST", "/Examen2_war_exploded/Toyotito/Planta_ServiceRest/Agregar_vehículo", true);
        xhttp.setRequestHeader("Content-type", "application/json");
        xhttp.send(JSON.stringify({placa: placa, imagen: imagen, modelo: modelo, marca: marca, kilometrajeActual: kilometrajeActual, cantidadDisponibleDelAuto: cantidadDisponibleDelAuto}));

      }

      function reservarVehiculo() {
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

      listarVehiculos();
    </script>
  </head>
  <body>
    <h1>Toyotito</h1>

    <h2>Agregar Vehiculo</h2>

    <div id="error-add-car"></div>
    <form method="post">
      <p>Placa: <input type="text" name="placa" id="placa"/></p>
      <p>Imagen: <input align="center" type="file" name="image" id="imagen"/></p>
      <p>Modelo: <input min="2016" max="2021" type="number" name="modelo" id="add-modelo"/></p>
      <p>Marca: <select id="add-marca" name="marca">
        <option value="volvo">Volvo</option>
        <option value="saab">Saab</option>
        <option value="fiat">Fiat</option>
        <option value="audi">Audi</option>
        <option value="BMW">BMW</option>
        <option value="mercedez">Mercedez</option>
        <option value="toyota">Toyota</option>
      </select></p>
      <p>Kilometraje actual: <input min="40" max="600000" type="number" name="kilometraje" id="kilometraje"/></p>
      <p>Cantidad disponible: <input min="1" max="200" type="number" name="cantidad" id="cantidad"/></p>
      <input type="button" value="Agregar" onclick="agregarVehiculo()" />
    </form>

    <h2>Resevar Vehiculo</h2>

    <div id="error"></div>
    <form method="post">
      <p>Modelo: <input type="text" name="modelo" id="modelo"/></p>
      <p>Marca: <input type="text" name="marca" id="marca"/></p>
      <input type="button" value="Reservar" onclick="reservarVehiculo()" />
    </form>

    <h2>Lista de Vehiculo</h2>
    <div id="listaVehiculos"></div>

  </body>
</html>
