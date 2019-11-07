// Sequences
// 1. addEventListener to all tiles
// 2. When any tiles is clicked, remove class active from all tiles and pop-ups
// 3. Add class active to THAT tile, and its pairing pop-up
// 4. If the tile is already active, just remove the class WITHOUT adding.

const initClickedTile = () => {
  const tilesWrapper = document.querySelector('.tiles-wrapper');
  const tiles = tilesWrapper.querySelectorAll('.home-secondary-tile');
  const popUpTiles = tilesWrapper.querySelectorAll('.tile-body');

  tiles.forEach((tile) => {
    tile.addEventListener('click', (e) => {
      const id = e.currentTarget.dataset.id;
      if (id > 6) {
        document.documentElement.scrollTop = 110;
      } else {
        document.documentElement.scrollTop = 0;
      }

      const activeTile = document.querySelector('.home-secondary-tile.active');
      if (activeTile) activeTile.classList.remove('active');

      const activePopUp = document.querySelector('.tile-body.active');
      if (activePopUp) activePopUp.classList.remove('active');

      const currentTargetPopUp = document.querySelector(`#collapse-${id}`);
      if (activePopUp !== currentTargetPopUp){
        currentTargetPopUp.classList.toggle('active');
        tile.classList.toggle('active');
      }


    });
  });

}

export { initClickedTile };
