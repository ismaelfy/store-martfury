<?php
/**
 * USer
 */
class Orders
{
    private $id;
    private $cn;
    private $datos;
    private $table        = 'orders';
    private $table_detail = 'order_detail';
    public function __construct($description = false)
    {
        $this->datos = [];
        require_once 'Conexion.php';
        $conect = new Conexion();
        $this->cn = $conect->Conectar();
    }
    public function get_code()
    {
        $query  = "SELECT COUNT(*) as num FROM $this->table";
        $result = $this->cn->query($query);
        if ($result->num_rows > 0) {
            $row = mysqli_fetch_object($result);
            return "P-000" . ($row->num + 1);

        }
        return "P-000" . 1;
    }
    public function save($data = null)
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
    public function save_detail($data = null)
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
        $query   = "INSERT INTO $this->table_detail({$keys}) VALUES ({$columns})";
        $result  = $this->cn->query($query);
        if ($result) {
            return true;
        }
        return false;
    }

    public function get_account($email)
    {
        $query  = "SELECT id, firstname, lastname, email, adress, city, phone FROM $this->table WHERE email='$email'";
        $result = $this->cn->query($query);
        if ($result->num_rows > 0) {
            while ($row = mysqli_fetch_object($result)) {
                $this->datos = $row;
            }
            return $this->datos;
        }
        return false;
    }

    public function mail_template($user = '', $cart = '', $detail = '')
    {
        $_html = '<table style="border-collapse:collapse;background:whitesmoke;min-width:600px;width:100%;padding:1rem;font-family:roboto">
        <tbody>
            <tr style=";background:#fcb800;line-height:3rem;padding: 1rem;">
                <td style="width:100%;display: flex;align-items: center;flex;justify-content: space-between">
                    <img src="' . BASE_URL . 'assets/images/logo.png" style="max-width:500px;" alt="logo"/>
                    <span> Número de pedido: ' . $cart["code"] . ' </span>
                </td>

            </tr>
            <tr>
                <td colspan="3" style="padding:1.5rem">
                    <h2 style="font-weight: 900;font-size: 2.2rem;margin:0;">Gracias por tu pedido, ' . $user["firstname"] . '.</h2>
                </td>
            </tr>
            <tr>
                <td colspan="3" style="padding:.5rem 1.5rem">
                    Aquí está tu confirmación para el número de pedido ' . $cart["code"] . '. Revisa tu Recibo y comienza a utilizar tus productos.
                </td>
            </tr>
            <tr>
                <td>
                <table style="border-collapse:collapse;background:whitesmoke;width:95%;margin:0 auto;">
                <tbody>
                    <tr style="border-bottom: 1px solid #dcdcdc">
                        <td style="padding:.5rem 0;"> <b> PRODUCTO </b> </td>
                        <td style="padding:.5rem 0;" align="center"> <b> PRECIO </b> </td>
                        <td style="padding:.5rem 0;" align="center"> <b> CANTIDAD </b> </td>
                        <td style="padding:.5rem 0;" align="center"> <b> IMPORTE </b> </td>
                    </tr>';
        foreach ($detail as $value) {
            $_html .= '<tr style="border-bottom: .5px solid #e2e2e23b">
                        <td style="padding: .8rem 0;"> ' . $value["title"] . ' </td>
                        <td style="padding: .8rem 0;" align="center"> ' . $value["price"] . ' </td>
                        <td style="padding: .8rem 0;" align="center"> ' . $value["quantity"] . ' </td>
                        <td style="padding: .8rem 0;" align="center"> ' . $value["amount"] . ' </td>
                    </tr>';
        }
        $_html .= '
                    <tr>
                        <td colspan="3" align="right" style="padding: .2rem 0;"> Subtotal: </td>
                        <td style="padding: .2rem 0;" align="center"> ' . $cart['amount'] . ' </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="right" style="padding: .2rem 0;"> Impuesto: </td>
                        <td style="padding: .2rem 0;" align="center"> ' . $cart['igv'] . ' </td>
                    </tr>
                    <tr>
                        <td colspan="3" align="right" style="padding: .2rem 0;"> Total: </td>
                        <td style="padding: .4rem 0;" align="center"> ' . $cart['total'] . ' </td>
                    </tr>
                    </tbody>
                    </table>
                    </td>
                </tr>

                <tr>
                    <td style="padding:.5rem 1.5rem;color:#fcb800;font-weight:700;font-size:1rem;">
                        Costo de Envío :<span style="color:black"> ' . $cart["shipping"] . '</span>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 1.5rem 2rem;font-size: .9rem;">
                        Gracias por su compra!!
                    </td>
                </tr>
            </tbody>
        </table>
        ';
        return $_html;
    }

}
