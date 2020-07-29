let modal = document.querySelector(".modal")
let modalBody = document.querySelector(".modal-mody");
let body = document.body;

function openModal(element, action = '') {
    if (action != '') {
        modalBody.innerHTML = element;
        addEvents()
        body.classList.add("open-modal")
    }
}
//openModal();
function closeModal() {
    body.classList.remove("open-modal")
}

function toggleModal() {
    body.classList.toggle("open-modal")
}
// get button more products
let btns_more = document.querySelectorAll('a.more');
btns_more.forEach(btn => {
    btn.addEventListener('click', function() {
        toggleModal();
    })
})
let close_modal = document.querySelector('.modal-close');
close_modal.addEventListener('click', function() {
    toggleModal();
})
window.onclick = function(e) {
    if (e.target == modal) {
        //body.classList.remove("open-modal")
    }
}

function toaster(title = "", color = "success", time = 2000) {
    const html = document.implementation.createHTMLDocument();
    html.body.innerHTML = `<div class="toaster ${color}"> 
        <span> ${title} </span> 
    </div>`;
    let _span = html.body.children[0];
    body.classList.add("toast")
    body.appendChild(_span)
    setTimeout(function() {
        _span.classList.add("hide");
        setTimeout(function() {
            body.classList.remove("toast")
            _span.remove();
        }, 900);
    }, time);
}
/*change image & color*/
function addEvents() {
    const colors = document.querySelectorAll('a.color-item');

    function removeColor() {
        colors.forEach(c => c.classList.remove('active'))
        images.forEach(i => i.classList.remove('active'))
    }
    colors.forEach(item => {
        item.addEventListener('click', function(e) {
            let color = this.getAttribute('color');
            let img = document.querySelector(`.img-zoom[color="${color}"]`);
            removeColor();
            this.classList.add('active');
            img.classList.add('active');
            zoomImage()
        })
    })
    //zoom image detail
    const images = document.querySelectorAll('.img-zoom'); // all images
    function zoomImage() {
        const image = document.querySelector('.img-zoom.active'); // active image
        image.addEventListener('mouseover', function(e) {
            image.style.backgroundSize = '200%';
        })
        image.addEventListener('mousemove', function(e) {
            let width = image.offsetWidth;
            let height = image.offsetHeight;
            let x = e.offsetX;
            let y = e.offsetY;
            let newx = (x / width * 100)
            let newY = (y / height * 100)
            image.style.backgroundPosition = `${newx}% ${newY}%`;
        })
        image.addEventListener('mouseleave', function() {
            image.style.backgroundPosition = 'center';
            image.style.backgroundSize = '100%';
        })
    }
    zoomImage()
}
// shop . products - small & large
let productContainer = document.querySelector('.container-shop-products');
let filters = document.querySelectorAll("input[name='filter']");
filters.forEach(filter => {
    filter.addEventListener('change', function(e) {
        labels = document.querySelectorAll('label.label-fil');
        labels.forEach(l => l.classList.remove('active'));
        let label = document.querySelector(`label[for=${this.getAttribute('id')}]`);
        label.classList.add('active');
        productContainer.classList.toggle("large")
    })
})
// send contact form
const contac_form = document.getElementById('form-contact');
if (contac_form != null) {
    contac_form.addEventListener('submit', async (e) => {
        e.preventDefault();
        //const data = new FormData(contac_form)    
        const data = new URLSearchParams(new FormData(contac_form));
        const response = await fetch(`${base_url}api/account/send/`, {
            method: 'POST',
            body: JSON.stringify(data),
            headers: {
                'Content-Type': 'application/json'
            }
        }).then(res => res.json());
        console.log(data)
    })
}
//form search
const form_search = document.querySelectorAll('.form-search');
form_search.forEach((search) => {
    search.addEventListener('submit', function(e) {
        e.preventDefault();
        window.location.href = `${base_url}shop/products/${this[0].value}`;
    })
})