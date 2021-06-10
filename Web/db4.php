<?php
$servername = "localhost";
$database = "pagina";
$username = "root";
$password = "";
$table="usuarios";

$table3="reservas";
$table4="pais";
$table5="categorias";
$table6="subcategorias";
$table7="tiposubcategoria";
$table8="productofotos";
$table9="usuariolikeproducto";
$table10="productofotos";
$table11="horariosdelivery";
$table12="departamentos";
$table13="municipios";
$table14="zonas";
$table15="tarjetacredito";

// Create connection

$action = $_POST["action"];
//965
//select * from producto, municipios where producto.municipio = municipios.idmunicipio and  estadoid=1 ORDER BY ((municipios.latitud-14.6099)*(municipios.latitud-14.6099)) + ((municipios.longitud - (-90.5252))*(municipios.longitud - (-90.5252))) ASC

//SELECT * FROM departamentos ORDER BY ((departamentos.latitud-14.6099)*(departamentos.latitud-14.6099)) + ((departamentos.longitud - (-90.5252))*(departamentos.longitud - (-90.5252))) ASC



$conn = mysqli_connect($servername, $username, $password, $database);
// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
else{   

    // If connection is OK...
    // Get all employee records from the database
    if("GET_ALL" == $action){
        $db_data = array();
        $sql = "SELECT * from $table";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "hola";
        }
        mysqli_close($conn);
        return;
    }
	
	//Login correo
    if("LOG_IN_MAIL" == $action){        
    
        $correo = $_POST["correo"];
       
        
        $db_data = array();
        $sql = "SELECT * from $table where correo LIKE '$correo'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			echo "encontrado";
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Correo incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
	
	//Busqueda de usuario por id
    if("LOG_IN_ID" == $action){        
        $usuariosid = $_POST["usuariosid"];           
        $db_data = array();
        $sql = "SELECT * from $table where usuariosid = '$usuariosid'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Usuario incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }

    //Login
    if("LOG_IN_PASS" == $action){        
    
        $correo = $_POST["correo"];
        $contrasena = $_POST["contrasena"];
        $db_data = array();
        $sql = "SELECT * from $table where correo LIKE '$correo' and contrasena LIKE '$contrasena'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "0";
        }
        mysqli_close($conn);
        return;
    } 
	
	
	
	 //GET_ALL_PRODUCTS
    if("_GET_PRODUCTS" == $action){  

		$latitud =$_POST["latitud"];
		$longitud =$_POST["longitud"];	
        
        $db_data = array();
		

		
		$sql ="select *  from producto, municipios, productocategorias where producto.municipio = municipios.idmunicipio and producto.idproducto=productocategorias.idproducto and estadoid=1 
				ORDER BY ((municipios.latitud-'$latitud')*(municipios.latitud-'$latitud')) + ((municipios.longitud - ('$longitud'))*(municipios.longitud - ('$longitud'))) ASC";
		
       // $sql = "select * from producto where estadoid=1";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			//echo "Productos encontradao";
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Productos no encontrados";
        }
        mysqli_close($conn);
        return;
    }
	
	
	//Check product BY CATEGORIA
    if("CHECK_PRODUCT_CATEGORIA" == $action){            
        $idcategoria = $_POST["idcategoria"];
		$latitud =$_POST["latitud"];
		$longitud =$_POST["longitud"];	
        
		$db_data = array();
		
        $sql = "SELECT * from producto, municipios, productocategorias  where producto.municipio = municipios.idmunicipio AND producto.idproducto= productocategorias.idproducto AND productocategorias.idcategoria = '$idcategoria' AND producto.estadoid = 1
		ORDER BY ((municipios.latitud-'$latitud')*(municipios.latitud-'$latitud')) + ((municipios.longitud - ('$longitud'))*(municipios.longitud - ('$longitud'))) ASC";
		
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Producto incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
	
	
	// Add an User
    if("GRABAR_USUARIO_NUEVO" == $action){
        // App will be posting these values to this server
        $usuariosid = null;
        $nombres = $_POST["nombres"];
        $apellidos = $_POST["apellidos"];
		$sexo = $_POST["sexo"];
		$fechanacimiento = $_POST["fechanacimiento"];
		$telefonocel = $_POST["telefonocel"];
		$correo = $_POST["correo"];
		$fotodocumento = $_POST["fotodocumento"];
		$fotoperfil = $_POST["fotoperfil"];
		$idfaceid = $_POST["idfaceid"];
		$estadoid = $_POST["estadoid"];
		$rol = $_POST["rol"];
		$contrasena = $_POST["contrasena"];
		$rating=$_POST["rating"];
		$registrousuario=$_POST["registrousuario"];
		$direccion=$_POST["direccion"];
		$iddepartamento=$_POST["iddepartamento"];
		$idmunicipio =$_POST["idmunicipio"];
		$idzona =$_POST["idzona"];
		
		
	               
        $sql = "INSERT INTO $table (usuariosid,nombres, apellidos,sexo,fechanacimiento,telefonocel,correo,fotodocumento,fotoperfil,idfaceid,estadoid,rol,contrasena, rating, registrousuario, direccion, iddepartamento, idmunicipio, idzona) 
				VALUES (null,'$nombres', '$apellidos', '$sexo', '$fechanacimiento', '$telefonocel', '$correo', '$fotodocumento', '$fotoperfil', '$idfaceid', '$estadoid', '$rol', '$contrasena', '$rating', '$registrousuario', '$direccion', '$iddepartamento', '$idmunicipio', '$idzona')";
        $result = mysqli_query($conn, $sql);
        
        if ($result == TRUE) {
            echo mysqli_insert_id($conn);
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
        mysqli_close($conn);
        return;
    }
	
		// Grabar chat
    if("GRABAR_CHAT" == $action){
        // App will be posting these values to this server
		$envia_userid=$_POST["envia_userid"];
		$recibe_userid=$_POST["recibe_userid"];
		$mensaje=$_POST["mensaje"];
		$fecha=$_POST["fecha"];
		$estado =$_POST["estado"];
    
		$sql="INSERT INTO chat (chatid, envia_userid, recibe_userid, mensaje, fecha, estado) VALUES (null, '$envia_userid', '$recibe_userid', '$mensaje', '$fecha', '$estado')";
	
        $result = mysqli_query($conn, $sql);
        
        if ($result == TRUE) {
            echo mysqli_insert_id($conn);
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
        mysqli_close($conn);
        return;
    }
	
	//GET_ALL_CHAT
    if("GET_CHAT" == $action){  
		$envia_userid=$_POST['envia_userid'];
		$recibe_userid=$_POST['recibe_userid'];
        $db_data = array();
		
		$sql="SELECT * FROM `chat` where envia_userid ='$envia_userid' and recibe_userid='$recibe_userid'";
	
     
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			//echo "Productos encontradao";
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Chat no encontrados";
        }
        mysqli_close($conn);
        return;
    }
 
 
 //UPDATE_USUARIO_INSCRIPCION
	if("UPDATE_USUARIO_INSCRIPCION" == $action){        
    
        $usuariosid = $_POST["usuariosid"];
		$estadoid=$_POST["estadoid"];
			
        $db_data = array();
        $sql = "UPDATE $table SET  estadoid='$estadoid' WHERE usuariosid = '$usuariosid'";
        $result = $conn->query($sql);
        if($conn->query($sql) === TRUE){
            echo "True";
        }else{
            echo "False";
        }
        mysqli_close($conn);
        return;
    }
	
	//UPDATE_USUARIO_XGLOVA
	if("UPDATE_USUARIO_XGLOVA" == $action){        
    
        $usuariosid = $_POST["usuariosid"];
		$rolId=$_POST["rolId"];
			
        $db_data = array();
        $sql = "UPDATE $table SET  rol='$rolId' WHERE usuariosid = '$usuariosid'";
        $result = $conn->query($sql);
        if($conn->query($sql) === TRUE){
            echo "True";
        }else{
            echo "False";
        }
        mysqli_close($conn);
        return;
    }
    
  // Update an Product
    if("UPDATE_PRODUCT" == $action){
        // App will be posting these values to this server
        $idproducto = $_POST['idproducto'];
        $nombreproducto = $_POST["nombreproducto"];
        $descripcion = $_POST["descripcion"];
		$costo = $_POST["costo"];
		$restricciones = $_POST["restricciones"];
		$marca = $_POST["marca"];
		$talla = $_POST["talla"];
		
		$modelo = $_POST["modelo"];
		$transmision = $_POST["transmision"];
		$combustible = $_POST["combustible"];
		$motor = $_POST["motor"];
		
        $sql = "UPDATE producto SET nombreproducto = '$nombreproducto', descripcion = '$descripcion',costo = '$costo',restricciones = '$restricciones',marca = '$marca',talla = '$talla',modelo = '$modelo',transmision = '$transmision',combustible = '$combustible',motor = '$motor' WHERE idproducto = $idproducto";
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        mysqli_close($conn);
        return;
    }
	
	// UPDATE_FOTOPRINCIPAL_PRODUCT
    if("UPDATE_FOTOPRINCIPAL_PRODUCT" == $action){
        // App will be posting these values to this server
        $idproducto = $_POST['idproducto'];
		$fotoprincipal=$_POST['fotoprincipal'];
        
        $sql = "UPDATE producto SET fotoprincipal = '$fotoprincipal' WHERE idproducto = $idproducto";
        if($conn->query($sql) === TRUE){
            echo "True";
        }else{
            echo "False";
        }
        mysqli_close($conn);
        return;
    }
    
   
    // GRABAR_PRODUCTO_NUEVO
    if("GRABAR_PRODUCTO_NUEVO" == $action){
       
        // App will be posting these values to this server
        $idproducto = null;
		$usuarioid =$_POST["usuarioid"];
		$nombreproducto = $_POST["nombreproducto"];
		$descripcion = $_POST["descripcion"];
		$costo = $_POST["costo"];
		$restricciones = $_POST["restricciones"];
		$marca = $_POST["marca"];
		$talla = $_POST["talla"];
		$modelo = $_POST["modelo"];
		$transmision = $_POST["transmision"];
		$combustible = $_POST["combustible"];
		$motor = $_POST["motor"];
		$registro=$_POST["registro"];
		$rating=$_POST["rating"];
		$prestamos=$_POST["prestamos"];
		$fotoprincipal=$_POST["fotoprincipal"];
		$asientos=$_POST["asientos"];
		$estadoid =$_POST["estadoid"];
		$horaentrega=$_POST["horaentrega"];
		$horadevolucion=$_POST["horadevolucion"];
		$costosemana=$_POST["costosemana"];
		$costomes=$_POST["costomes"];
		$departamentogeografico=$_POST["departamentogeografico"];
		$municipio=$_POST["municipio"];
		$zona=$_POST["zona"];
		$direccion=$_POST["direccion"];
		$peso=$_POST["peso"];
		$tamano=$_POST["tamano"];
		
		
		
		$sql = "INSERT INTO producto (idproducto,usuarioid,nombreproducto,descripcion,costo,restricciones,marca,talla,modelo,transmision,combustible,motor, 
		registro,rating,prestamos,asientos,fotoprincipal,estadoid,horaentrega,horadevolucion,costosemana,costomes,departamentogeografico,municipio,zona,direccion, pesoproducto, tamanoproducto) 
		VALUES (NULL, '$usuarioid','$nombreproducto', '$descripcion', '$costo','$restricciones', '$marca', '$talla', '$modelo', '$transmision', '$combustible', '$motor', 
		'$registro', '$rating', '$prestamos', '$asientos', '$fotoprincipal', '$estadoid', '$horaentrega', '$horadevolucion', '$costosemana', '$costomes', '$departamentogeografico', '$municipio', '$zona', '$direccion', '$peso', '$tamano')";
        $result = mysqli_query($conn, $sql);
         
		 if ($result == TRUE) {
            echo mysqli_insert_id($conn);
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
        mysqli_close($conn);
        return;
    }
 
  
 
	//Check product
    if("CHECK_PRODUCT" == $action){        
        $idproducto = $_POST["idproducto"];
        $db_data = array();


        $sql = "SELECT * from producto , productocategorias where productocategorias.idproducto=producto.idproducto and producto.idproducto = '$idproducto' GROUP BY producto.idproducto";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Producto incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
	
	
	
	//Check product de usuario BY CATEGORIA
    if("CHECK_PRODUCT_PORUSUARIO_CATEGORIA" == $action){            
        $idcategoria = $_POST["idcategoria"];
		$usuarioid = $_POST["usuarioid"];
		$latitud =$_POST["latitud"];
		$longitud =$_POST["longitud"];		
        $db_data = array();
		
        $sql = "SELECT * from producto, municipios, productocategorias  where producto.municipio = municipios.idmunicipio AND producto.idproducto= productocategorias.idproducto AND productocategorias.idcategoria = '$idcategoria' AND producto.usuarioid = '$usuarioid' AND producto.estadoid = 1
		ORDER BY ((municipios.latitud-'$latitud')*(municipios.latitud-'$latitud')) + ((municipios.longitud - ('$longitud'))*(municipios.longitud - ('$longitud'))) ASC";
		
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Producto incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
	
	
	//CHECK_PRODUCT_SUB_CATEGORIA
    if("CHECK_PRODUCT_SUB_CATEGORIA" == $action){        
    
        $idsubcategoria = $_POST["idsubcategoria"];
        $latitud =$_POST["latitud"];
		$longitud =$_POST["longitud"];	
        
		$db_data = array();
		
		
        $sql = "SELECT * from producto, municipios, productocategorias  where producto.municipio = municipios.idmunicipio AND producto.idproducto= productocategorias.idproducto AND productocategorias.idsubcategoria = '$idsubcategoria' AND producto.estadoid =1
		ORDER BY ((municipios.latitud-'$latitud')*(municipios.latitud-'$latitud')) + ((municipios.longitud - ('$longitud'))*(municipios.longitud - ('$longitud'))) ASC";
		
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Producto por subcategoria incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
	
	//GET_SUBCATEGORIAS_BY_ID
	if("GET_SUBCATEGORIAS_BY_ID" == $action){        
         $idsubcategoria = $_POST["idsubcategoria"];   
        $db_data = array();
        $sql = "SELECT * from $table6 where idsubcategoria = '$idsubcategoria' and estadoid =1";
        $result = $conn->query($sql);
        if($result->num_rows > 0){			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            $sql = "SELECT * from $table6 where idcategoria = '0'";
			$result = $conn->query($sql);
			if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
			echo "No Encontrada";
		}
				
        }
        mysqli_close($conn);
        return;
    }
	
	
	//GET_SUBCATEGORIAS_BY_CATEGORIA
	
	 if("GET_SUBCATEGORIAS_BY_CATEGORIA" == $action){        
         $idcategoria = $_POST["idcategoria"];
        $db_data = array();
        $sql = "SELECT * from $table6 where idcategoria = '$idcategoria' and estadoid = 1";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            $sql = "SELECT * from $table6 where idcategoria = '0'";
			$result = $conn->query($sql);
			if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
			}	else{
				echo "No Encontradas";
			}		
        }
        mysqli_close($conn);
        return;
    }
    
	//GET_TIPOSUBCATEORIAS_BY_SUBCATERIA
	if("GET_TIPOSUBCATEORIAS_BY_SUBCATERIA" == $action){        
        $idsubcategoria = $_POST["idsubcategoria"];
        $db_data = array();
        $sql = "SELECT * from $table7 where idsubcategoria = '$idsubcategoria' and estadoid =1";
        $result = $conn->query($sql);
        if($result->num_rows > 0){	
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            $sql = "SELECT * from $table7 where idsubcategoria = '0'";
			$result = $conn->query($sql);
			if($result->num_rows > 0){
				while($row = $result->fetch_assoc()){
					$db_data[] = $row;
				}
				// Send back the complete records as a json
				echo json_encode($db_data);
			}else{
				echo "No Encontrado";
			}
        }
        mysqli_close($conn);
        return;
    }
	
	
	
	//GET_LISTA_FOTOS_PRODUCTOS_BYIDPROD
	if("GET_LISTA_FOTOS_PRODUCTOS_BYIDPROD" == $action){        
    
        $idproducto = $_POST["idproducto"];
        $db_data = array();
        $sql = "SELECT * from $table8 where idproducto = '$idproducto' AND estadoid = 1";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
			echo "Productos no encontrados";
        }
        mysqli_close($conn);
        return;
    }
	
	

  
	
	//GET_ALL_CATEGORIAS
    if("GET_ALL_CATEGORIAS" == $action){        
    
        
        $db_data = array();
        $sql = "select * from categorias WHERE idcategoria != 0 and estadoid= 1 ORDER BY ordenvisual";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			//echo "Categorais encontradas";
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Categorias no encontradas";
        }
        mysqli_close($conn);
        return;
    }
 
 
 
 //UPDATE_USUARIO_LIKE_PRODUCTO
	if("UPDATE_USUARIO_LIKE_PRODUCTO" == $action){        
    
        $idusuario = $_POST["idusuario"];
		$idproducto= $_POST["idproducto"];
		$estadolike=$_POST["estadolike"];
			
        $db_data = array();
        $sql = "SELECT * from $table9 where idusuario = '$idusuario' and idproducto='$idproducto'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            $sql = "UPDATE $table9 SET  estadolike='$estadolike' WHERE idusuario = '$idusuario' and idproducto='$idproducto'";
			$result = $conn->query($sql);
            echo "True";
        }else{		
			echo "False";
        }
        mysqli_close($conn);
        return;
    }
	
	//INSERT_USUARIO_LIKE_PRODUCTO
	if("INSERT_USUARIO_LIKE_PRODUCTO" == $action){        
    
        $idusuario = $_POST["idusuario"];
		$idproducto= $_POST["idproducto"];
		$estadolike=$_POST["estadolike"];			
        $db_data = array();
        $sql = "INSERT INTO $table9 (idusuariolikeproducto, idusuario, idproducto, estadolike) VALUES (null,  '$idusuario', '$idproducto', '$estadolike')";
  
        $result = mysqli_query($conn, $sql);
        
        if ($result == TRUE) {
            echo mysqli_insert_id($conn);
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
         
        mysqli_close($conn);
        return;
    }
	
	
		//INSERT_FOTO_PRODUCTO*********************************************
	if("INSERT_FOTO_PRODUCTO" == $action){        
    
		$idproducto= $_POST["idproducto"];
		$foto=$_POST["foto"];	
		$estadoid =$_POST["estadoid"];		
		
        $db_data = array();
        $sql = "INSERT INTO $table10 (idproducto, idfoto, foto, estadoid) VALUES ('$idproducto', null,  '$foto',  '$estadoid')";
  
        $result = mysqli_query($conn, $sql);
        
        if ($result == TRUE) {
            echo mysqli_insert_id($conn);
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
         
        mysqli_close($conn);
        return;
    }
	
	//INSERT_RESERVA
	
	if("INSERT_RESERVA" == $action){        
        $idproducto= $_POST["idproducto"];
		$idusuario = $_POST["idusuario"];
		$idxglover=$_POST["idxglover"];
		$fechainicio=$_POST["fechainicio"];			
		$estadoid=$_POST["estadoid"];
		$fechafin=$_POST["fechafin"];
		$diasalquiler=$_POST["diasalquiler"];
		
        $db_data = array();
        $sql = "INSERT INTO $table3 (idreserva,idproducto, idusuario,idxglover, fechainicio, estadoid,fechafin,diasalquiler) VALUES (null,  '$idproducto', '$idusuario','$idxglover', '$fechainicio','$estadoid','$fechafin', '$diasalquiler')";
  
        $result = mysqli_query($conn, $sql);
        
        if ($result == TRUE) {
            echo mysqli_insert_id($conn);
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
         
        mysqli_close($conn);
        return;
    }
	
	//Check Reserva
    if("CHECK_RESERVA" == $action){            
        $idproducto = $_POST["idproducto"];
        $db_data = array();
        $sql = "SELECT * from $table3 where idproducto = '$idproducto'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Reserva incorrecta o no registrada";
        }
        mysqli_close($conn);
        return;
    }
	
		//Check USER CHAT
    if("CHECK_USER_CHAT" == $action){            
		$idusuario = $_POST["idusuario"];
        $db_data = array();
        $sql = "select DISTINCT usuarios.usuariosid, usuarios.nombres from usuarios, reservas where usuarios.usuariosid=reservas.idusuario or usuarios.usuariosid=reservas.idxglover";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "chat no encontrado";
        }
        mysqli_close($conn);
        return;
    }
	
	//Check Xglover reserva
    if("CHECK_EXGLOVER_RESERVA" == $action){            
        $idusuario = $_POST["idusuario"];
        $db_data = array();
        $sql = "select * from producto, reservas WHERE producto.idproducto=reservas.idproducto and producto.usuarioid='$idusuario'";
		
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Reserva incorrecta o no registrada";
        }
        mysqli_close($conn);
        return;
    }
	
	//INSERT_TARJETA
	
	if("INSERT_TARJETA" == $action){        
        $idtarjetacredito= $_POST["idtarjetacredito"];
		$idusuario = $_POST["idusuario"];
		$numerotarjeta=$_POST["numerotarjeta"];			
		$fechavencimiento=$_POST["fechavencimiento"];
		$cvv=$_POST["cvv"];
		$Nombrepropietario=$_POST["Nombrepropietario"];
		$estadoid=$_POST["estadoid"];
		
        $db_data = array();
        
		$sql = "INSERT INTO $table15(idtarjetacredito,idusuario, numerotarjeta, fechavencimiento, cvv,Nombrepropietario,estadoid) VALUES 
		(null,'$idusuario', '$numerotarjeta','$fechavencimiento','$cvv', '$Nombrepropietario','$estadoid')";
  
        $result = mysqli_query($conn, $sql);
        
        if ($result == TRUE) {
            echo mysqli_insert_id($conn);
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
         
        mysqli_close($conn);
        return;
    }
	
	//Check tarjeta
    if("CHECK_TARJETA" == $action){            
        $idusuario = $_POST["idusuario"];
        $db_data = array();
        $sql = "SELECT * from $table15 where idusuario = '$idusuario'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Tarjeta incorrecta o no registrada";
        }
        mysqli_close($conn);
        return;
    }
	
		
	//GET_USUARIO_LIKE_PRODUCTO
	
	if("GET_USUARIO_LIKE_PRODUCTO" == $action){        
    
        $idusuario = $_POST["idusuario"];
		$idproducto= $_POST["idproducto"];
		
        $db_data = array();
        $sql = "SELECT * from $table9 where idusuario = '$idusuario' and idproducto='$idproducto'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
           while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
			echo "False";
        }
        mysqli_close($conn);
        return;
    }
 
 
 //GET_ALL_USUARIO_LIKE_PRODUCTO
	
	if("GET_ALL_USUARIO_LIKE_PRODUCTO" == $action){        
    
        $db_data = array();
        $sql = "SELECT * from $table9";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
           while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
			echo "Error al buscar los USUARIOLIKEPRODUCTO";
        }
        mysqli_close($conn);
        return;
    }
 
 //GET_ALL_PRODUCTOS_LIKE
	
	if("GET_ALL_PRODUCTOS_LIKE" == $action){        
		$idusuario = $_POST["idusuario"];
		$latitud =$_POST["latitud"];
		$longitud =$_POST["longitud"];	
        $db_data = array();
		
		
		$sql = "SELECT DISTINCT producto.idproducto, producto.usuarioid, producto.nombreproducto,producto.costo, producto.fotoprincipal,producto.rating, productocategorias.idcategoria,productocategorias.idsubcategoria, productocategorias.idtipo,producto.estadoid, usuariolikeproducto.estadolike
					FROM producto LEFT JOIN usuariolikeproducto 
						ON producto.idproducto = usuariolikeproducto.idproducto AND usuariolikeproducto.idusuario='$idusuario', municipios, productocategorias
						WHERE producto.municipio = municipios.idmunicipio AND producto.idproducto=productocategorias.idproducto AND producto.estadoid = 1
						ORDER BY ((municipios.latitud-'$latitud')*(municipios.latitud-'$latitud')) + ((municipios.longitud - ('$longitud'))*(municipios.longitud - ('$longitud'))) ASC";
		

       
        $result = $conn->query($sql);
        if($result->num_rows > 0){
           while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
			echo "Error al buscar los USUARIOLIKEPRODUCTO";
        }
        mysqli_close($conn);
        return;
    }
 
 	//Check Horarios
    if("CHECK_HORARIOS" == $action){            
        
        $db_data = array();
        $sql = "SELECT * from $table11 where estadoid = 1";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "horario incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
	
	//Check CHECK_DEPARTAMENTOS
    if("CHECK_DEPARTAMENTOS" == $action){            
        
        $db_data = array();
        $sql = "SELECT * from $table12";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Departamento incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
 
 
 
 //Check CHECK_MUNICIPIOS
    if("CHECK_MUNICIPIOS" == $action){   
		$idDepartamento = $_POST["idDepartamento"];	
        
        $db_data = array();
        $sql = "SELECT * from $table13 WHERE iddepartamento='$idDepartamento'";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Municipio incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
	
	
	
	//Check CHECK_ZONAS
    if("CHECK_ZONAS" == $action){            
        
        $db_data = array();
        $sql = "SELECT * from $table14";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Zona incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
 
 
 
 
 
 //CHECK_PRODUCT_LIKE_CATEGORIA
    if("CHECK_PRODUCT_LIKE_CATEGORIA" == $action){            
        $idcategoria = $_POST["idcategoria"];
		$idusuario = $_POST["idusuario"];
		$latitud =$_POST["latitud"];
		$longitud =$_POST["longitud"];	
        $db_data = array();
		
						

		$sql = "SELECT DISTINCT producto.idproducto, producto.usuarioid, producto.nombreproducto,producto.costo, producto.fotoprincipal,producto.rating, productocategorias.idcategoria,productocategorias.idsubcategoria, productocategorias.idtipo,producto.estadoid, usuariolikeproducto.estadolike
					FROM producto LEFT JOIN usuariolikeproducto 
						ON producto.idproducto = usuariolikeproducto.idproducto AND usuariolikeproducto.idusuario='$idusuario', municipios, productocategorias
						WHERE producto.municipio = municipios.idmunicipio AND producto.idproducto=productocategorias.idproducto AND productocategorias.idcategoria = '$idcategoria' AND producto.estadoid = 1
						ORDER BY ((municipios.latitud-'$latitud')*(municipios.latitud-'$latitud')) + ((municipios.longitud - ('$longitud'))*(municipios.longitud - ('$longitud'))) ASC";
		
	
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Producto incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
	
	
	//CHECK_PRODUCT_LIKE_SUB_CATEGORIA
    if("CHECK_PRODUCT_LIKE_SUB_CATEGORIA" == $action){        
    
        $idsubcategoria = $_POST["idsubcategoria"];
		$idusuario = $_POST["idusuario"];
		$latitud =$_POST["latitud"];
		$longitud =$_POST["longitud"];	
        $db_data = array();
		
		
		
		$sql = "SELECT DISTINCT producto.idproducto, producto.usuarioid, producto.nombreproducto,producto.costo, producto.fotoprincipal,producto.rating, productocategorias.idcategoria,productocategorias.idsubcategoria, productocategorias.idtipo,producto.estadoid, usuariolikeproducto.estadolike
					FROM producto LEFT JOIN usuariolikeproducto 
						ON producto.idproducto = usuariolikeproducto.idproducto AND usuariolikeproducto.idusuario='$idusuario', municipios, productocategorias
						WHERE producto.municipio = municipios.idmunicipio AND producto.idproducto=productocategorias.idproducto AND productocategorias.idsubcategoria = '$idsubcategoria' AND producto.estadoid = 1
						ORDER BY ((municipios.latitud-'$latitud')*(municipios.latitud-'$latitud')) + ((municipios.longitud - ('$longitud'))*(municipios.longitud - ('$longitud'))) ASC";
		
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Producto por subcategoria incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
	
	//CHECK_PRODUCT_LIKE_TIPO_SUB_CATEGORIA
    if("CHECK_PRODUCT_LIKE_TIPO_SUB_CATEGORIA" == $action){        
    
        $idtiposubcategoria = $_POST["idtiposubcategoria"];
		$idusuario = $_POST["idusuario"];
		$latitud =$_POST["latitud"];
		$longitud =$_POST["longitud"];
		
        $db_data = array();
				
		
		$sql = "SELECT DISTINCT producto.idproducto, producto.usuarioid, producto.nombreproducto,producto.costo, producto.fotoprincipal,producto.rating, productocategorias.idcategoria,productocategorias.idsubcategoria, productocategorias.idtipo,producto.estadoid, usuariolikeproducto.estadolike
					FROM producto LEFT JOIN usuariolikeproducto 
						ON producto.idproducto = usuariolikeproducto.idproducto AND usuariolikeproducto.idusuario='$idusuario', municipios, productocategorias
						WHERE producto.municipio = municipios.idmunicipio AND producto.idproducto=productocategorias.idproducto AND productocategorias.idtipo = '$idtiposubcategoria' AND producto.estadoid = 1
						ORDER BY ((municipios.latitud-'$latitud')*(municipios.latitud-'$latitud')) + ((municipios.longitud - ('$longitud'))*(municipios.longitud - ('$longitud'))) ASC";
		

        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Producto por subcategoria incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
 
 
  //CHECK_PRODUCTOS_BUSQUEDA
    if("CHECK_PRODUCTOS_BUSQUEDA" == $action){            
        $prod = $_POST["prod"];
		$departamento = $_POST["departamento"];
		$precio=$_POST["precio"];
		$isfree=$_POST["isfree"];
		
        $db_data = array();
			

				
if(!empty($prod) && empty($departamento) && empty($precio)){
		$sql = "SELECT DISTINCT producto.idproducto, producto.usuarioid, producto.nombreproducto, producto.costo, producto.fotoprincipal, producto.rating, productocategorias.idcategoria, productocategorias.idsubcategoria, productocategorias.idtipo, producto.estadoid, usuariolikeproducto.estadolike
					FROM producto LEFT JOIN usuariolikeproducto 
						ON producto.idproducto = usuariolikeproducto.idproducto, productocategorias, categorias, subcategorias, tiposubcategoria
                        WHERE  producto.estadoid =1 and producto.idproducto=productocategorias.idproducto 
						and productocategorias.idcategoria=categorias.idcategoria 
						and productocategorias.idsubcategoria=subcategorias.idsubcategoria 
						and productocategorias.idtipo=tiposubcategoria.idtiposubcategoria 
						and (producto.nombreproducto LIKE '%$prod%' OR categorias.categoria LIKE '%$prod%' OR subcategorias.subcategoria LIKE '%$prod%' OR tiposubcategoria.tiposubcategoria LIKE '%$prod%')";
}







if(!empty($prod) && empty($departamento) && !empty($precio)){
		$sql = "SELECT DISTINCT producto.idproducto, producto.usuarioid, producto.nombreproducto, producto.costo, producto.fotoprincipal, producto.rating, productocategorias.idcategoria, productocategorias.idsubcategoria, productocategorias.idtipo, producto.estadoid, usuariolikeproducto.estadolike
					FROM producto LEFT JOIN usuariolikeproducto 
						ON producto.idproducto = usuariolikeproducto.idproducto, productocategorias, categorias, subcategorias, tiposubcategoria
                        WHERE  producto.estadoid =1 and producto.idproducto=productocategorias.idproducto 
						and productocategorias.idcategoria=categorias.idcategoria 
						and productocategorias.idsubcategoria=subcategorias.idsubcategoria 
						and productocategorias.idtipo=tiposubcategoria.idtiposubcategoria 
						and producto.costo <= '$precio'
						and (producto.nombreproducto LIKE '%$prod%' OR categorias.categoria LIKE '%$prod%' OR subcategorias.subcategoria LIKE '%$prod%' OR tiposubcategoria.tiposubcategoria LIKE '%$prod%')";
}
	
        $result = $conn->query($sql);
        if($result->num_rows > 0){
			
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Producto incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
 
 
 //CHECK_PRODUCT_LIKE_BYID
    if("CHECK_PRODUCT_LIKE_BYID" == $action){        
    
        $idproducto = $_POST["idproducto"];
		$idusuario = $_POST["idusuario"];
        $db_data = array();
		
		
				
						
						
        $sql = "SELECT DISTINCT producto.idproducto, producto.usuarioid, producto.nombreproducto,producto.costo, producto.fotoprincipal,producto.rating, productocategorias.idcategoria,productocategorias.idsubcategoria, productocategorias.idtipo,producto.estadoid, usuariolikeproducto.estadolike
					FROM producto LEFT JOIN usuariolikeproducto 
						ON producto.idproducto = usuariolikeproducto.idproducto AND usuariolikeproducto.idusuario='$idusuario',  productocategorias
						WHERE producto.idproducto=productocategorias.idproducto AND producto.idproducto = '$idproducto'
						GROUP BY producto.idproducto
						";
	
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Producto por id incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
 
 
 
 //CHECK_PRODUCTGUARDADO_PORUSUARIO_CATEGORIA
    if("CHECK_PRODUCTGUARDADO" == $action){        
   
        $idcategoria   = $_POST["idcategoria"];
		$usuarioid   = $_POST["usuarioid"];
		$latitud =$_POST["latitud"];
		$longitud =$_POST["longitud"];
		$db_data = array();
		


        $sql = "SELECT producto.idproducto, producto.usuarioid, producto.nombreproducto,producto.costo, producto.fotoprincipal,producto.rating, productocategorias.idcategoria,productocategorias.idsubcategoria, productocategorias.idtipo,producto.estadoid, usuariolikeproducto.estadolike
					FROM producto, usuariolikeproducto, municipios, productocategorias
					where producto.municipio = municipios.idmunicipio AND producto.idproducto=productocategorias.idproducto AND producto.idproducto = usuariolikeproducto.idproducto
						AND usuariolikeproducto.idusuario='$usuarioid' AND productocategorias.idcategoria='$idcategoria' AND usuariolikeproducto.estadolike =1
						ORDER BY ((municipios.latitud-'$latitud')*(municipios.latitud-'$latitud')) + ((municipios.longitud - ('$longitud'))*(municipios.longitud - ('$longitud'))) ASC";
						
	
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Producto incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
 
 
 
  //CHECK_PRODUCT_LIKE_MISALQUILES_BYCLIENTE
    if("CHECK_PRODUCT_LIKE_MISALQUILES_BYCLIENTE" == $action){        

		$idusuario = $_POST["idusuario"];
        $db_data = array();
		

		
        $sql = "SELECT DISTINCT producto.idproducto, producto.usuarioid, producto.nombreproducto,producto.costo, producto.fotoprincipal,producto.rating, productocategorias.idcategoria,productocategorias.idsubcategoria, productocategorias.idtipo,producto.estadoid, usuariolikeproducto.estadolike
					FROM producto LEFT JOIN usuariolikeproducto 
						ON producto.idproducto = usuariolikeproducto.idproducto,  reservas, productocategorias
                        WHERE producto.idproducto=productocategorias.idproducto AND reservas.idproducto = producto.idproducto AND reservas.idusuario='$idusuario' AND producto.usuarioid != '$idusuario'
                        GROUP BY reservas.idproducto";
	
	
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Producto incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
 
 
 //CHECK_PRODUCT_LIKE_MISALQUILES_BYXGLOVA
    if("CHECK_PRODUCT_LIKE_MISALQUILES_BYXGLOVA" == $action){        
    
       
		$idusuario = $_POST["idusuario"];
        $db_data = array();
        $sql = "SELECT DISTINCT producto.idproducto, producto.usuarioid, producto.nombreproducto,producto.costo, producto.fotoprincipal,producto.rating, productocategorias.idcategoria,productocategorias.idsubcategoria, productocategorias.idtipo,producto.estadoid, usuariolikeproducto.estadolike
					FROM producto LEFT JOIN usuariolikeproducto 
						ON producto.idproducto = usuariolikeproducto.idproducto,  reservas, productocategorias
                        WHERE producto.idproducto=productocategorias.idproducto AND reservas.idproducto = producto.idproducto AND producto.usuarioid='$idusuario' AND reservas.idusuario !='$idusuario'
                        GROUP BY reservas.idproducto";
	
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            // Send back the complete records as a json
            echo json_encode($db_data);
        }else{
            echo "Producto incorrecto o no registrado";
        }
        mysqli_close($conn);
        return;
    }
 
 
 
 
 //INSERT_PRODUCTO_CATEGORIAS
	
	if("INSERT_PRODUCTO_CATEGORIAS" == $action){        
        $idproducto= $_POST["idproducto"];
		$idcat = $_POST["idcat"];
		$idsubcat=$_POST["idsubcat"];			
		$idtipo=$_POST["idtipo"];
		$idestado=$_POST["idestado"];
		
	
		
        $db_data = array();

				
		$sql = "INSERT INTO productocategorias (idproductocategorias,idproducto, idcategoria, idsubcategoria, idtipo,idestado) VALUES 
		(NULL,'$idproducto', '$idcat','$idsubcat','$idtipo', '$idestado')";
  
        $result = mysqli_query($conn, $sql);
        
        if ($result == TRUE) {
            echo mysqli_insert_id($conn);
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
         
        mysqli_close($conn);
        return;
    }
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  // Delete an Employee
    if('DELETE_EMP' == $action){
        $emp_id = $_POST['id'];
        $sql = "DELETE FROM $table WHERE id = $emp_id"; // don't need quotes since id is an integer.
        if($conn->query($sql) === TRUE){
            echo "success";
        }else{
            echo "error";
        }
        mysqli_close($conn);
        return;
    }
mysqli_close($conn);
}
?>

