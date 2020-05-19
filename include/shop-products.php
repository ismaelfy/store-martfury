<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-4 col-lg-2 content-filter pt-5">
            <div class="filter py-2" id="brand">
                <strong> Marcas</strong>
                <div class="custom-checkbox pl-1">
                        <input type="checkbox" id="nike" class="option-input checkbox"/>
                    <label for="nike"> Nike </label>
                </div>

                <div class="custom-checkbox pl-1">
                        <input type="checkbox" id="adidas" class="option-input checkbox"/>
                    <label for="adidas"> Adidas </label>
                </div>

                <div class="custom-checkbox pl-1">
                        <input type="checkbox" id="jordan" class="option-input checkbox" />
                    <label for="jordan"> Jordan </label>
                </div>
            </div>

            <div class="filter py-2" id="brand">
                <strong> Categoy</strong>
                <div class="custom-checkbox pl-1">
                        <input type="checkbox" id="sport" class="option-input checkbox"/>
                    <label for="sport"> sport </label>
                </div>

                <div class="custom-checkbox pl-1">
                        <input type="checkbox" id="casual" class="option-input checkbox"/>
                    <label for="casual"> casual </label>
                </div>

                <div class="custom-checkbox pl-1">
                        <input type="checkbox" id="elegante" class="option-input checkbox" />
                    <label for="elegante"> elegante </label>
                </div>
            </div>
        </div>

        <div class="col-sm-12 col-md-8 col-lg-10">
            <div class="py-2 d-flex justify-content-end align-items-center" id="content-header">
                <input type="radio" class="filter-product" id="first" name="filter" checked value="0"/>
                <label for="first" class="mr-1 label-fil active"> 
                    <i class="fas fa-th-large"></i> 
                </label>

                <input type="radio" class="filter-product" id="second"  name="filter" value="1"/>
                <label for="second" class="label-fil"> 
                    <i class="fas fa-th-list"></i> 
                </label>
            </div>

            <div class="row container-shop-products">
                
                <!-- <div class="col-sm-6 col-md-6 col-lg-4 col-product">
                    <div class="card center product">
                        <div class="image">
                            <img src="<?=URL_BASE?>assets/image/adidas-run-zapatilla-azul-p-02.jpg"/>
                            <a class="d-block more">
                                <div class="card-option">
                                    <span class="offer">
                                        20%
                                    </span>
                                    <a class="favorite" href="#">
                                        <i class="far fa-heart">
                                        </i>
                                    </a>
                                </div>
                            </a>
                        </div>
                        <div class="description">
                            <p>
                                Nike MX-720-818
                            </p>
                            <p class="large">Cruzar la línea de meta no es tan importante como la sensación de batir tu mejor marca personal. Estas zapatillas de running presentan un diseño ajustado que te proporciona una amortiguación ultrasuave para que alcances todos tus objetivos. Incorporan un refuerzo del antepié al talón que le confiere mayor estabilidad y control a tu pisada y lucen las míticas 3 Tiras en el exterior de malla técnica transpirable.</p>
                            <div class="content-price">
                                <span class="price">
                                    $ 32.50
                                </span>
                                <span class="price_old">
                                    $ 45.00
                                </span>
                            </div>
                            <a class="button btn-sm dark" href="#">
                                add to cart
                            </a>
                        </div>
                    </div>
                </div> -->
                
            </div>
        </div>
    </div>
</div>