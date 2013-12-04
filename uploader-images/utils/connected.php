<?php
if (!session_start() || !isset($_SESSION['Ok']) || empty($_SESSION['Ok']))
{
  include './disconnect.php';
  disconnect();
}

include './config.php';
