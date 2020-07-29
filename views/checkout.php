<?php

if (!isset($_SESSION['cart']) || count($_SESSION['cart'])<=0) {
	header('location: '. BASE_URL);
}

display_link('Chiry Store - Shop');
?>
 <main>
<?php
display_header();
display_navbar();
?>
<section id="checkout">
	<div class="container bg-white py-5">	
		<div class="content row d-flex justify-content-between">
			<div class="col-md-12 col-lg-7">
				<div class="checkout-details">
					<input type="checkbox" id="login"/>
					<form class="form-singin row px-3">
						<div class="col-sm-12 py-0">
							<h2 class="m-0">Login to account</h2>
						</div>
						<div class="col-sm-5 px-1">
							<label for="username"> Usuario </label>
							<input type="text" id="username" class="form-control round" />
						</div>
						<div class="col-sm-5 px-1">
							<label for="password"> Contraseña </label>
							<input type="text" id="password" class="form-control round" />
						</div>
						<div class="col-sm-2">							
							<a href="#" class="button btn-sm dark round"> Login </a>
						</div>
					</form>

					<div class="d-flex justify-content-between">
						<h2 class="m-0"> Detalles de facturación </h2>						
						<a href="#" class="text-primary">
							<label for="login" class="pointer"> Login </label>
						</a>
					</div>
					<div class="form-biling row">
						<div class="col-sm-6">
							<label for="nombres"> Nombres </label>
							<input type="text" id="nombres" class="form-control" />
						</div>

						<div class="col-sm-6">
							<label for="apellidos"> Apellidos </label>
							<input type="text" id="apellidos" class="form-control" />
						</div>

						<div class="col-sm-12">
							<label for="email"> Correo Electrónico </label>
							<input type="email" id="email" class="form-control" />
						</div>

						<div class="col-sm-12">
							<label for="direccion"> Dirección </label>
							<input type="text" id="direccion" class="form-control" />
						</div>

						<div class="col-sm-6">
							<label for="ciudad"> Ciudad </label>
							<input type="text" id="ciudad" class="form-control" />
						</div>
						<div class="col-sm-6">
							<label for="phone"> N° Celular </label>
							<input type="text" id="phone" class="form-control" />
						</div>
						<div class="col-sm-6 custom-checkbox">
							<input type="checkbox" id="create_account"/>
							<label for="create_account"> Crear Cuenta </label>
						</div>
					</div>
				</div>
			</div>

			<div class="col-md-12 col-lg-4">
				<div class="checkout-totals">
					<h2> Su pedido </h2>
					<table class="table">
						<tbody>
							<tr>
								<td>
									<strong>Product:</strong>
								</td>
								<td> Subtotal </td>
							</tr>
							<tr>
								<td>
									8th mouse * 2
								</td>
								<td> $100 </td>
							</tr>

							<tr>
								<td>
									8th mouse * 2
								</td>
								<td> $100 </td>
							</tr>
							<tr>
								<td>
									8th mouse * 2
								</td>
								<td> $100 </td>
							</tr>

							
							<tr>
								<td>
									<strong>Subtotal:</strong>
								</td>
								<td> $ 339 </td>
							</tr>
							<tr>
								<td>
									<strong> Envío:</strong>
								</td>
								<td> $0 </td>
							</tr>
							<tr>
								<td>
									<strong> Total:</strong>
								</td>
								<td> $ 450 </td>
							</tr>
							<tr>
								<td class="border-0" colspan="2">
									<a href="#" class="button dark py-md-2 d-block"> Proceder Pago </a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

</section>

</main>

 <?php 
display_footer();
 
 display_sccripts();?>