(async function load() {
    async function getData(action) {
        const response = await fetch(`${base_url}api/${action}`)
        const data = await response.json();
        if (data.success) {
            return data.result;
        }
        throw new Error('No se encontró ningun resultado')
    }

    function product_template(item) {
        console.log(item)
        return (`
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="card center product">
                    <div class="image">
                        <img src="${item.elements[0].image}"/>
                        <a class="d-block more" data-idprod="${item.id}">
                            <div class="card-option">
                            ${(item.offer!=0)? `<span class="offer"> oferta </span>`:''}                                
                                <a class="favorite" href="#" data-idprod="${item.id}">
                                    <i class="far fa-heart"></i>
                                </a>
                            </div>
                        </a>
                    </div>
                    <div class="description">
                        <p> ${item.title} </p>                        
                            <p class="large"> ${item.description} </p>
                        <div class="content-price">
                            <span class="price"> $ ${item.price} </span>
                            ${(item.offer!=0)?'<span class="price_old"> $ '+item.price_old+'</span>':""}                        
                        </div>
                        <a class="button btn-sm dark add" data-idprod="${item.id}"> add to cart </a>
                    </div>
                </div>
            </div>
            `);
    }

    function productDetail(element) {
        let _item = `<div class="view-product row">
                <div class="images col-sm-12 col-md-6">
                    <div class="content">`;
        element.elements.forEach((item, i) => {
            _item += `<div class="img-zoom ${(i===0)?'active':''}" style="background-image:url(${item.image})" color="${item.color}"></div>`;
        })
        _item += `</div>
                </div>
                <div class="description col-sm-12 col-md-6">
                    <h2> ${element.title} </h2>
                    <h4> ${element.short_description} </h4>
                    <div class="content-price">
                        <span class="price"> $ ${element.price} </span>                        
                        ${(element.price_old>0)?'<span class="price_old"> $ '+element.price_old+'</span>':""}
                    </div>
                    <strong> Informacion de Producto </strong>
                    <p> ${element.description} </p>`;
        if (element.elements.length > 1) {
            _item += `<strong> Colors </strong>
                    <div class="colors">`;
            element.elements.forEach((item, i) => {
                _item += `<a class="color-item ${(i===0)?'active':''}" color="${item.color}" style="background:${item.color}"></a>`;
            })
            _item += `</div>`;
        }
        _item += `<div class="option">
                        <input type="number" value="1" name="quantity" min="1" />
                        <a class="button dark" href="#"> 
                          <i class="fas fa-shopping-cart"></i> Agregar a Carrito
                        </a>
                    </div>        
                </div>
            </div>`;
        return (_item);
    }

    function CreateTemplate(htmlString) {
        const html = document.implementation.createHTMLDocument();
        html.body.innerHTML = htmlString;
        return html.body.children[0];
    }

    function addEventClick(element, item) {
        /*console.log(element)
        console.log(item)*/
        let showMore = document.querySelectorAll('.more');
        let favorites = document.querySelectorAll('.favorite');
        let addCart = document.querySelectorAll('.add');
        showMore.forEach((more) => {
            more.addEventListener('click', function(e) {
                //console.log(this)
            })
        })
        favorites.forEach((favorite)=>{
            favorite.addEventListener('click',function(e) {
                e.preventDefault();
                console.log(this)
            })
        })
        console.log(showMore)
        /*item.addEventListener('click', function() {
            const htmlString = productDetail(item);
            const detail = CreateTemplate(htmlString);
            openModal(htmlString, 'products');
        })*/
    }

    function renderProducts(list, container) {
        //container.children[0].remove();
        list.forEach((item) => {
            const htmlString = product_template(item)
            const productElement = CreateTemplate(htmlString);
            container.append(productElement);
        })
        addEventClick()
    }
    // render new products
    const listProd = await getData(`newproducts`);
    const containerNewProducts = document.querySelector('.container-new-products');
    if (containerNewProducts != null) {
        renderProducts(listProd, containerNewProducts);
    }
    // render shop-products
    const listShopProd = await getData(`products`);
    const containerShopProducts = document.querySelector('.container-shop-products');
    if (containerShopProducts != null) {
        renderProducts(listShopProd, containerShopProducts);
    }
})()