<?php
function show_menu($file, $text) {
  if ($file == $_SERVER['SCRIPT_NAME']) {
    echo '<li class="selected-page"><a href="'.$file.'">'.$text.'</a></li>';
  }
  else {
    echo '<li><a href="'.DIR_ROOT.$file.'">'.$text.'</a></li>';
  }
}
?>

<nav>
  <ul><?php
    show_menu('disconnect.php', 'Déconnection');
    show_menu('upload.php', 'Upload');
    show_menu('viewer.php', 'Visionneuse');
  ?></ul>
</nav>
