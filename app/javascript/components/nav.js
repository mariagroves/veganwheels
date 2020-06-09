const navToggle = document.querySelector('.navigation__toggle')
const mainNav = document.querySelector('.navigation')
const navLinks = document.querySelector('.navigation__links')

navToggle.addEventListener('click',  () => {
    mainNav.classList.toggle('nav-mobile');
    navLinks.classList.toggle('active');
    navToggle.classList.toggle('twist');
});