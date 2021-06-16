<!DOCTYPE HTML>
<html lang="es">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keywords" content="htmlcss bootstrap, multi level menu, submenu, treeview nav menu examples" />
<meta name="description" content="Bootstrap 5 navbar multilevel treeview examples for any type of project, Bootstrap 5" />  

<title>Xglova - Alquila con nosotros</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"crossorigin="anonymous"></script>

<style type="text/css">

/* ============ desktop view ============ */

.header {
  background: url(img/fondo.jpeg) no-repeat center;
  background-size: cover;
  min-height: 80vh;
}

.header .navbar {
  background-color: transparent !important;
}

@media all and (min-width: 992px) {

    .navbar .nav-item .nav-link{color: white;}
    .navbar .nav-item:hover .nav-link{ color: yellow;}
	.dropdown-menu li{
		position: relative;
	}
	.dropdown-menu .submenu{ 
		display: none;
		position: absolute;
		left:100%; top:-7px;
	}
	.dropdown-menu .submenu-left{ 
		right:100%; left:auto;
	}

	.dropdown-menu > li:hover{ background-color: transparent !important; }
	.dropdown-menu > li:hover > .submenu{
		display: block;
	}

    .navbar .nav-item:hover .dropdown-item{ transition: .3s; opacity:1; visibility:visible; top:100%; transform: rotateX(0deg); }
}	
/* ============ desktop view .end// ============ */

/* ============ small devices ============ */
@media (max-width: 991px) {

.dropdown-menu .dropdown-menu{
		margin-left:0.7rem; margin-right:0.7rem; margin-bottom: .5rem;
}


}	
/* ============ small devices .end// ============ */

</style>


<script type="text/javascript">
//	window.addEventListener("resize", function() {
//		"use strict"; window.location.reload(); 
//	});


	document.addEventListener("DOMContentLoaded", function(){
        

    	/////// Prevent closing from click inside dropdown
		document.querySelectorAll('.dropdown-menu').forEach(function(element){
			element.addEventListener('click', function (e) {
			  e.stopPropagation();
			});
		})



		// make it as accordion for smaller screens
		if (window.innerWidth < 992) {

			// close all inner dropdowns when parent is closed
			document.querySelectorAll('.navbar .dropdown').forEach(function(everydropdown){
				everydropdown.addEventListener('hidden.bs.dropdown', function () {
					// after dropdown is hidden, then find all submenus
					  this.querySelectorAll('.submenu').forEach(function(everysubmenu){
					  	// hide every submenu as well
					  	everysubmenu.style.display = 'none';
					  });
				})
			});
			
			document.querySelectorAll('.dropdown-menu a').forEach(function(element){
				element.addEventListener('click', function (e) {
		
				  	let nextEl = this.nextElementSibling;
				  	if(nextEl && nextEl.classList.contains('submenu')) {	
				  		// prevent opening link if link needs to open dropdown
				  		e.preventDefault();
				  		console.log(nextEl);
				  		if(nextEl.style.display == 'block'){
				  			nextEl.style.display = 'none';
				  		} else {
				  			nextEl.style.display = 'block';
				  		}

				  	}
				});
			})
		}
		// end if innerWidth

	}); 
	// DOMContentLoaded  end
</script>

</head>
<body>

<?php
    $conn = mysqli_connect("localhost","root","","pagina");

    if($conn){
            $consulta="SELECT  c.idcategoria, c.categoria
            FROM categorias c
            WHERE c.idcategoria > 0 ";
            $resultado=mysqli_query($conn,$consulta);


?>

<!-- ============= ENCABEZADO ============== -->
<div>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container-fluid">
    <a class="navbar-brand" href="#">Xglova</a>
    
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    </div>
  </div>
</nav>
    </div>

<!-- ============= BARRA DE NAVEGACION ============== -->
<header class="header">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
 <div class="container-fluid">
 	 
  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main_nav"  aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  <div class="collapse navbar-collapse" id="main_nav">
	

	<ul class="navbar-nav m-auto">
		<?php
                                
                                if($resultado){
                                    while($row=$resultado->fetch_array()){
                                        $idcategoria = $row['idcategoria'];
                                        $categoria = $row['categoria'];

										?>

											<li class="nav-item dropdown">
												<a class="nav-link dropdown" href="#" data-bs-toggle="dropdown"><?php echo $categoria?></a>
											</li>

											<ul class="dropdown-menu">						

									}
								}	

	
		
            
	</ul>

   

  </div> <!-- navbar-collapse.// -->
 </div> <!-- container-fluid.// -->
</nav>
</header>

<?php
	}else{


		echo "error";
	}
	
            
?>

<!-- ============= COMPONENT END// ============== -->




</body>
</html>