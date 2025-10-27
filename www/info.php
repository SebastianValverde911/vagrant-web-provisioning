<?php
  echo "<h1>Hola desde PHP 2</h1>";
  //phpinfo();
  $host = "192.168.56.11"; // o la IP de tu máquina DB si está en otra
  $dbname = "empresa";
  $user = "vagrant";
  $password = "vagrant";

  try {
      $conn = new PDO("pgsql:host=$host;dbname=$dbname", $user, $password);
      $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

      $query = $conn->query("SELECT * FROM empleados");

      echo "<h1>Lista de Empleados</h1>";
      echo "<ul>";
      while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
          echo "<li>{$row['nombre']} - {$row['cargo']} - {$row['salario']}</li>";
      }
      echo "</ul>";
  } catch (PDOException $e) {
      echo "Error de conexión: " . $e->getMessage();
  }
?>
