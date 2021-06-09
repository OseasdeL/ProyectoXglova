<?php

$conn = mysqli_connect("localhost","root","root","pagina");

if($conn){

    $consulta="SELECT  c.idcategoria, c.categoria
               FROM categorias c
               WHERE c.idcategoria > 0 ";
    $resultado=mysqli_query($conn,$consulta);

?>

<nav class="navbar navbar-expand-lg navbar-light bg-light justify-content-center">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                    <?php
                    
                         if($resultado){
                        while($row=$resultado->fetch_array()){

                            $idcategoria = $row['idcategoria'];
                            $categoria = $row['categoria'];
                            
                                                
                            ?>
                                <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="prueba.html" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <?php echo $categoria; ?> </a>
                                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown"> 

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

                                                            
                                                                <li class="nav-item dropdown">
                                                                    
                                                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                                <?php echo $subcategoria;?></a>

                                                                <ul>
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
    </nav> 



    <?php

                                }
    
}else{

    echo "ERROR";
}

 

?>


       
