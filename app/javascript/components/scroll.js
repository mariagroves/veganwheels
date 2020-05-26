const button = document.querySelector('.fa-chevron-down');
button.addEventListener('click', (event) => {
  document.querySelector('.features').scrollIntoView({ 
    behavior: 'smooth' 
  });
});



// this function runs when the DOM is ready, i.e. when the document has been parsed
// document.addEventListener("DOMContentLoaded", function() { 
 
// });