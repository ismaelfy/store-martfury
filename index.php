<?php
session_start();
include 'vendor/autoload.php';
include './config/constants.php';
include './config/functions.php';
include './include/functions.php';
$path = __dir__ . './views/';

$files = array_diff(scandir($path), array('.', '..'));
$page = "home.php";
if (isset($_GET['name']) && !empty($_GET['name'])) {
    $params = explode('/', $_GET['name']);
    $page = strtolower(str_replace(['.php', '.html'], '', $params[0])) . ".php";
}

if (in_array($page, $files)) {
    $index = array_search($page, $files);
    include $path . $files[$index];
} else {
    if ($page === 'api.php') {
        unset($params[0]);
        if (isset($params[1]) && !empty($params[1]))
            $_GET['name'] = $params[1];

        if (isset($params[2]) && !empty($params[2]))
            $_GET['action'] = $params[2];

        if (isset($params[3]) && !empty($params[3]))
            $_GET['value'] = $params[3];

        include  "./utils/api.php";
    } else {
        include "404.php";
    }
}
