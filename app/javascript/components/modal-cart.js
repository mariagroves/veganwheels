const navSection = document.getElementById('nav_section');
const modalBg = document.getElementsByClassName('modal-cart')[0];
navSection.addEventListener("click", () => {
    if (document.querySelectorAll('#nav_section .nav_cart').length != 0) {
        modalBg.classList.add('bckg-active');
        const modalCancelButton = document.getElementById('cart-modal-close');
        modalCancelButton.addEventListener('click', () => {
            modalBg.classList.remove('bckg-active');
        })
    };
})