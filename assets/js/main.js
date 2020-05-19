let modal = document.querySelector(".modal")
let modalBody = document.querySelector(".modal-mody");
let body = document.body;

function openModal(element, action = '') {
    if (action != '') {
        modalBody.innerHTML = element;
        addEvents()
    }
    body.classList.add("open-modal")
}

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
        body.classList.remove("open-modal")
    }
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
        image.addEventListener('mousemove', function(e) {
            let width = image.offsetWidth;
            let height = image.offsetHeight;
            let x = e.offsetX;
            let y = e.offsetY;
            let newx = (x / width * 100)
            let newY = (y / height * 100)
            image.style.backgroundPosition = `${newx}% ${newY}%`;
        })
        image.addEventListener('mosueleave', function() {
            image.style.backgroundPosition = 'center';
            image.style.backgroundSize = '100%';
        })
    }
    //zoomImage()
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