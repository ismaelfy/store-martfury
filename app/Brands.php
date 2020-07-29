<?php

/*
 * Brands
 */
class Brands
{
    private $cn;
    private $datos;
    public function __construct($description = false)
    {
        $this->datos = [];
        require_once 'Conexion.php';
        $conect   = new Conexion();
        $this->cn = $conect->Conectar();
    }

    // functions
    public function getAll()
    {
        $consulta = "SELECT b.* FROM brands as b RIGHT JOIN products as p on p.id_brand=b.id where b.status=2 group by b.id";
        $result   = $this->cn->query($consulta);

        if (mysqli_num_rows($result)) {
            while ($fila = mysqli_fetch_object($result)) {
                $this->datos[] = $fila;
            }
            return $this->datos;
        }
        return null;

    }

}
