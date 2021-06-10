<!doctype html>
<html lang="es">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
    <link rel="stylesheet" href="cssadmin.css">
    <title>Registrar</title>
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

<p>Registro de Usuarios</p>
  <div class="container" >

  <form action="validar_registro.php" method="POST"> 
    <div class="mb-4">
      <label for="text" class="form-label">Nombres</label>
      <input type="text" class="form-control" name="nombres">
    </div>

    <div class="mb-4">
      <label for="text" class="form-label">Apellidos</label>
      <input type="text" class="form-control" name="apellidos">
    </div>
    
    <div class="mb-4">
      <label for="email" class="form-label">Correo electronico</label>
      <input type="email" class="form-control" name="correo">
    </div>

    <div class="mb-4">
      <label for="password" class="form-label">Contraseña</label>
      <input type="password" class="form-control" name="password">
    </div>

    <div class="mb-4">
      <label for="text" class="form-label">Sexo</label>
      <select name="sexo" id="">
          <option value="1">Masculino</option>
          <option value="2">Femenino</option>
      </select>
    </div>

    <div class="d-grid">
      <button type="submit" class="btn btn-primary">Registrar</button>
    </div>

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