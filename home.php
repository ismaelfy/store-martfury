<?php 
  require 'include/functions.php';
  
  display_link('Chiry Store - Home');
?>
  <main>
<?php
  display_header();
  display_navbar();
  display_carousel();
?>
      <section class="container-flud py-5">
          <div class="grid">
              <div class="grid-12 grid-sm-6 grid-md-4 grid-lg-3 center">
                  <div class="icon">
                      <i class="fas fa-truck"></i>
                  </div>
                  <strong> Envío Gratis </strong>
                  <p> Para todos los mayores de $ 99. </p>
              </div>

              <div class="grid-12 grid-sm-6 grid-md-4 grid-lg-3 center">
                  <div class="icon">
                      <i class="fas fa-trophy"></i>
                  </div>
                  <strong> Garantía 1 mes </strong>
                  <p> Si los bienes tienen problemas. </p>
              </div>

              <div class="grid-12 grid-sm-6 grid-md-4 grid-lg-3 center">
                  <div class="icon">
                      <i class="far fa-comments"></i>
                  </div>
                  <strong> Soporte 24/7 </strong>
                  <p> Soporte dedicado. </p>
              </div>

              <div class="grid-12 grid-sm-6 grid-md-4 grid-lg-3 center">
                  <div class="icon">
                      <i class="fas fa-gift"></i>
                  </div>
                  <strong> Servicio de regalo </strong>
                  <p> Servicio de regalo de apoyo </p>
              </div>
          </div>
      </section>

      <?php display_newproducts();?>

    <section class="product-brand">
      <div class="container-brand-products">
        <div class="row">
          
        </div>
      </div>    
    </section>
  </main>
  <script src="<?=URL_BASE?>assets/js/carousel.js"> </script>
 <?php display_sccripts();?>
