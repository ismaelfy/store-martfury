<nav class="navbar">
		<?php if (!isset($_POST['cat-nav'])): ?>
		<div class="container">
			<ul id="category-list">
				<li>
					<i class="fas fa-th-list"></i> <span> Categories </span>
				</li>
				<div class="list-container">
					<ul></ul>
				</div>
			</ul>
		<?php else: ?>
		<div class="container center">
		 <?php endif?>
		<ul>
			<li> <a href="<?=BASE_URL?>"> Inicio </a> </li>
			<li> <a href="<?=BASE_URL?>shop/"> tienda </a> </li>
			<li> <a href="<?=BASE_URL?>contact/"> Contacto </a> </li>
		</ul>
	</div>
	<!-- <div class="search">
		<form class="form">
			<input type="text" class="input" placeholder="search for products">
			<button type="button">
				<i class="fas fa-search"></i>
			</button>
		</form>
	</div>	 -->
</nav>
<!-- bottom navigation -->
<div class="bottom-nav">
	<ul>
		<li>
			<a href="<?=BASE_URL?>">
				<span class="material-icons"> home </span>
			 	Inicio
			</a>
		</li>
		<li>
			<a href="#">
				<span class="material-icons"> menu </span>
			 	Categorias
			</a>
			<div class="content-category">
				<div id="container-categories-nav" class="mt-1"></div>
			</div>
		</li>
		<li>
			<a href="#">
				<label for="search">
				<span class="material-icons"> search </span>
			 	Buscar
			 	</label>
			</a>
		</li>
		<li>
			<a href="#">
				<span class="material-icons">local_mall</span>
				Carrito
			</a>
		</li>
	</ul>
</div>
