<?php

$conn = mysqli_connect("localhost","root","root","pagina");

if($conn){

    $consulta="SELECT c.idcategoria, c.categoria FROM categorias c
    where c.idcategoria > 0";
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
                                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                            <?php echo $categoria;?> 
                                        </a> 
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