<section class="container py-6 px-3" id="products">
    <div class="row" id="container-products">
        <?php for ($i = 0; $i < 12; $i++): ?>
        <div class="col-sm-6 col-md-4 col-lg-3">
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
</section>
