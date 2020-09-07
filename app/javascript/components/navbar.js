const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 50) {
        navbar.classList.add('navbar-lewagon-white');
      } else {
        navbar.classList.remove('navbar-lewagon-white');
      }
    });
  }
}

const noBadge = () => {
  const element = document.getElementById("noBadge");
  element.classList.remove("badge");
}

export { noBadge };
export { initUpdateNavbarOnScroll };
