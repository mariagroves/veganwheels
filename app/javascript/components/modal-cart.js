const navSection1 = document.getElementById('nav_section_1');
const navSection2 = document.getElementById('nav_section_2');
const navSection3 = document.getElementById('nav_section_3');

const modalBg = document.getElementsByClassName('modal-cart')[0];

if (window.innerWidth > 575 && window.innerWidth <= 1199) {
    
    navSection1.addEventListener("click", () => {
        if (document.querySelectorAll('#nav_section_1 .nav_cart').length != 0) {
            modalBg.classList.add('bckg-active');
            const modalCancelButton = document.getElementById('cart-modal-close');
            modalCancelButton.addEventListener('click', () => {
                modalBg.classList.remove('bckg-active');
            })
        };
    })

} else if (window.innerWidth <= 575) {

    navSection3.addEventListener("click", () => {
        if (document.querySelectorAll('#nav_section_3 .nav_cart').length != 0) {
            modalBg.classList.add('bckg-active');
            const modalCancelButton = document.getElementById('cart-modal-close');
            modalCancelButton.addEventListener('click', () => {
                modalBg.classList.remove('bckg-active');
            })
        };
    })

} else {

    navSection2.addEventListener("click", () => {
        if (document.querySelectorAll('#nav_section_2 .nav_cart').length != 0) {
            modalBg.classList.add('bckg-active');
            const modalCancelButton = document.getElementById('cart-modal-close');
            modalCancelButton.addEventListener('click', () => {
                modalBg.classList.remove('bckg-active');
            })
        };
    })
}