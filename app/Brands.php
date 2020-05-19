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
        $this->cn = Conexion::Conectar();
    }

    // functions
    public function getAll()
    {
        $consulta = "SELECT * FROM brands";
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
