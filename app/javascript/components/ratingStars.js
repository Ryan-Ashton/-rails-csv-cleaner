const initRatingStars = () => {
  if (window.location.pathname == '/dashboard') {
    const downloadIcon = document.querySelector('#download-icon');
    const tiles = tilesWrapper.querySelectorAll('.home-secondary-tile');
    const popUpTiles = tilesWrapper.querySelectorAll('.tile-body');

    tiles.forEach((tile) => {
      tile.addEventListener('click', (e) => {
        const id = e.currentTarget.dataset.id;
        if (id > 6) {
          document.documentElement.scrollTo({top: 150, behavior: 'smooth'});
        } else if (id > 3){
          document.documentElement.scrollTo({top: 120, behavior: 'smooth'});
        } else {
          document.documentElement.scrollTo({top: 0, behavior: 'smooth'});
        }

        const activeTile = document.querySelector('.home-secondary-tile.active');
        if (activeTile) {
          const activeIcon = activeTile.querySelector('.algorithm-icon.active')
          activeTile.classList.remove('active')
          activeIcon.classList.remove('active');
        }

        const activePopUp = document.querySelector('.tile-body.active');
        if (activePopUp) activePopUp.classList.remove('active');

        const currentTargetPopUp = document.querySelector(`#collapse-${id}`);
        if (activePopUp !== currentTargetPopUp){
          currentTargetPopUp.classList.toggle('active');
          tile.classList.toggle('active');
          tile.querySelector('.algorithm-icon').classList.toggle('active');
        }

      });
    });
  }
}

export { initClickedTile };
