<?php
/*
 * Categories
 */

class Categories
{
    private $id;
    private $description;
    private $cn;
    private $datos;
    public function __construct($description = false)
    {
        $this->description = $description;
        $this->datos       = [];
        require_once 'Conexion.php';
        $conect   = new Conexion();
        $this->cn = $conect->Conectar();
    }

    // functions
    public function getAll()
    {
        $query = "SELECT c.* FROM categories as c JOIN products as p on p.id_category=c.id where c.status=2 group by c.id";

        $result = $this->cn->query($query);

        if (mysqli_num_rows($result)) {
            $categories = (isset($_SESSION['category'])) ? preg_replace('/[^0-9]/', '', $_SESSION['category']) : '';
            if ($categories) {
                $category = explode(',', $categories);
            }
            $count = $this->find((isset($_SESSION['category'])) ? $_SESSION['category'] : '');

            while ($row = mysqli_fetch_object($result)) {
                if ($categories && $count) {
                    if (in_array($row->id, $category)) {
                        $row->checked = 1;
                    } else {
                        $row->checked = 0;
                    }
                }
                $this->datos[] = $row;
            }
            return $this->datos;
        }
        return null;
    }
    public function find($categories = '')
    {

        if ($categories) {
            $query = "SELECT c.* FROM categories as c JOIN products as p on p.id_category=c.id ";
            $query .= " WHERE c.status=2 AND c.id IN($categories) group by c.id ";

            $result = $this->cn->query($query);
            if (mysqli_num_rows($result) > 0) {
                return true;
            }
            return false;
        }
        return false;
    }

}
