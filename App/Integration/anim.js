const links = document.querySelectorAll('.navigation-headerUl li');

let prevElement = null

links.forEach(link => {
  link.addEventListener('click', (e) => {
    e.preventDefault();
    let currentClicked = e.target;
    
    if(prevElement && prevElement !== currentClicked){
      prevElement.classList.remove('isclick');
    }

    currentClicked.classList.add('isclick');
    prevElement = currentClicked;

  });
});
