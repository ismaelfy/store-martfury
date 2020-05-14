<div class="container">
    <div class="row">
            <div class="col-sm-12 col-md-4 col-lg-3 content-filter">
                <div class="filter">
                    <strong> Marcas</strong>
                    <div class="custom-radio">
                        <input id="1" type="radio" name="g">
                        <label for="1">Option 1</label>
                    </div>

                    <div class="custom-checkbox">
                        <input id="2" type="checkbox" name="b">
                        <label for="2">Option 1</label>
                    </div>
                    
                </div>
            </div>
            <div class="col-sm-12 col-md-8 col-lg-9">
                <div class="row" id="container-products">
                    <?php for ($i = 0; $i < 12; $i++): ?>
                    <div class="col-sm-6 col-md-6 col-lg-4">
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
                    </div>
                    <?php endfor?>
                </div>
            </div>
    </div>
</div>