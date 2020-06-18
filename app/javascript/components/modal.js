const modalItems = document.querySelectorAll('.menu__item--js');
const modalCrosses = document.querySelectorAll('.modal-close');
const modalBgs = document.querySelectorAll('.modal-bckg');
const modals = document.querySelectorAll('.modal-vw');

modalItems.forEach((item) => {
    item.addEventListener('click', (event) => {
        const itemId = event.currentTarget.classList[2];
        const modalBg = document.querySelector(`.modal-bckg-${itemId}`);
        modalBg.classList.add('bckg-active');
      });
})

modalCrosses.forEach((cross) => {
    cross.addEventListener('click', () => {
        modalBgs.forEach((background) => {
            background.classList.remove('bckg-active');
        })
    })
})

modals.forEach((modal) => {
    modal.addEventListener('click', (event) => {
        event.preventDefault();
        event.stopPropagation();
        event.stopImmediatePropagation();
        return false;
    })
})

// modalBgs.forEach((background) => {
//     background.addEventListener('click', () => {
//         background.classList.remove('bckg-active');
//     })
// })