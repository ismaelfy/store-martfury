<?php

$search = (isset($_SESSION['search'])) ? str_replace('-', ' ', $_SESSION['search']) : '';
?>
<header class="header">
	<div class="logo">
		<a href="<?=BASE_URL?>">
			<img src="http://demo2.drfuri.com/martfury3/wp-content/uploads/sites/38/2018/01/logo_light.png" alt="">
		</a>
	</div>
	<div class="content-search">
		<form class="form-search">
			<input type="text" class="input " placeholder="Escribe para buscar" required value="<?=$search?>">
			<button type="submit"><i class="fas fa-search"></i></button>
		</form>
	</div>
	<div class="account">
		<ul>
			<li>
				<a href="#">
					<i class="far fa-heart"></i>
				</a>
			</li>
			<li class="item-cart">
				<a href="<?=BASE_URL?>cart">
					<i class="fas fa-shopping-bag"></i>
					<span class="quantity-cart">0</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class="far fa-user"></i>
				</a>
			</li>
		</ul>

		<div class="menu">
			<input type="checkbox" id="search" class="search_checkbox">
			<label for="search" class="search__button">
				<i class="fas fa-search"></i>
			</label>

			<!-- form search -->
			<div class="search">
				<form class="form-search">
					<input type="text" name="search" class="input" placeholder="Escribe para buscar" required value="<?=$search?>">
					<button type="submit"> <i class="fas fa-search"></i> </button>
				</form>
				<label for="search" class="close"> <i class="fas fa-times"></i> </label>
			</div>

			<input type="checkbox" id="menu" class="menu__checkbox">
			<label for="menu" class="menu__button"></label>
			<ul>
				<li> <a href="#"> Inicio </a> </li>
				<li> <a href="#"> tienda </a> </li>
				<li> <a href="#"> Contacto </a> </li>
			</ul>
		</div>
	</div>
</header>
