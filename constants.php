<?php

define('ST_INACTIVO', 0);
define('ST_DESHABILITADO', 1);
define('ST_ACTIVO', 2);

#codigo de respuesta API
define("ST_API_OK", 'success');
define("ST_API_FAIL", 'error');

define("ST_API_ERROR",['status'=>['success' => ST_API_FAIL, 'msg' => 'la petición no es correcta']]);
define("ST_API_EMPTY",['status'=>['success' => ST_API_FAIL, 'msg' => 'el cuerpo del contenido está vacío']]);
define("ST_API_METHOD_ERROR", ['status'=>['success'=> ST_API_FAIL, 'msg' => 'método de envío no válido']]);


define("URL_BASE", "http://localhost/projects/store/");