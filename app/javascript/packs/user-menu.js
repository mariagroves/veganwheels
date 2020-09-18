const navSection = document.getElementById('user_icon');

navSection.addEventListener("click", () => {
    let userMenu = document.querySelector('#user_icon #user_menu');
    
    if (document.querySelectorAll('#user_icon #user_menu').length != 0) {
        if (userMenu.style.display === "none") {
            userMenu.style.display = "block";
        } else {
            userMenu.style.display = "none";
        }
    };
})