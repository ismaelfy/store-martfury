<?php

/**
 * Products
 */
class Products
{
    private $cn;
    private $datos;
    public function __construct()
    {
        $this->datos = [];
        require_once 'Conexion.php';
        $conect   = new Conexion();
        $this->cn = $conect->Conectar();
    }

    // functions
    public function getImageColor($id)
    {
        $data   = [];
        $query  = "SELECT image,color from image_color where product_id=$id ";
        $result = $this->cn->query($query);
        if (mysqli_num_rows($result)) {
            $i = 0;
            while ($row = mysqli_fetch_object($result)) {
                $data[]          = $row;
                $data[$i]->image = BASE_URL . 'assets/images/products/' . $data[$i]->image;
                $i++;
            }
            return $data;
        }
        return null;
    }
    public function getColor($id, $type = 0)
    {
        $data   = [];
        $query  = "SELECT image,color from image_color where product_id=$id ";
        $result = $this->cn->query($query);
        if (mysqli_num_rows($result)) {
            while ($row = mysqli_fetch_object($result)) {
                if ($type == 0) {
                    $data[] = BASE_URL . 'assets/images/products/' . $row->image;
                }
                if ($type == 1) {
                    $data[] = $row->color;
                }
            }
            return $data;
        }
        return null;
    }

    public function getAll($limit = 12)
    {
        $query = "SELECT p.id, p.title, p.description, p.short_description,p.image, p.price, p.price_old, p.stock,b.description as brand, c.description as category, p.offer FROM products p LEFT JOIN categories c on c.id=p.id_category LEFT JOIN brands b on b.id=p.id_brand ";

        $search = (isset($_SESSION['search'])) ? $_SESSION['search'] : '';
        if ($search != '') {
            $search = str_replace('-', ' ', $search);
            $query .= " WHERE  p.description like '% " . $search . "%' or p.title like '% " . $search . "%'";
        }
        //var_dump($query);

        $result = $this->cn->query($query);

        if (mysqli_num_rows($result)) {
            $i = 0;
            while ($row = mysqli_fetch_object($result)) {
                $row->elements          = $this->getImageColor($row->id);
                $this->datos[]          = $row;
                $this->datos[$i]->image = BASE_URL . 'assets/images/brand/' . $this->datos[$i]->image;
                $i++;
            }
            return $this->datos;
        }
        return null;
    }
    public function find_all($categ = '', $brand = '', $name = "")
    {
        $query = "SELECT p.id, p.title, p.description, p.short_description,p.image, p.price, p.price_old, p.stock,b.description as brand, c.description as category, p.offer FROM products p LEFT JOIN categories c on c.id=p.id_category LEFT JOIN brands b on b.id=p.id_brand  ";
        
        if ($categ) {
            $query .= " WHERE p.id_category IN($categ) ";
        }
        if ($brand) {
            $concat = ($categ) ? 'or' : 'where';
            $query .= " $concat  p.id_brand IN($brand) ";
        }

        $search = (isset($_SESSION['search'])) ? $_SESSION['search'] : '';

        if ($search != '') {
            $search = str_replace('-', ' ', $search);
            $fil    = " WHERE ";
            if ($categ != '' || $brand != '') {
                $fil = " or ";
            }
            $query .= $fil . " p.title like '%" . $search . "%'";
        }
        //var_dump($query);
        $result = $this->cn->query($query);
        if (mysqli_num_rows($result)) {
            $i = 0;
            while ($row = mysqli_fetch_object($result)) {
                $row->elements          = $this->getImageColor($row->id);
                $this->datos[]          = $row;
                $this->datos[$i]->image = BASE_URL . 'assets/images/brand/' . $this->datos[$i]->image;
                $i++;
            }
            return $this->datos;
        }
        return null;
    }

    public function getProduct($id)
    {
        $query  = "SELECT p.id, p.title, p.description, p.short_description,p.image, p.price, p.price_old, p.stock,b.description as brand, c.description as category, p.offer FROM products p LEFT JOIN categories c on c.id=p.id_category LEFT JOIN brands b on b.id=p.id_brand where p.id=$id";
        $result = $this->cn->query($query);
        if (mysqli_num_rows($result)) {
            $i = 0;
            while ($row = mysqli_fetch_object($result)) {
                $row->elements = $this->getImageColor($row->id);
                $row->image    = BASE_URL . 'assets/images/brand/' . $row->image;
                $this->datos   = $row;
                $i++;
            }
            return $this->datos;
        }
        return null;
    }

    public function getNew()
    {
        $query  = "SELECT p.id, p.title, p.short_description, p.description, p.price, p.price_old, p.stock,b.description as brand, c.description as category, p.offer FROM products p LEFT JOIN categories c on c.id=p.id_category LEFT JOIN brands b on b.id=p.id_brand where p.type = 0 and p.new=1 limit 4";
        $result = $this->cn->query($query);
        if (mysqli_num_rows($result)) {
            while ($row = mysqli_fetch_object($result)) {
                $row->elements = $this->getImageColor($row->id);
                $this->datos[] = $row;
            }
            return $this->datos;
        }
        return null;
    }

    public function getBrand()
    {
        $query  = "SELECT p.id, p.title, p.short_description, p.description, p.image, p.price, p.price_old, p.stock, b.description as brand, c.description as category, p.offer FROM products p LEFT JOIN categories c on c.id=p.id_category LEFT JOIN brands b on b.id=p.id_brand where p.type = 2 limit 3";
        $result = $this->cn->query($query);
        if (mysqli_num_rows($result)) {
            $i = 0;
            while ($row = mysqli_fetch_object($result)) {
                $row->elements          = $this->getImageColor($row->id);
                $this->datos[]          = $row;
                $this->datos[$i]->image = BASE_URL . 'assets/images/brand/' . $this->datos[$i]->image;
                $i++;
            }
            return $this->datos;
        }
        return null;
    }

}
