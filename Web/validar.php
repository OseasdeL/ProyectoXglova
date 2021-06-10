<?php

   $correo=$_POST['correoUser'];
   session_start();
   $_SESSION['correoUser']=$correo;
    
   $conex=mysqli_connect("localhost","root","root","pagina");
    $consulta="SELECT *FROM usuarios where correo='$correo'";
    $resultado=mysqli_query($conex,$consulta);

    $filas=mysqli_num_rows($resultado);

    if($filas){
        header("location:vistaadministrador.php");
    }else{
        ?>
        <?php

        include("inicioadmin.php");
        ?>
             echo "<script>
                 alert('Error en autenticacion');
                 window.location='inicioadmin.php';
             </script>"    
        <?php 

    }

  mysqli_free_result($resultado);
  mysqli_close($conn);
  
?>