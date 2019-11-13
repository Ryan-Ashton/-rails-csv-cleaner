const initRatingSwitch = () => {
  if (window.location.pathname == '/dashboard') {
    const downloadIcon = document.querySelector('#download-icon');
    if (downloadIcon) {
      downloadIcon.addEventListener('click', (e) => {
        const ratingJS = document.querySelector('#rating-js');

        ratingJS.classList.remove('d-none');
        downloadIcon.classList.add('d-none')
      });
    }
  }
}

export { initRatingSwitch };
