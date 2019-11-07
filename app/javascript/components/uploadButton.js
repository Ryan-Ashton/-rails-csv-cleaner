const initHoverUpload = () => {
  const uploadButtons = document.querySelectorAll('.upload');

  uploadButtons.forEach((button) => {
    const uploadIcon = document.querySelector('i');
    const uploadText = document.querySelector('p');

    button.addEventListener('mouseover', () => {
      tile.classList.active('text-white')
    });
  });
  // window.addEventListener('scroll', () => {
  //   if (window.scrollY >= window.innerHeight*0.05) {
  //     navbar.classList.add('navbar-lewagon-white');
  //   } else {
  //     navbar.classList.remove('navbar-lewagon-white');
  //   }
  // });
}

export { initHoverUpload };
