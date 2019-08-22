const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  const other = document.querySelector('.navbar-other');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY) {
        navbar.classList.add('navbar-lewagon-white');
        other.classList.remove('navbar-hidden');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
        other.classList.add('navbar-hidden');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
