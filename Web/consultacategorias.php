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
    <link href="styles.css" rel="stylesheet">
    <title>Xglova: Alquila con nosotros</title>
  </head>
  <body>
     
        <div class="encabezado">
            <div class="float-start sep">
                <a href="index.php">
                   <img src="img/xglovalogo.png" >
                </a>
            </div>
            <div class="float-end sep">
                <button class="btn btn-outline-primary" type="submit" onclick="location.href='inicioadmin.php'">Iniciar sesión</button>
                <button class="btn btn-primary" type="submit" onclick="location.href='registro.html'">Regístrate</button>
            </div>
        </div>    
    
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  </body>
</html>


<?php


$conn = mysqli_connect("localhost","root","","pagina");

if($conn){

    $consulta="SELECT  c.idcategoria, c.categoria
               FROM categorias c
               WHERE c.idcategoria > 0 ";
    $resultado=mysqli_query($conn,$consulta);

?>

<header class="container">
<nav class="navbar">
  <div class="container-fluid">
  <div class="navbar-header">
    <button  type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
      <span class="icon-bar"></span>
    </button>
        <div class="collapse navbar-collapse" id="menu">
                <ul class="navbar-nav">

                    <?php
                    
                         if($resultado){
                        while($row=$resultado->fetch_array()){

                            $idcategoria = $row['idcategoria'];
                            $categoria = $row['categoria'];
                            
                                                
                            ?>
                                <li class="dropdown">
                                       <?php echo "<a href='consultacategoriasproductos.php?idcategoria=$idcategoria'>$categoria</a>";
                                            ?> <b class="caret"></b> <?php
                                        ?>
                                            <ul class="dropdown-menu"> 

                                            <?php
                                              $consulta2="SELECT idsubcategoria,
                                              subcategoria FROM 
                                              subcategorias where idcategoria=$idcategoria";
                                              $resultado2=mysqli_query($conn,$consulta2);

                                              if($resultado2){
                                                  while($row2=$resultado2->fetch_array()){
                                                      $idsubcat=$row2['idsubcategoria'];
                                                      $subcategoria=$row2['subcategoria'];

                                                      ?>

                                                            
                                                                <li>
                                                                    
                                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                                <?php echo $subcategoria;?></a>

                                                                <ul class="dropdown-menu">
                                                                    <?php
                                                                    
                                                                    $consulta3="SELECT tiposubcategoria FROM tiposubcategoria 
                                                                                WHERE idsubcategoria=$idsubcat";

                                                                    $resultado3=mysqli_query($conn,$consulta3);

                                                                    if($resultado3){
                                                                        while($row3=$resultado3->fetch_array()){

                                                                            $tiposubcat=$row3['tiposubcategoria'];

                                                                            ?>

                                                                            <li>
                                                                    
                                                                                 <a class="dropdown-item" href="#">
                                                                                 <?php echo $tiposubcat;?></a>
                                                                            </li>

                                                                            <?php
                                                                        }
                                                                    }
                                                                    ?>
                                                                </ul>
                                                                 
                                                                 </li>
                                                     
                                                      <?php
                                                

                                                  }



                                              }
                                              

                                           ?> 


                                            </ul>
                                                                           
                                </li>   
                            <?php               
                        }                   

                    ?>    
                </ul>      
        </div> 
                    </div>   
    </div>
    </nav> 
                    </header>


    <?php

                                }
    
}else{

    echo "ERROR";
}

 

?>


       
