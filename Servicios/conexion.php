<?php
function retornarConexion() {
  $con=mysqli_connect("localhost","root","Qasde123","ng_games_db");
  return $con;
}
?>