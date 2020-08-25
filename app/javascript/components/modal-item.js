const modalBg = document.getElementsByClassName('modal-item')[0];
if (document.body.contains(modalBg)) {
    modalBg.addEventListener('click', (e) => {
        const orderForm = e.currentTarget.querySelectorAll('#order-form')[0];
        if (orderForm) {
            orderForm.addEventListener('ajax:success', (event) => {
                modalBg.innerHTML = "";
                orderForm.reset();
                modalBg.classList.remove('bckg-active');
                successMessage();
            })
            orderForm.addEventListener('ajax:error', (event) => {
                errorMessage();
            })
        }
    })
    
    function successMessage() {
        swal({
        title: "Thanks!",
        text: "Your selection has been added to the basket.",
        icon: "success",
        buttons: false,
        timer: 1500
        });
    }
    function errorMessage() {
        swal({
        title: "Oops!",
        text: "Please try again.",
        icon: "error",
        buttons: false,
        timer: 1500
        });
    }
}



