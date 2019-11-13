import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initParticle } from '../components/initParticle';
import { initClickedTile } from '../components/tiles';
import { rowsChart, uploadsChart, algoChart } from '../components/charts';
import $ from 'jquery';


window.$ = $;
initUpdateNavbarOnScroll();
initParticle();
initClickedTile();
