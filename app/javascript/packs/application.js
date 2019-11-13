import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initParticle } from '../components/initParticle';
import { initClickedTile } from '../components/tiles';
// import { rowsChart, uploadsChart, algoChart } from '../components/charts';
import $ from 'jquery';
import { initStarRating } from '../plugins/init_star_rating';
import { initRatingSwitch } from '../components/ratingSwitch';


window.$ = $;
initUpdateNavbarOnScroll();
initParticle();
initClickedTile();
initStarRating();
initRatingSwitch();
