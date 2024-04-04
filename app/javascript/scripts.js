document.addEventListener('DOMContentLoaded', function() {
  const toggleResponsiveLinks = () => {
    const linksNavbar = document.querySelector('.links-navbar');
    if (window.innerWidth < 576) {
      linksNavbar.classList.add('responsive-links');
    } else {
      linksNavbar.classList.remove('responsive-links');
    }
  };

  toggleResponsiveLinks(); // Chama a função ao carregar a página
  window.addEventListener('resize', toggleResponsiveLinks); // Chama a função quando a janela for redimensionada
});
