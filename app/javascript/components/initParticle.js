import "particles.js";

const initParticle = () => {
  const particleDiv = document.querySelector('#particles-js');
  if (particleDiv) {
    particlesJS.load('particles-js', './particles.json', function() {
      console.log('callback - particles.js config loaded');
    });
  }
}

export { initParticle };
