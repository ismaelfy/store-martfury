<?php
$path = './.setting';
$app           = new stdClass();
$app->base_url = '';
$app->shipping = 0;

$db           = new stdClass();
$db->hostname = 'localhost';
$db->database = '';
$db->username = 'root';
$db->password = '';

if (file_exists($path)) {
    $lines = file($path);
    foreach ($lines as $item) {
        $row = explode('=', $item);
        $key = (isset($row[0])) ? trim($row[0]) : '';
        if ($key) {
            $value = (isset($row[1])) ? trim($row[1]) : '';
            if (strstr($key, 'app.')) {
                $key       = str_replace('app.', '', $key);
                $app->$key = $value;
            }
            if (strstr($key, 'db.')) {
                $key      = str_replace('db.', '', $key);
                $db->$key = $value;
            }
        }
    }
}


define('BASE_URL', $app->base_url);
define('APP_NAME', $app->name);
define('IGV', $app->igv);
define('USER_NAME', $app->username);
define('USER_MAIL', $app->email);
define('USER_PASSWORD', $app->password);

if (is_numeric($app->shipping)) {
    define('SHIPPING', $app->shipping);
} else {
    define('SHIPPING', 0);
}

define('HOSTNAME', $db->hostname);
define('DATABASE', $db->database);
define('USERNAME', $db->username);
define('PASSWORD', $db->password);

define('ST_INACTIVO', 0);
define('ST_DESHABILITADO', -1);
define('ST_ACTIVO', 1);

#codigo de respuesta API
define("ST_API_OK", 'success');
define("ST_API_FAIL", 'error');

define("ST_API_ERROR", ['status' => ['success' => false, 'msg' => 'la petición no es correcta']]);
define("ST_API_EMPTY", ['status' => ['success' => ST_API_FAIL, 'msg' => 'el cuerpo del contenido está vacío']]);
define("ST_API_METHOD_ERROR", ['status' => ['success' => ST_API_FAIL, 'msg' => 'método de envío no válido']]);
