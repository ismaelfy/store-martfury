<?php
require 'include/functions.php';
display_link('Chiry Store - Shop');
?>
 <main>
<?php
display_header();
display_navbar();
?>
<section id="carrito">
	<div class="container bg-white py-5">
		<div class="header ">
			<h2>Carrito de compras</h2>
		</div>
		<div class="content row">
			<div class="col-md-12 col-lg-8">
				<div class="cart-details">
					<table class="table">
					  <thead>
					    <tr>
					      <th scope="col"></th>
					      <th scope="col">Product</th>
					      <th scope="col">Price</th>
					      <th scope="col">Quantity</th>
					      <th scope="col">Subtotal</th>
					    </tr>
					  </thead>
					  <tbody>
					  	<?php for ($i = 0; $i < 3; $i++): ?>
					    <tr>
					      <td class="img">
					      	<img src="<?=URL_BASE?>assets/image/adidas-run-zapatilla-azul-p-02.png"  width="60" alt="">
					      </td>
					      <td>ZAPATILLAS NOVA RUN</td>
					      <td>$ 199</td>
					      <td class="quantity">
					      		<input type="number" class="form-control" value="1" min="1">
					      </td>
					      <td>$ 199 </td>
					    </tr>
					    <?php endfor;?>
					  </tbody>
					</table>
				</div>
			</div>
			<div class="col-md-12 col-lg-4">
				<div class="cart-totals">
					<h2>CART TOTAL</h2>
					<table class="table">
						<tbody>
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
								<td> Envío Gratis a todo Lima </td>
							</tr>
							<tr>
								<td>
									<strong> Total:</strong>
								</td>
								<td> $ 450 </td>
							</tr>
							<tr>
								<td class="border-0" colspan="2">
									<a href="<?=URL_BASE?>checkout" class="button dark py-md-2 d-block"> Proceder Pago </a>
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

 <?php display_sccripts();?>