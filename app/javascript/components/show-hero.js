const infoBox = document.querySelector('.info-box');
const showCard = document.querySelector('.show-card');
const height = infoBox.offsetHeight;

function imageSize(x) {
    if (x.matches) { // If media query matches
        showCard.style.height="200px";
    } else {
        showCard.style.height=`${height}px`;
    }
  }
  
  const mq = window.matchMedia("(max-width: 61.9375em)");
  imageSize(mq) // Call listener function at run time
  mq.addListener(imageSize) // Attach listener function on state changes