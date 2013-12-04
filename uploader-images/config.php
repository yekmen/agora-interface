<?php
$__config_load = true;

define('SYSTEM_DIR_ROOT', __DIR__.'/');
define('DIR_ROOT', substr(__DIR__, strrpos(__DIR__, '/')).'/');
// chown(__DIR__);
define('DIR_UPLOAD', 'upload-images/');
define('PATH_UPLOAD', __DIR__.'/'.DIR_UPLOAD);

header('Content-Type: text/html; charset=utf-8');

/**
 * \note only development
 * @{
 */
error_reporting(E_ALL | E_STRICT);

function exception_error_handler($errno, $errstr, $errfile, $errline) {
  throw new ErrorException($errstr, 0, $errno, $errfile, $errline);
}
set_error_handler('exception_error_handler');

/*
//parametre de xdebug
//affichage pour var_dump
ini_set('xdebug.var_display_max_depth', '5');
// ini_set('xdebug.var_display_max_data', '-1');
//affiche les paramètres dans les erreurs de fonctions (2 => type de param)
ini_set('xdebug.collect_params', '2');
//affiche $_SERVER['REQUEST_URI']
ini_set('xdebug.dump.SERVER', 'REQUEST_URI');
//affiche les variables locale
ini_set('xdebug.show_local_vars', '1');
*/
/*
ini_set('xdebug.profiler_enable', '1');
//ce lance si paramètre _GET XDEBUG_PROFILE existe
// ini_set('xdebug.profiler_enable_trigger', '1');
ini_set('xdebug.profiler_output_dir', '/home/poelen/profiling/');
// ini_set('xdebug.profiler_output_name', 'cachegrind.out.%s');
ini_set('xdebug.profiler_append', '1');
*/
//@}


// function __autoload($class_name)
// {
//   require str_replace('_', '/', $class_name).'.php';
// }

/*
 * @return PDO
 * @exception PDOException
 */
// function get_instance_db()
// {
//   static $db = null;
//   if (!$db)
//     $db = new PDO('mysql:dbname=sun-wars;host=localhost', 'root', 'mirador77');
//   return $db;
// }


// set_include_path(get_include_path()
//   .PATH_SEPARATOR.DIR_CLASS
//   .PATH_SEPARATOR.DIR_PROJECT
// //  .PATH_SEPARATOR.DIR_VIEW
// );
