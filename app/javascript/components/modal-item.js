const modalBg = document.getElementsByClassName('modal-item')[0];
if (document.body.contains(modalBg)) {
    modalBg.addEventListener('click', (e) => {
        const orderForm = e.currentTarget.querySelectorAll('#order-form')[0];
        if (orderForm) {
            orderForm.addEventListener('ajax:success', (event) => {
                modalBg.innerHTML = "";
                orderForm.reset();
                modalBg.classList.remove('bckg-active');
            })
        }
    })
}



