 <?php
class Conexion extends mysqli
{
    public function Conectar()
    {
        $con = new mysqli(HOSTNAME, USERNAME, PASSWORD, DATABASE) or die('error en la conexion');
        mysqli_set_charset($con, "utf8");
        return $con;
    }
}
?>