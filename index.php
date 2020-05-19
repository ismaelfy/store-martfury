<?php
require 'constants.php';
if (isset($_GET['name'])) {
    $name = explode('/', $_GET['name']);
    switch (strtolower($name[0])) {
        case 'shop':
            include 'shop.php';
            break;
        case 'cart':
            include 'cart.php';
            break;
        case 'checkout':
            include 'checkout.php';
            break;
        case 'contact':
            include 'contact.php';
            break;
        case 'api':
            $_GET['action'] = isset($name[1]) ? $name[1] : '';
            include 'App.php';
            break;
        default:
            echo "error the page";
            break;
    }
} else {
    include 'home.php';
}
