const navSection1 = document.getElementById('user_icon_1');
const navSection2 = document.getElementById('user_icon_2');

if (window.innerWidth < 1199) {
    
    navSection1.addEventListener("click", () => {
        let userMenu = document.querySelector('#user_icon_1 #user_menu');
        
        if (document.querySelectorAll('#user_icon_1 #user_menu').length != 0) {
            if (userMenu.style.display === "none") {
                userMenu.style.display = "block";
            } else {
                userMenu.style.display = "none";
            }
        };
    })

} else {
    console.log("else")
    navSection2.addEventListener("click", () => {
        let userMenu = document.querySelector('#user_icon_2 #user_menu');
        
        if (document.querySelectorAll('#user_icon_2 #user_menu').length != 0) {
            if (userMenu.style.display === "none") {
                userMenu.style.display = "block";
            } else {
                userMenu.style.display = "none";
            }
        };
    })
}

