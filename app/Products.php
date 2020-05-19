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
        $this->cn = Conexion::Conectar();
    }

    // functions
    public function getImageColor($id)
    {
        $data   = [];
        $query  = "SELECT image,color from image_color where product_id=$id ";
        $result = $this->cn->query($query);
        if (mysqli_num_rows($result)) {
            $i=0;
            while ($row = mysqli_fetch_object($result)) {
                $data[] = $row;
                $data[$i]->image = URL_BASE . 'assets/images/products/' .$data[$i]->image;
                /*echo "idex: $i ";
                print_r($data[$i]);*/
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
                    $data[] = URL_BASE . 'assets/images/products/' . $row->image;
                }
                if ($type == 1) {
                    $data[] = $row->color;
                }
            }
            return $data;
        }
        return null;
    }
    
    public function getAll()
    {
        $query  = "SELECT p.id, p.title, p.description, p.short_description, p.price, p.price_old, p.stock,b.description as brand, c.description as category, p.offer FROM products p LEFT JOIN categories c on c.id=p.id_category LEFT JOIN brands b on b.id=p.id_category where p.type = 0";
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
    public function getNew()
    {
        $query  = "SELECT p.id, p.title, p.short_description, p.description, p.price, p.price_old, p.stock,b.description as brand, c.description as category, p.offer FROM products p LEFT JOIN categories c on c.id=p.id_category LEFT JOIN brands b on b.id=p.id_category LEFT JOIN image_color ic on ic.id=p.image_color_id where p.type = 0 and p.new=1 limit 4";
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

}
