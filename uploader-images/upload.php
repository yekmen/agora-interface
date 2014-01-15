<?php
include './utils/connected.php';
include_once './config.php';

///\attention directory name must not contain the chracters '.'
function no_conflit_filename($dir, $filename) {
  $len = strlen($filename);
  $pos = strpos($filename, '.');
  if ($pos) {
    $dir .= preg_replace('[^A-Za-z0-9]', '', substr($filename, 0, $pos));
  }
  $dir .= '-'.uniqid();
  while (file_exists($dir)) {
    $dir = substr($dir, strlen($dir) - 11).uniqid();
  }
  return $dir.'.png';
}


$iderr = array();
if (isset($_FILES['pictures']) && is_array($_FILES['pictures'])) {
  foreach ($_FILES['pictures']['error'] as $key => $error) {
    if ($error == UPLOAD_ERR_NO_FILE) {
      continue;
    }
    if ($error == UPLOAD_ERR_OK) {
      $tmp_name = $_FILES['pictures']['name'][$key];
      $name = $tmp_name;
      if (false !== getimagesize(PATH_UPLOAD.$entry, $info)) {
        $name = no_conflit_filename(PATH_UPLOAD, $name);
        move_uploaded_file($tmp_name, $name);
      }
      else {
        $iderr[] = $key;
        $_FILES['pictures']['error'][$key] = -1;
      }
    }
    else {
      $iderr[] = $key;
    }
  }
}
?><!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Uploader des images</title>
</head>
<body>

<?php
include './inc/menu.php';

function error_file($uppload_err)
{
  switch ($uppload_err) {
    case -1: return 'Le fichier n\'est pas une image.';
    case UPLOAD_ERR_INI_SIZE:
    case UPLOAD_ERR_FORM_SIZE: return 'Le fichier téléchargé excède la taille de '.ini_get('upload_max_filesize');
    case UPLOAD_ERR_PARTIAL: return 'Le fichier n\'a été que partiellement téléchargé';
    case UPLOAD_ERR_NO_FILE: return 'Aucun fichier n\'a été téléchargé';
    case UPLOAD_ERR_NO_TMP_DIR: return 'Un dossier temporaire est manquant, contacter l\'administrateur';
    case UPLOAD_ERR_CANT_WRITE: return 'Échec de l\'écriture du fichier sur le disque, contacter l\'administrateur';
    case UPLOAD_ERR_EXTENSION: return 'Une extension PHP a arrêté l\'envoi de fichier, contacter l\'administrateur';
  }
  return 'Error inconnue';
}

foreach ($iderr as $id) {
  echo '<p> Le fichier "'.htmlentities($_FILES["pictures"]).'" n\'a pu être enregistré. '.error_file($_FILES['pictures']['error'][$id]).'.</p>';
}

$max_file_size = ini_get('upload_max_filesize');
?>

<form action="" method="post" enctype="multipart/form-data" max-file-size="<?=$max_file_size?>">
<fieldset>
  <legend>Images</legend>

  <p><input type="file" name="pictures[]" data-max-size="<?=$max_file_size?>" /></p>
  <p><input type="file" name="pictures[]" data-max-size="<?=$max_file_size?>" /></p>
  <p><input type="file" name="pictures[]" data-max-size="<?=$max_file_size?>" /></p>

  <p><input type="submit" /></p>
</fieldset>
</form>

</body>
</html>
