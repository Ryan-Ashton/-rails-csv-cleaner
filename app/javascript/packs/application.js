import "bootstrap";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { initParticle } from '../components/initParticle';
import { initClickedTile } from '../components/tiles';
import $ from 'jquery';

window.$ = $;
initUpdateNavbarOnScroll();
initParticle();
initClickedTile();
