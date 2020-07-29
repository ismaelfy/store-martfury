(async function load() {
    async function getData(action) {
        const response = await fetch(`${base_url}api/${action}`)
        const data = await response.json();
        if (data.success) {
            return data.result;
        }
        throw new Error('No se encontró ningun resultado')
    }
    async function countCart() {
        let quantitycart = document.querySelector('.quantity-cart');
        const response = await fetch(`${base_url}api/cart/count`);
        const data = await response.json();
        if (data.success) {
            quantitycart.textContent = data.result ? data.result : 0;
        }
    }
    // count cart
    countCart();
    // template products, brands, categories
    function product_template(item) {
        return (`
            <div class="col-sm-12 col-md-6 col-lg-4 col-xl-3">
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
                    <div class="description pb-1">
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

    function product_Brand_template(item) {
        return (`
            <div class="col-sm-12 col-md-6 col-lg-4">
                <div class="card-product ">
                    <img src="${item.image}" alt="image"/>
                    <a class="more" data-idprod="${item.id}">
                        <div class="content pt-3">
                            <span> ${item.category} </span>
                            <p> ${item.title} </p>
                            <b>$ ${item.price} </b>
                        </div>
                     </a>
                </div>
            </div>
        `);
    }

    function product_detail_template(element) {
        let _item = `<div class="view-product product row">
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
                    <p> ${element.description} </p>
                    <form id="form-product" data-idprod="${element.id}">`;
        if (element.elements.length > 1) {
            _item += `<strong> Colors </strong>
                    <div class="colors">`;
            element.elements.forEach((item, i) => {
                _item += `<a class="color-item ${(i===0)?'active':''}" color="${item.color}" style="background:${item.color}"></a>`;
            })
            _item += `</div>`;
        }
        _item += `<div class="option">
                        <input type="number" value="1" id="quantity" name="quantity" min="1" />
                        <button type="submit" class="button dark">                        
                          <i class="fas fa-shopping-cart"></i> Agregar a Carrito                        
                        </button>
                    </div>
                    </form>
                </div>
            </div>`;
        return (_item);
    }

    function brand_category_template(item, name) {
        return (`
            <div class="custom-checkbox pl-1">
                    <input type="checkbox" ${(item.checked==1)?'checked':''} id="${item.description}" data-id="${item.id}" class="option-input checkbox ${name}"/>
                <label for="${item.description}"> ${item.description} </label>
            </div>
        `);
    }
    // template cart detail
    function cart_summary_template(item, container) {
        if (item.amount > 0) {
            let content = `<div class="cart-totals mt-3">
                <h2>CART TOTAL</h2>
                <table class="table">
                    <tbody>
                        <tr>
                            <td><strong>Subtotal:</strong></td>
                            <td> $ ${item.amount} </td>
                        </tr>
                        <tr>
                            <td><strong> Envío:</strong></td>
                            <td> $ ${item.shipping}</td>
                        </tr>
                        <tr>
                            <td><strong> Total:</strong></td>
                            <td> $ ${item.total} </td>
                        </tr>
                        <tr>
                            <td class="border-0" colspan="2">
                                <a href="./checkout" class="button dark py-2 d-block"> Proceder Pago </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                </div>
                `;
            container.innerHTML = content;
        } else {
            container.style.display = 'none';
            container.innerHTML = '';
        }
    }

    function cart_list_template(item) {
        return (`
            <tr>
              <td class="img">
                <img src="${item.img}"  width="60" alt="">
              </td>
              <td> ${item.title} </td>
              <td> $ ${item.price} </td>
              <td class="quantity">
                    <input type="number" class="form-control quantity-cart" data-idprod="${item.id}" value="${item.quantity}" min="1">
              </td>
              <td class="amount"> $ ${item.amount} </td>
              <td class="delete"> <a href="#" class="text-grey remove-cart" data-idprod="${item.id}"> <i class="fas fa-times"></i> </a> </td>
            </tr>
        `);
    }

    function cart_detail_template(item, container) {
        if (item) {
            let element = '';
            item.forEach((list) => {
                element += cart_list_template(list);
            })
            let _item = `
            <table class="table">
              <thead>
                <tr>
                  <th scope="col"></th>
                  <th scope="col">Product</th>
                  <th scope="col">Price</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Subtotal</th>
                  <th scope="col"></th>
                </tr>
              </thead>
              <tbody>
                ${element}
              </tbody>
            </table>`;
            container.innerHTML = _item;
        } else {
            let _item = `<div class="center align-items-center">
                <p class="m-0 my-1"> El carrito esta vacio.</p>
                <a href="./shop" class="button dark"> Seguir comprando </a>
            </div>`;
            const contProducts = document.querySelector('.conte-products');
            contProducts.classList.add('d-w-100');
            container.innerHTML = _item;
        }
    }

    function CreateTemplate(htmlString) {
        const html = document.implementation.createHTMLDocument();
        html.body.innerHTML = htmlString;
        return html.body.children[0];
    }
    // det product of DB
    async function getProduct(id) {
        const listProd = await getData(`products/get/${id}`);
        const htmlString = product_detail_template(listProd);
        const detail = CreateTemplate(htmlString);
        openModal(htmlString, 'products');
        setTimeout(function() {
            addEventDeatil();
        }, 100);
    }
    // list category in nav
    function list_categories(list) {
        return `<li class="item-category-list" data-id="${list.id}"> ${list.description} </li>`;
    }

    function list_categories_old(item) {
        let _item = '<ul>';
        if (item) {
            console.log(item)
            item.forEach((list) => {
                _item += `<li class="item-category-list" data-id="${list.id}"> ${list.description} </li>`;
            })
        }
        _item = '</ul>';
        return _item;
    }

    function select_template(item, type = '') {
        switch (type) {
            case 'brands':
                {
                    return brand_category_template(item, 'brand');
                }
            case 'categories':
                {
                    return brand_category_template(item, 'category');
                }
            case 'list-category':
                {
                    return list_categories(item);
                }
            case 'prodducts_brand':
                {
                    return product_Brand_template(item);
                }
            case 'cart':
                {
                    return cart_list_template(item);
                }
            default:
                {
                    return product_template(item);
                }
        }
    }
    const category_nav = document.getElementById('container-categories-nav');
    // render all items
    function renderElements(list, container, type = '') {
        if (list) {
            list.forEach((item) => {
                const htmlString = select_template(item, type)
                const Element = CreateTemplate(htmlString);
                if (type == 'categories' && category_nav != null) {
                    //console.log(container)
                    category_nav.append(Element);
                }
                container.append(Element);
            })
        }
    }
    // render new products
    const listProd = await getData(`products/new`);
    const containerNewProducts = document.querySelector('.container-new-products');
    if (containerNewProducts != null) {
        renderElements(listProd, containerNewProducts);
    }
    // render shop-products
    const containerShopProducts = document.querySelector('.container-shop-products');
    async function getProducts(type = '') {
        const listShopProd = await getData(`products`);
        if (type != '') {
            containerShopProducts.textContent = ' ';
        }
        renderElements(listShopProd, containerShopProducts);
        addEventClick();
    }
    if (containerShopProducts != null) {
        getProducts()
    }
    // render brand-products 
    const listbrandProd = await getData(`products/brand`);
    const containerBrandProducts = document.querySelector('.container-brand-products');
    if (containerBrandProducts != null) {
        renderElements(listbrandProd, containerBrandProducts, 'prodducts_brand');
    }
    // render brands
    const listBrand = await getData('brands');
    const containerBrand = document.querySelector('#container-brands');
    if (containerBrand != null) {
        renderElements(listBrand, containerBrand, 'brands');
    }
    // render brands
    const listCategory = await getData('categories');
    const containerCategory = document.querySelector('#container-categories');
    if (containerCategory != null) {
        renderElements(listCategory, containerCategory, 'categories');
    }
    const listCategories = document.querySelector('.list-container ul');
    if (listCategories != null) {
        renderElements(listCategory, listCategories, 'list-category');
    }
    // get products with brand y category
    let brands = document.querySelectorAll('input.brand');
    let categories = document.querySelectorAll('input.category');
    async function filter_products(data) {
        body.classList.add("loading")
        const response = await fetch(`${base_url}api/products/filter/`, {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(res => res.json());
        if (response.success) {
            getProducts("load")
        } else {
            toaster("ocurrio error al cargar", "danger")
        }
        body.classList.remove("loading")
    }

    function Data_fil() {
        let Category = [],
            Brand = [];
        categories.forEach((cat) => {
            if (cat.checked) {
                Category.push({
                    id: cat.dataset.id
                })
            }
        })
        brands.forEach((item) => {
            if (item.checked) {
                Brand.push({
                    id: item.dataset.id
                })
            }
        })
        filter_products({
            Category,
            Brand
        })
    }

    function fil_brand() {
        brands.forEach((brand) => {
            brand.addEventListener('click', function() {
                Data_fil()
            })
        })
    }

    function fil_category() {
        categories.forEach((cat) => {
            cat.addEventListener('click', function() {
                Data_fil()
            })
        })
    }
    if (brands != null && categories != null) {
        fil_category()
        fil_brand()
    }
    //set category url
    function set_category() {
        const list_cat = document.querySelectorAll('.item-category-list');
        list_cat.forEach((list) => {
            list.addEventListener('click', function(e) {
                window.location.href = base_url + 'shop/category/' + list.dataset.id;
                /*Category.push({
                    id: list.dataset.id
                })
                console.log(Category)*/
            })
        })
    }
    if (listCategories != null) {
        set_category()
    }
    // render cart details
    function cart_Detail_Events() {
        let quantity = document.querySelectorAll('input.quantity-cart');
        quantity.forEach((item) => {
            item.addEventListener('change', function(e) {
                let idprod = this.dataset.idprod;
                let _value = this.value;
                //console.log(idprod)
                if (idprod === '' || (_value === '' || _value <= 0)) {
                    toaster("la cantidad debe ser mayor a cero", "danger");
                    this.value = 1;
                    return false;
                }
                add_cart({
                    id: idprod,
                    quantity: _value
                }, 'update')
            })
        })
        // remove items - cart
        let deletes = document.querySelectorAll('.remove-cart');
        deletes.forEach((remove) => {
            remove.addEventListener('click', function(e) {
                e.preventDefault();
                remove_Cart(this.dataset.idprod)
            })
        })
    }
    const containerDetail = document.querySelector('.container-cart-details');
    async function List_Cart_items() {
        const containerSummary = document.querySelector('.container-cart-summary');
        const response = await fetch(`${base_url}api/cart/get`)
        /*let data = await response.json();
        console.log("res", data)
        const detail = data.result.data;
        const summary = data.result.summary;*/
        const {
            result: {
                data,
                summary
            }
        } = await response.json();
        cart_summary_template(summary, containerSummary);
        cart_detail_template(data, containerDetail);
        cart_Detail_Events(); // all events        
    }
    async function remove_Cart(id) {
        body.classList.add("loading")
        const response = await fetch(`${base_url}api/cart/remove/`, {
            method: 'POST',
            body: JSON.stringify({
                id: id
            }),
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(res => res.json());
        if (response.success) {
            toaster(response.msg, "success")
            List_Cart_items();
            setTimeout(function() {
                body.classList.remove("loading")
                countCart();
            }, 500);
        } else {
            toaster(response.msg, "danger")
        }
    }
    //const listCartDetail = await getData('cart/get');
    if (containerDetail != null) {
        List_Cart_items();
    }
    //renderElements(listCartDetail, containerCartDetail, 'cart');
    // add item to cart
    async function add_cart(item, type = '') {
        body.classList.add("loading")
        const response = await fetch(`${base_url}api/cart/add/`, {
            method: 'POST',
            body: JSON.stringify(item),
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(res => res.json())
        if (response.success) {
            if (type == 'update') {
                toaster("se actualizo en carrito", "blue")
            } else {
                toaster(response.msg, "success")
            }
        } else {
            toaster(response.msg, "danger")
        }
        setTimeout(function() {
            body.classList.remove("loading")
            countCart();
        }, 500);
        if (type = 'update') {
            if (containerDetail != null) {
                List_Cart_items();
            }
        }
    }
    // add event detail product
    function addEventDeatil() {
        let form = document.getElementById('form-product');
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            let idprod = this.dataset.idprod;
            let color = document.querySelector('.color-item.active');
            color != null ? color.getAttribute('color') : '';
            let quantity = document.getElementById('quantity').value;
            if (quantity === '' || quantity <= 0) {
                toaster("la cantidad debe ser mayor a cero", "danger");
                return false;
            }
            add_cart({
                id: idprod,
                color: color,
                quantity: quantity
            })
        })
    }

    function addEventClick(element, item) {
        let showMore = document.querySelectorAll('.more');
        let favorites = document.querySelectorAll('.favorite');
        let addCarts = document.querySelectorAll('.add');
        showMore.forEach((more) => {
            more.addEventListener('click', function(e) {
                getProduct(this.dataset.idprod)
            })
        })
        favorites.forEach((favorite) => {
            favorite.addEventListener('click', function(e) {
                e.preventDefault();
            })
        })
        addCarts.forEach((add) => {
            add.addEventListener('click', function(e) {
                let content = this.closest('product');
                add_cart({
                    id: this.dataset.idprod
                })
            })
        })
    }
    addEventClick();
    // checkout
    function checkout_login_template() {
        return (`
        <input type="checkbox" id="login"/>
        <form class="form-singin row px-3" required>
            <div class="col-sm-12 py-0">
                <h2 class="m-0">Login to account</h2>
            </div>
            <div class="col-sm-5 px-1">
                <label for="username"> Correo Electrónico </label>
                <input type="email" id="username" class="form-control round" />
            </div>
            <div class="col-sm-5 px-1">
                <label for="pwd"> Contraseña </label>
                <input type="password" id="pwd" class="form-control round" />
            </div>
            <div class="col-sm-2">                          
                <button type="submit" class="button btn-sm dark round"> Login </button>
            </div>
        </form>`);
    }
    const conatinerCheckout = document.querySelector('.checkout-details');

    function checkout_detail_template(item) {
        let element = `${!item.state? checkout_login_template():''}
        <div class="d-flex justify-content-between">                
                <h2 class="m-0"> Detalles de facturación </h2>
                <a href="#" class="text-primary">
                    ${!item.state?'<label for="login" class="pointer"> Login </label>':''}
                </a>
            </div>  
            <form class="form-biling row" >
                <div class="col-sm-6">
                    <label for="firstname"> Nombres </label>
                    <input type="text" id="firstname" name="firstname" class="form-control" value="${item.firstname?item.firstname:''}" />
                </div>

                <div class="col-sm-6">
                    <label for="lastname"> Apellidos </label>
                    <input type="text" id="lastname" name="lastname" class="form-control" value="${item.lastname?item.lastname:''}"/>
                </div>

                <div class="col-sm-12">
                    <label for="email"> Correo Electrónico </label>
                    <input type="email" id="email" name="email"  class="form-control" value="${item.email?item.email:''}" />
                </div>

                <div class="col-sm-12">
                    <label for="adress"> Dirección </label>
                    <input type="text" id="adress" name="adress" class="form-control" value="${item.adress?item.adress:''}" />
                </div>

                <div class="col-sm-6">
                    <label for="city"> Ciudad </label>
                    <input type="text" id="city" name="city" class="form-control" value="${item.city?item.city:''}" />
                </div>
                <div class="col-sm-6">
                    <label for="phone"> N° Celular </label>
                    <input type="text" id="phone" name="phone" class="form-control" value="${item.phone?item.phone:''}"/>
                </div>`;
        if (!item.state) {
            element += `<div class="col-sm-6 custom-checkbox">
                    <input type="checkbox" id="create_account" name="create_account"/>
                    <label for="create_account"> Crear Cuenta </label>
                </div>`;
        }
        element += `<div class="col-sm-12 col-pass" style="display:none">
                    <label for="password"> Contraseña </label>
                    <input type="password" id="password" name="password" class="form-control" />
                </div>
            </form>`;
        conatinerCheckout.innerHTML = element;
        //getCheckout()
    }

    function checkout_summary_item_template(item) {
        let _list = '';
        if (item) {
            item.forEach((list) => {
                _list += `<tr>
                    <td> ${list.title.toLowerCase()}</td>
                    <td> ${list.amount} </td>
                </tr>`;
            });
        }
        return _list;
    }

    function checkout_summary_template(item) {
        const conatinerCheckSummary = document.querySelector('.checkout-totals');
        const {
            cart,
            summary
        } = item;
        const list = checkout_summary_item_template(cart);
        let element = `<h2> Su pedido </h2>
            <table class="table">
                <tbody>
                    <tr>
                        <td>
                            <strong>Product:</strong>
                        </td>
                        <td> Subtotal </td>
                    </tr>`;
        element += list;
        element += `<tr><td class="border-0"></td></tr>
                    
                    <tr>
                        <td>
                            <strong>Subtotal:</strong>
                        </td>
                        <td> $ ${summary.amount} </td>
                    </tr>
                    <tr>
                        <td>
                            <strong> Envío:</strong>
                        </td>
                        <td> $ ${summary.shipping} </td>
                    </tr>
                    <tr>
                        <td>
                            <strong> Total:</strong>
                        </td>
                        <td> $ ${summary.total} </td>
                    </tr>
                    <tr>
                        <td class="border-0" colspan="2">
                            <a href="#" class="button dark py-3 d-block" id="payment"> Proceder Pago </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        `;
        conatinerCheckSummary.innerHTML = element;
    }
    async function Login(item) {
        const response = await fetch(`${base_url}api/account/login/`, {
            method: 'POST',
            body: JSON.stringify(item),
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(res => res.json())
        if (!response.success) {
            toaster(response.msg, "danger");
            return false;
        }
        if (response.success) {
            toaster(response.msg, "success");
            return true;
        }
        return false;
    }
    async function Singin(item) {
        body.classList.add("loading")
        const res = await Login({
            email: item.email,
            pwd: item.pwd
        });
        if (!res) {
            body.classList.remove("loading")
            return false;
        }
        getCheckout()
        body.classList.remove("loading")
    }

    function formSingin() {
        const formLogin = document.querySelector('.form-singin');
        if (formLogin != null) {
            formLogin.addEventListener('submit', function(e) {
                e.preventDefault();
                const user = document.getElementById('username');
                const pwd = document.getElementById('pwd');
                if (user.value == '') {
                    user.classList.add('error');
                    toaster(`Falta ingresar usuario`, "danger");
                    return false;
                }
                if (pwd.value == '') {
                    pwd.classList.add('error');
                    toaster(`Falta ingresar contraseña`, "danger");
                    return false;
                }
                Singin({
                    email: user.value,
                    pwd: pwd.value
                });
            })
        }
    }

    function input_valid(name, alias = '') {
        name.classList.remove('error');
        if (!name.value) {
            toaster(`Falta escribir ${alias}`, "danger");
            name.classList.add('error');
            return false;
        }
        return true;
    }

    function valid_form_cheackout() {
        const firstname = document.querySelector('#firstname');
        if (!input_valid(firstname, 'Nombres')) {
            return false;
        }
        const lastname = document.querySelector('#lastname');
        if (!input_valid(lastname, 'Apellidos')) {
            return false;
        }
        const email = document.querySelector('#email');
        if (!input_valid(email, 'Correo electrónico')) {
            return false;
        }
        const adress = document.querySelector('#adress');
        if (!input_valid(adress, 'Dirección')) {
            return false;
        }
        const city = document.querySelector('#city');
        if (!input_valid(city, 'Ciudad')) {
            return false;
        }
        const phone = document.querySelector('#phone');
        if (!input_valid(phone, 'Numero de Celular')) {
            return false;
        }
        let create_account = document.querySelector('#create_account');
        let password = document.querySelector('#password');
        let account = 0;
        if (create_account != null) {
            if (create_account.checked) {
                account = 1;
                if (!input_valid(password, 'ingresa la contraseña')) {
                    return false;
                }
            }
        }
        const data = {
            "firstname": firstname.value,
            "lastname": lastname.value,
            "email": email.value,
            "adress": adress.value,
            "city": city.value,
            "phone": phone.value,
            "password": password.value,
            "type": account
        };
        return data;
    }
    async function create_account(data) {
        body.classList.add("loading")
        const response = await fetch(`${base_url}api/payment/save/`, {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(res => res.json());
        if (!response.success) {
            toaster(response.msg, "danger");
        }
        if (response.success) {
            toaster(response.msg, "success");
            setTimeout(function() {
                window.location.href = `${base_url}thanks/`;
            }, 500);
        }
        //console.log(response)
        body.classList.remove("loading")
    }

    function save_checkout() {
        const button = document.querySelector('#payment');
        button.addEventListener('click', function(e) {
            e.preventDefault();
            const data = valid_form_cheackout();
            if (data) {
                const result = create_account(data);
            }
        })
        //
    }

    function togglePas() {
        const input = document.getElementById('create_account');
        const colum = document.querySelector('.col-pass');
        if (input != null) {
            input.addEventListener('change', function(e) {
                if (this.checked) {
                    colum.style.display = 'block';
                } else {
                    colum.style.display = 'none';
                }
            })
        }
    }
    async function getCheckout() {
        const response = await fetch(`${base_url}api/checkout/`).then(res => res.json())
        const {
            success,
            result: {
                account,
                data
            }
        } = await response;
        //console.log(success, account, data)
        checkout_detail_template(account)
        togglePas();
        formSingin();
        checkout_summary_template(data)
        save_checkout();
    }
    if (conatinerCheckout != null) {
        getCheckout();
    }
    //console.log(conatinerCheckout, conatinerCheckSummary)
})()