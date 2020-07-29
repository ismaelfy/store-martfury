<?php
/**
 * USer
 */
class User
{
    private $id;
    private $cn;
    private $datos;
    private $table = 'users';
    public function __construct($description = false)
    {
        $this->datos = [];
        require_once 'Conexion.php';
        $conect = new Conexion();
        $this->cn = $conect->Conectar();
    }
    public function create_to($firstname = '', $lastname = '', $email = '', $password = '', $adress = '', $city = '', $phone = '')
    {
        $res = $this->account_existe($email);
        if (!$res) {
            $query = "INSERT INTO $this->table(firstname, lastname, email, adress, city, phone, status)";
            $query .= " VALUES ('$firstname', '$lastname', '$email', '$adress', '$city', '$phone', 0)";
            $result = $this->cn->query($query);
            if ($result) {
                return true;
            }
            return false;
        }
        return false;
    }
    public function create($data = null)
    {
        if ($data == null) {
            return false;
        }
        $keys    = [];
        $columns = [];
        foreach ($data as $key => $value) {
            $keys[]    = $key;
            $columns[] = "'{$value}'";
        }
        $columns = implode(', ', $columns);
        $keys    = implode(', ', $keys);
        $query   = "INSERT INTO $this->table({$keys}) VALUES ({$columns})";
        $result  = $this->cn->query($query);
        if ($result) {
            return $this->cn->insert_id;
        }
        return false;
    }
    public function update($id = '', $data = null)
    {
        if ($id == '' || $data == null) {
            return false;
        }
        $columns = [];
        foreach ($data as $key => $value) {
            $columns[] = "{$key} = '{$value}'";
        }
        $columns = implode(', ', $columns);
        $query   = "UPDATE $this->table SET $columns where id=$id";

        $result = $this->cn->query($query);
        if ($result) {
            return true;
        }
        return false;
    }

    public function get_account($email)
    {
        $query  = "SELECT id, firstname, lastname, email, adress, city, phone,type FROM $this->table WHERE email='$email'";
        $result = $this->cn->query($query);
        if ($result->num_rows > 0) {
            while ($row = mysqli_fetch_object($result)) {
                $this->datos = $row;
            }
            return $this->datos;
        }
        return false;
    }

    public function Login($email, $pwd)
    {
        $pass      = md5($pwd);
        $query     = "SELECT firstname,lastname,email FROM $this->table WHERE email='$email'";
        $resultado = $this->cn->query($query);
        if ($resultado->num_rows > 0) {
            $query  = "SELECT id,firstname,lastname,email,adress,city,phone FROM $this->table WHERE email='$email' && password ='$pass' && type=1";
            $result = $this->cn->query($query);
            if ($result->num_rows > 0) {
                while ($row = mysqli_fetch_object($result)) {
                    $this->data = $row;
                }
                return (object) ['status' => true, 'data' => $this->data];
            }
            return (object) ['status' => false, 'data' => 0]; // credenciales incorrectas

        }
        return (object) ['status' => false, 'data' => 1]; // la cuenta no existe

    }
}
