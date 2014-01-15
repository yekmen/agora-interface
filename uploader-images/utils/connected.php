<?php
if (!session_start() || !isset($_SESSION['Ok']) || empty($_SESSION['Ok']))
{
  include_once './utils/disconnect.php';
  disconnect();
}
