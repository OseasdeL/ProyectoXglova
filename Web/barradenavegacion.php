<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	  <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato:300,400">
	  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
	  <script type="text/javascript" src="js/menuresponsive.js"></script>
    <title>Hello, world!</title>
  </head>
  <body>

  <h1>HELLO WORLD</h1>
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
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">			        
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        </div>
                        <div class="collapse navbar-collapse" id="menu">
                                
                            <ul class="navbar-nav">
                                <?php
                                
                                if($resultado){
                                    while($row=$resultado->fetch_array()){
                                        $idcategoria = $row['idcategoria'];
                                        $categoria = $row['categoria'];

                                        ?>

                                            <li class="dropdown">
			                                <?php echo "<a href='consultacategoriasproductos.php?idcategoria=$idcategoria'>$categoria 
                                            </a>" ?>;
                                            
                
                                                
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

                                                                        <li class="dropdown">
					                                                         <a href="https://www.henry-chavez.com" class="dropdown-toggle">
                                                                             <?php echo $subcategoria?> <b class="caret right"></b></a>

                                                                             <ul class="dropdown-menu">
                                                                                
                                                                             <?php

                                                                                    $consulta3="SELECT tiposubcategoria FROM tiposubcategoria 
                                                                                    WHERE idsubcategoria=$idsubcat";

                                                                                    $resultado3=mysqli_query($conn,$consulta3);

                                                                                    if($resultado3){

                                                                                        while($row3=$resultado3->fetch_array()){

                                                                                            $tiposubcat=$row3['tiposubcategoria'];

                                                                                            ?>

                                                                                                    <li><a href="https://www.henry-chavez.com"><?php echo $tiposubcat?></a></li>
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
                                }      
                                
                                
                                ?>
                            </ul>
                        </div>
                    </div>
                    </nav>		
            </header>
            <?php
            
    }else{
    echo "ERROR";   
    }

?>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  </body>
</html>