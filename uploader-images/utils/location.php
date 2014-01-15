<?php
include_once './config.php';

function location($file)
{
  header('Location: '.DIR_ROOT.$file);
  exit;
}
