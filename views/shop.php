<?php
display_link('Chiry Store - Shop');

$category           = '';
if (isset($_POST['category']) && ($_POST['category'] != '')) {
    $category = preg_replace('/[^0-9]/', '', $_POST['category']);
}

$_SESSION['category'] = [];
if ($category != '') {
    $_SESSION['category'] = "'" . $category . "'";
}

$_SESSION['brand'] = [];
?>
  <main>
	<?php
display_header();
display_navbar();
diplay_shop_products();
?>
  </main>

 <?php
display_footer();
display_sccripts();?>