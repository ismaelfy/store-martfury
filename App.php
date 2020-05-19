<?php
session_start();

if (isset($_GET['action'])) {
    require 'functions.php';
    require 'app/Brands.php';
    require 'app/Categories.php';
    require 'app/Products.php';

    $action = $_GET['action'];
    if ($action == 'brand') {
        $Brand = new Brands();
        $res   = $Brand->getAll();
        if ($res) {
            return sendData([
                "success" => true,
                "result"  => $res,
            ]);
        }
        return sendData([
            "success" => false,
            "result"  => null,
        ]);
    }

    if ($action == 'category') {
        $Category = new Categories();
        $res      = $Category->getAll();
        if ($res) {
            return sendData([
                "success" => true,
                "result"  => $res,
            ]);
        }
        return sendData([
            "success" => false,
            "result"  => null,
        ]);
    }
    if ($action == 'newproducts') {
        $Product = new Products();
        $res     = $Product->getNew();
        if ($res) {
            return sendData([
                "success" => true,
                "result"  => $res,
            ]);
        }
        return sendData([
            "success" => false,
            "result"  => null,
        ]);
    }
    if ($action == 'products') {
        $Product = new Products();
        $res     = $Product->getAll();
        if ($res) {
            return sendData([
                "success" => true,
                "result"  => $res,
            ]);
        }
        return sendData([
            "success" => false,
            "result"  => null,
        ]);
    }
}

sendData(ST_API_ERROR);
