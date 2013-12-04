<?php
if (!isset($__config_load)) {
  include './config.php';
}

function purge_connection()
{
  if (isset($_SESSION))
  {
    $_SESSION = array();

    //efface le cookie de session
    if (ini_get('session.use_cookies'))
    {
      $params = session_get_cookie_params();
      setcookie(session_name(), '', 0,
        $params['path'], $params['domain'],
        $params['secure'], $params['httponly']
      );
    }

    session_destroy();
    session_write_close();
  }
}

function disconnect()
{
  purge_connection();
  header('Location: http://'.$_SERVER['HTTP_HOST'].dirname($_SERVER['SCRIPT_NAME']).'/index.php');
  exit;
}
