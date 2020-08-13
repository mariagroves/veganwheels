const addButtons = document.querySelectorAll('.add');
const subtractButtons = document.querySelectorAll('.subtract');


addButtons.forEach((button) => {
    button.addEventListener('click', ()=>{
        const amount = button.parentElement.childNodes[3].value
        const currentQuantity = parseInt(amount, 10)
        const newQuantity = currentQuantity + 1
        button.parentElement.childNodes[3].value = newQuantity;
    })
})

subtractButtons.forEach((button) => {
    button.addEventListener('click', ()=>{
        const amount = button.parentElement.childNodes[3].value
        const currentQuantity = parseInt(amount, 10)
        if (currentQuantity == 1) return
        const newQuantity = currentQuantity - 1
        button.parentElement.childNodes[3].value = newQuantity;
    })
})