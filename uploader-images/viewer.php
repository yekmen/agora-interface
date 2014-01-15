<?php
include './config.php';
include './utils/connected.php';
?><!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Visionneuse d'images</title>

<link rel="stylesheet" href="style.css">
</head>
<body>

<?php include './inc/menu.php'; ?>

<section>
<?php
if ($handle = opendir(PATH_UPLOAD)) {
  while (false !== ($entry = readdir($handle))) {
    if ($entry === '.' || $entry === '..') {
      continue;
    }
    echo '<figure><img src="'.DIR_ROOT.DIR_UPLOAD.$entry.'" alt=""><figcaption>'.$entry.'</figcaption></figure>';
  }
}
?>
</section>

</body>
</html>
