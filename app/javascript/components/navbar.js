// app/javascript/components/navbar.js
const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const navLink = document.querySelectorAll('.nav-link');
  // console.log(navLink)

  window.addEventListener('scroll', () => {
    if (window.scrollY >= window.innerHeight*0.1) {
      navbar.classList.add('navbar-lewagon-white');
    } else {
      navbar.classList.remove('navbar-lewagon-white');
    }
  });
}

export { initUpdateNavbarOnScroll };
