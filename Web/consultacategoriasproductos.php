<!doctype html>
<html lang="es">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	  <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato:300,400">
	  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	  <script type="text/javascript" src="js/menuresponsive.js"></script>
    <title>CATEGORIAS</title>
  </head>
  <body>
    <?php 
        include("barradenavegacion.php");        
    ?> 
        
        <div>

        <img src="img/fondo3.jpeg">
        </div>  
    <?php
        
      $idcategoria = $_GET['idcategoria'];

      echo $idcategoria;
      $conn= mysqli_connect("localhost","root","","pagina");

      if($conn){

        $consulta = "SELECT p.fotoprincipal, p.nombreproducto 
                     FROM producto p, productocategorias r, categorias c 
                     WHERE p.idproducto = r.idproducto and r.idcategoria =$idcategoria";
        $resultado=mysqli_query($conn,$consulta);
        while($row=$resultado->fetch_array()){

          $urlfotoproducto=$row['fotoprincipal'];
          $nombreproducto=$row['nombreproducto'];

          ?>
             <p><b>NOMBRE PRODUCTO: </b><?php echo $nombreproducto;?><br></p>          
              
          <?php


        }
      }

    ?>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  </body>
</html>