<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="cssadmin.css">
    <title>Hello, world!</title>
  </head>
  <body>
    
    <div class="header1">
    <p>Bienvenido al Sistema de Administracion</p>
    </div>
    <div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Usuarios
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="registrarusuarios.php">Registrar Usuarios</a></li>
            <li><a class="dropdown-item" href="listausuarios.php">Lista Usuarios</a></li>
              
          </ul>
        </li>

        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Productos
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Registrar Productos</a></li>
            <li><a class="dropdown-item" href="listaproductos.php">Lista Productos</a></li>
          </ul>
        </li>
</ul>
</div>
        
    </div>
  </div>
</nav>

 <p>Lista Productos</p>


 <?php
       
           $conn = mysqli_connect("localhost","root","root","pagina");
           
           if($conn){

            $consulta="SELECT *FROM producto";
            $resultado=mysqli_query($conn,$consulta);

            ?>


            <table>
                <thead>
			<tr>
				<th>Nombre Producto</th>
				<th>Descripcion</th>
                <th>Costo</th>
                <th>Restricciones</th>
                <th>Marca</th>
                <th>Estado</th>
			</tr>
           </thead>
            <?php

            if($resultado){
                while($row=$resultado->fetch_array()){

                    $nombreP= $row['nombreproducto'];
                    $descP = $row['descripcion'];
                    $costoP=$row['costo'];
                    $restrP = $row['restricciones'];
                    $marcaP=$row['marca'];
                    $estadoP=$row['estadoid'];

                    ?>

                        <tr>

                        <td><?php echo $nombreP;?></td>
                        <td><?php echo $descP;?></td>
                        <td><?php echo $costoP;?></td>
                        <td><?php echo $restrP;?></td>
                        <td><?php echo $marcaP;?></td>
                        <td><?php echo $estadoP;?></td>
                        </tr>
                        
                    <?php
                    

                }
            }

           
        }
        ?> </table>
    </div>
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    -->
  </body>
</html>


