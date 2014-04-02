<?php
include_once './config.php';

function location($file)
{
  header('Location: '.$file);
  exit;
}
