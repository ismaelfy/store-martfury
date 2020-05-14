<?php
require 'setting.php';

if (isset($_GET['name'])) {
    $name = explode('/', $_GET['name']);
    switch ($name[0]) {
      case 'shop':
        include 'shop.php';
        break;
      case 'contact':
        include 'contact.php';
        break;      
      default:
        echo "error the page";
        break;
    }
} else {
    include 'home.php';
}
