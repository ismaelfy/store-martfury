<?php

//require 'config/functions.php';
if (isset($_GET) || $_SERVER['REQUEST_METHOD'] == 'POST') {
    require 'app/Brands.php';
    require 'app/Categories.php';
    require 'app/Products.php';
    require 'app/User.php';
    require 'app/Orders.php';

    $name   = $_GET['name'];
    $action = isset($_GET['action']) ? $_GET['action'] : '';
    $value  = isset($_GET['value']) ? $_GET['value'] : '';

    //print_r($_GET);
    if ($name == 'brands') {
        $Brand = new Brands();
        $res   = $Brand->getAll();
        sendData($res);
    }

    if ($name == 'categories') {
        $Category = new Categories();
        $res      = $Category->getAll();
        sendData($res);
    }

    // products new
    if ($name == 'products') {
        $Product = new Products();
        switch ($action) {
            case 'new':{
                    $res = $Product->getNew();
                    sendData($res);
                }
            case 'brand':{
                    $res = $Product->getBrand();
                    sendData($res);
                }
            case 'get':{
                    $id  = isset($_GET['value']) ? preg_replace('([^0-9])', '', $_GET['value']) : '';
                    $res = $Product->getProduct($id);
                    sendData($res);
                }
            case 'filter':{
                    $datos    = json_decode(trim(file_get_contents('php://input'), true));
                    $category = "";
                    $brand    = "";
                    if ($datos->Category) {
                        foreach ($datos->Category as $index => $value) {
                            $a = ($index == 0) ? "'" : ",'";
                            $category .= $a . $value->id . "'";
                        }
                    }
                    if ($datos->Brand) {
                        foreach ($datos->Brand as $index => $value) {
                            $a = ($index == 0) ? "'" : ",'";
                            $brand .= $a . $value->id . "'";
                        }
                    }
                    $_SESSION['category'] = $category;
                    $_SESSION['brand']    = $brand;
                    //$res = $Product->find_all($category, $brand, '');
                    sendData(null, true);
                }
            default:{
                    $res        = "";
                    $categories = (isset($_SESSION['category'])) ? $_SESSION['category'] : '';
                    $brands     = (isset($_SESSION['brand'])) ? $_SESSION['brand'] : '';
                    $Category   = new Categories();
                    $category   = $Category->find($_SESSION['category']);

                    if (($categories != '') || ($brands != '') || $category) {
                        $res = $Product->find_all($_SESSION['category'], $_SESSION['brand'], '');
                    } else {
                        $res = $Product->getAll();
                    }
                    sendData($res);
                }
        }
        /*if ($action === 'new') {

    }
    if ($action === 'brand') {

    }
    if ($action === 'get') {

    }*/

    }
    // cart
    if ($name === 'cart') {
        if ($action === 'count') {
            $res = (isset($_SESSION['cart'])) ? count($_SESSION['cart']) : 0;
            sendData($res);
        }
        if ($action === 'add') {
            $datos = json_decode(trim(file_get_contents('php://input')));
            if (isset($datos->id) && $datos->id) {
                add_cart($datos);
            } else {
                sendData(null, false, 'No se pudo agrear al carrito.');
            }
        }
        if ($action === 'get') {
            $data     = null;
            $amount   = 0;
            $shipping = (SHIPPING) ? SHIPPING : 0;

            if (isset($_SESSION['cart'])) {
                foreach ($_SESSION['cart'] as $value) {
                    $amount += $value['amount'];
                    $data[] = $value;
                }
            }
            $summary = [
                'amount'   => $amount,
                'shipping' => $shipping,
                'total'    => ($amount + $shipping),
            ];
            sendData(['data' => $data, 'summary' => $summary], true);
        }
        if ($action === 'remove') {
            $datos = json_decode(trim(file_get_contents('php://input')));
            unset($_SESSION['cart'][md5($datos->id)]);
            sendData(null, true, 'Se quito el producto del carrito');
        }
    }
    // account detail
    if ($name === 'account') {
        $User = new User();
        if ($action === 'state') {
            if (isset($_SESSION['account'])) {
                sendData(get_Account());
            } else {
                sendData();
            }
        }
        if ($action === 'login') {
            $datos = json_decode(trim(file_get_contents('php://input')));
            if (($datos->email == '') || (!filter_var($datos->email, FILTER_VALIDATE_EMAIL))) {
                sendData(null, false, "El correo no es válido");
            }
            if ($datos->pwd == '') {
                sendData(null, false, "ingresa la contraseña");
            }

            $result = $User->Login($datos->email, $datos->pwd);
            if (!$result->status && $result->data == 1) {
                sendData(null, false, "El correo no se encuentra registrado");
            }
            if (!$result->status && $result->data == 0) {
                sendData(null, false, "las credenciales son incorrectas");
            }
            $_SESSION['account'] = $result->data;
            sendData(null, true, "success");
        }
        if ($action === 'send') {
            $datos = json_decode(trim(file_get_contents('php://input')));
            print_r($datos);
        }
    }
    // checkout detail
    if ($name === 'checkout') {
        $cart     = get_List_cart();
        $account  = get_Account();
        $checkout = ["data" => $cart, "account" => $account];
        sendData($checkout);
    }
    // payment order
    if ($name === 'payment') {
        $User    = new User();
        $Order   = new Orders();
        $Product = new Products();
        if ($action === 'save') {
            $data      = json_decode(trim(file_get_contents('php://input')));
            $user_data = $User->get_account($data->email);
            $userId    = 0;
            $user      = [
                "firstname" => $data->firstname,
                "lastname"  => $data->lastname,
                "email"     => $data->email,
                "adress"    => $data->adress,
                "city"      => $data->city,
                "phone"     => $data->phone,
                "type"      => $data->type,
                "password"  => ($data->password) ? md5($data->password) : '',
            ];
            if ($user_data) {
                if ($data->type == 1 && $user_data->type == 0) {
                    $user['type'] = $data->type;
                }
                $User->update($user_data->id, $user);
                $userId = $user_data->id;
            } else {
                $userId = $User->create($user);
            }

            $code         = $Order->get_code();
            $cart         = get_List_cart();
            $order_detail = [];
            $subtotal     = 0;
            foreach ($cart['cart'] as $value) {
                $prod           = $Product->getProduct($value['id']);
                $order_detail[] = [
                    "sale_id"     => 0,
                    "product_id"  => $value['id'],
                    "title"       => $prod->title,
                    "description" => $prod->description,
                    "price"       => $prod->price,
                    "quantity"    => $value['quantity'],
                    "amount"      => ($prod->price * $value['quantity']),
                ];
                $subtotal += ($prod->price * $value['quantity']);
            }

            $igv   = $subtotal * (IGV / 100);
            $total = $subtotal + $igv;
            $order = [
                "code"        => $code,
                "date"        => date('Y-m-d H:i:s'),
                "user_id"     => $userId,
                "user_adress" => $data->adress,
                "user_phone"  => $data->phone,
                "shipping"    => SHIPPING,
                "amount"      => number_format($subtotal, 2),
                "igv"         => number_format($igv, 2),
                "total"       => number_format($total, 2),
            ];

            $orderId = $Order->save($order);
            foreach ($order_detail as $value) {
                $value['sale_id'] = $orderId;
                $Order->save_detail($value);
            }

            $content = $Order->mail_template($user, $order, $order_detail);
            if (sendMail($user['email'], $user['firstname'], $content)) {
                empty_cart();
                $_SESSION['thanks'] = true;
                sendData(null, true, 'Se genero tu pedido, te hemos enviado un correo con la informacíon detallada.');
            }
            sendData(null, false, 'ocurrio error al enviar correo');
        }
    }
}
// list account
function get_Account()
{
    //unset($_SESSION['account']);
    if (isset($_SESSION['account'])) {
        $account          = (array) $_SESSION['account'];
        $account['state'] = true;
    } else {
        $account['state'] = false;
    }

    //$_SESSION['account'] = $account;
    //unset($_SESSION['account']);
    return $account;
}
// get product db
function get_datos($item)
{
    $Product = new Products();
    $res     = $Product->getProduct($item->id);

    $datos = [
        "key"      => md5($res->id),
        "id"       => $res->id,
        "title"    => $res->title,
        "img"      => $res->elements[0]->image,
        "color"    => $res->elements[0]->color,
        "price"    => $res->price,
        "quantity" => 1,
        "amount"   => $res->price * 1,
    ];
    return $datos;
}

// function add, remove, update cart
function empty_cart()
{
    if (isset($_SESSION['cart'])) {
        unset($_SESSION['cart']);
    }
}
function get_List_cart()
{
    $data     = null;
    $amount   = 0;
    $shipping = (SHIPPING) ? SHIPPING : 0;

    if (isset($_SESSION['cart'])) {
        foreach ($_SESSION['cart'] as $value) {
            $amount += $value['amount'];
            $data[] = $value;
        }
    }
    $summary = [
        'amount'   => $amount,
        'shipping' => $shipping,
        'total'    => ($amount + $shipping),
    ];
    $datos = [
        'cart'    => $data,
        'summary' => $summary,
    ];
    return $datos;

}
function add_cart($item)
{
    $unique_key = md5($item->id);
    if (!isset($_SESSION['cart'])) {
        $_SESSION['cart'][$unique_key] = get_datos($item);
    } else {
        if (isset($_SESSION['cart'][$unique_key]) && ($_SESSION['cart'][$unique_key]['key'] === $unique_key)) {
            if ((isset($item->quantity) && $item->quantity > 0)) {
                $_SESSION['cart'][$unique_key]['quantity'] = $item->quantity;
            } else {
                $_SESSION['cart'][$unique_key]['quantity'] = $_SESSION['cart'][$unique_key]['quantity'] + 1;
            }
            $_SESSION['cart'][$unique_key]['amount'] = $_SESSION['cart'][$unique_key]['quantity'] * $_SESSION['cart'][$unique_key]['price'];
        } else {
            $_SESSION['cart'][$unique_key] = get_datos($item);
        }
    }
    sendData(null, true, 'Se agrego al carrito.');
}

echo json_encode(ST_API_ERROR);
