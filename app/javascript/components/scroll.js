const buttonHero = document.querySelector('.scroll-hero');
const buttonFeatures = document.querySelector('.scroll-features');
buttonHero.addEventListener('click', (event) => {
  document.querySelector('.features').scrollIntoView({ 
    behavior: 'smooth' 
  });
});
buttonFeatures.addEventListener('click', (event) => {
  document.querySelector('.about').scrollIntoView({ 
    behavior: 'smooth' 
  });
});


// this function runs when the DOM is ready, i.e. when the document has been parsed
// document.addEventListener("DOMContentLoaded", function() { 
 
// });