const modalItems = document.querySelectorAll('.menu__item--js');
const modalCrosses = document.querySelectorAll('.modal-close');
const modalBgs = document.querySelectorAll('.modal-bckg');
const modals = document.querySelectorAll('.modal-vw');
const orderForms = document.querySelectorAll('.order-form');

modalItems.forEach((item) => {
    item.addEventListener('click', (event) => {
        const itemId = event.currentTarget.classList[2];
        const modalBg = document.querySelector(`.modal-bckg-${itemId}`);
        const form = modalBg.getElementsByClassName("order-form")[0];
        modalBg.classList.add('bckg-active');
        form.action = `/menu_items/${itemId}/order_items`;
      });
})

modalCrosses.forEach((cross) => {
    cross.addEventListener('click', () => {
        modalBgs.forEach((background) => {
            background.classList.remove('bckg-active');
        })
    })
})

orderForms.forEach((form) => {
    form.addEventListener("ajax:success", (event) => {
        form.reset();
        modalBgs.forEach((background) => {
            background.classList.remove('bckg-active');
        })
    })
})

//   item.addEventListener("ajax:error", (event) => {
    
//   });

// modals.forEach((modal) => {
//     modal.addEventListener('click', (event) => {
//         event.preventDefault();
//         event.stopPropagation();
//         event.stopImmediatePropagation();
//         return false;
//     })
// })