  if (window.location.pathname == "/") {
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
};