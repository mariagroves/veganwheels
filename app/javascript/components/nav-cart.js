const navSection = document.getElementById('nav_section');

navSection.addEventListener("click", () => {
    let fullCart = document.querySelector('#nav_section #nav_cart--full');
    if (document.querySelectorAll('#nav_section .nav_cart').length != 0) {
        if (fullCart.style.display === "none") {
            fullCart.style.display = "block";
        } else {
            fullCart.style.display = "none";
        }
    };
})
