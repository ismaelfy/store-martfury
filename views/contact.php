<?php
display_link('Chiry Store - Shop');
?>
<main>
    <?php
display_header();
display_navbar();
?>
    <section class="py-5" id="contact">
        <div class="container">
            <div class="content-header center">
                <h2>
                    Contáctanos
                </h2>
            </div>
            <div class="row content-form">                
                <div class="col-sm-12 col-md-5">
                    <p class="mb-5">
                        Si tienes consultas, envíanos un correo y a la brevedad nos pondremos en contacto contigo.
                    </p>
                    <ul>
	                    <li>
	                    	<i class="fas fa-map"></i>
	                        <a> 
	                             Av.cesar canevaro 116, Lince - Perú 
	                        </a>
	                    </li>
	                    <li>    
	                    	<i class="fab fa-whatsapp"></i>
	                        <a href="tel:969710362">
	                             (+51) 969 710 362
	                        </a>
	                    </li>
	                    <li>
							<i class="far fa-envelope"></i>
	                        <a href="mailto:info@tsc-peru.com">
	                            info@tsc-peru.com
	                        </a>
	                    </li>
	                </ul>                    
                </div>
                <div class="col-sm-12 col-md-7">
                	<form id="form-contact" class="row">
                        <div class="form-group col-sm-12">
                            <label for="nombres">
                                Nombres y Apellidos
                            </label>
                            <input class="form-control" id="nombres" required name="nombres" type="text"/>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="email">
                                Correo Electrónico
                            </label>
                            <input class="form-control" id="email" required name="email" type="email"/>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="celular">
                                Celular
                            </label>
                            <input class="form-control" id="celular" required="celular" type="text"/>
                        </div>
                        <div class="form-group col-sm-12">
                            <label for="asunto">
                                Asunto
                            </label>
                            <input class="form-control" id="asunto" required name="asunto" type="text"/>
                        </div>
                        <div class="form-group col-sm-12">
                            <label for="mensaje">
                                Mensaje
                            </label>
                            <textarea class="form-control" required name="mensaje" rows="4"></textarea>
                        </div>
                        <div class="form-group col-sm-12">
                        	<button class="button warning" type="submit"> Enviar Mensaje </button>
                        </div>
                    </form>
                </div>

                <div class="col-sm-12 mt-5">
                    <div class="z-depth-1-half mb-4" id="map-container-section" style="height:75vh;width:100%">
                        <iframe allowfullscreen="" aria-hidden="false" frameborder="0" height="450" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3901.4161918383106!2d-77.03812838618344!3d-12.083634891442742!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c9a019185547%3A0x4900c72550226ff6!2sTECH%20SOLUTION%20COMPANY!5e0!3m2!1ses!2spe!4v1590887044054!5m2!1ses!2spe" style="border:0;" tabindex="0" width="100%">
                        </iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<?php display_footer();?>
<script type="text/javascript">
    var onloadCallback = function() {};
</script>
<script async="" defer="" src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit">
</script>

<?php display_sccripts();?>
