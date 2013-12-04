<?php
if (isset($_POST['pseudo'], $_POST['password'])) {
  ///TODO check identification
  include 'config.php';
  include 'utils/disconnect.php';
  purge_connection();
  session_start();
  $_SESSION['Ok'] = 'Ok';
  header('Location: http://'.$_SERVER['HTTP_HOST'].DIR_ROOT.'upload.php');
  exit;
}
?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Connexion</title>
</head>
<body>

<form action="." method="post">
  <fieldset> <legend>Connexion</legend>
  <p><label for="pseudo">Email</label> <input type="test" name="pseudo" id="pseudo" <?php if (isset($_POST['pseudo'])) echo ' value="'.htmlentities($_POST['pseudo']).'"' ?>/></p>
  <p><label for="password">Password</label> <input type="password" name="password" id="password" /></p>
  </fieldset>
  <p><input type="submit" /><p>
</form>

</body>
</html>
