<?php
if (!isset($_SESSION['thanks']) && !$_SESSION['thanks']) {
    header("Location: " . BASE_URL);
}
unset($_SESSION['thanks']);
display_link('Chiry Store - Shop');
?>
 <main>
<?php
display_header();
display_navbar();
?>
<section id="cart">
	<div class="container">
		<div class="content-header h-50">
			<h2 style="font-size: 2.5rem;font-weight: 900">Gracias por su compra</h2>
		</div>
	</div>
</section>

</main>

 <?php
display_footer();

display_sccripts();?>