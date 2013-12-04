<?php
include_once './utils/location.php';

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
  location('index.php');
}
