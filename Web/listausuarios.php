<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="cssadmin.css">
    <title>Usuarios</title>
  </head>
  <body>
   <?php     
          include "navegacion.php"
      ?>

<p>Listado de Usuarios</p>
        <?php
       
           $conn = mysqli_connect("localhost","root","root","pagina");
           
           if($conn){

            $consulta="SELECT *FROM usuarios";
            $resultado=mysqli_query($conn,$consulta);

            ?>


            <table>
                <thead>
			<tr>
				<th>Nombres</th>
				<th>Apellidos</th>
                <th>Sexo</th>
                <th>Telefono</th>
                <th>Correo</th>
                <th>Contrasena</th>
                <th>Estado</th>
			</tr>
           </thead>
            <?php

            if($resultado){
                while($row=$resultado->fetch_array()){

                    $nombres= $row['nombres'];
                    $apellidos = $row['apellidos'];
                    $sexo=$row['sexo'];
                    $tel = $row['telefonocel'];
                    $correo1=$row['correo'];
                    $pass=$row['contrasena'];
                    $estado=$row['estadoid'];

                    ?>

                        <tr>

                        <td><?php echo $nombres;?></td>
                        <td><?php echo $apellidos;?></td>
                        <td><?php echo $sexo;?></td>
                        <td><?php echo $tel;?></td>
                        <td><?php echo $correo1;?></td>
                        <td><?php echo $pass;?></td>
                        <td><?php echo $estado;?></td>
                        </tr>
                        
                    <?php
                    

                }
            }

           
        }
        ?> </table>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  </body>
</html>