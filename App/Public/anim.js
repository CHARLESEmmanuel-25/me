const links = document.querySelectorAll('.navigation-headerUl li a');  
const mobileLinks = document.querySelectorAll('.linkMobile');

let prevElement = null;

// Gestion des liens de navigation (desktop)
links.forEach(link => {
  link.addEventListener('click', (e) => {
    e.preventDefault();  

    let currentClicked = e.target;

    // Gère l'ajout de la classe 'isclick' pour l'élément actuel
    if (prevElement && prevElement !== currentClicked) {
      prevElement.classList.remove('isclick');
    }

    currentClicked.classList.add('isclick');
    prevElement = currentClicked;

    // Ajoute un délai avant de rediriger vers le lien
    setTimeout(() => {
      window.location.href = currentClicked.href;  // Redirection vers l'URL du lien cliqué
    }, 150);  // Attente de 150 ms pour l'effet visuel
  });
});

// Gestion des liens dans le menu mobile
mobileLinks.forEach(mobileLink => {
  mobileLink.addEventListener('click', (e) => {
    e.preventDefault();  // Empêche la redirection immédiate

    let currentClicked = e.currentTarget;

    // Ajoute la classe 'pink' pour l'élément actuel
    if (prevElement && prevElement !== currentClicked) {
      prevElement.classList.remove('pink');
    }

    currentClicked.classList.add('pink');
    prevElement = currentClicked;

    // Redirection manuelle après une courte attente
    setTimeout(() => {
      window.location.href = currentClicked.href;
    }, 150);  // Attente de 150 ms pour l'effet visuel
  });
});
