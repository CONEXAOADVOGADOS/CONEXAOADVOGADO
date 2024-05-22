import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  static targets = ["navbar", "navcontent", "burgerbutton"];
  static values = {
      lastScrollTop: Number,
      timer: Number
  }

  connect() {

    console.log("oi")
    this.lastScrollTopValue = 0;
    this.timerValue = null;
    let burgerButton = document.querySelector("#hamburger")

    window.addEventListener('scroll', this.handleScroll.bind(this));
    window.addEventListener('mousemove', this.handleMousemove.bind(this));
    burgerButton.addEventListener('click', this.clickBurger.bind(this.burgerButton));
  }

  handleScroll() {
    const currentScroll = window.scrollY || document.documentElement.scrollTop;

    if (currentScroll > this.lastScrollTopValue) {
        // Scroll down
        this.navbarTarget.classList.add('hidden');
        this.navcontentTarget.classList.add('hidden');
    } else {
        // Scroll up
        this.navbarTarget.classList.remove('hidden');
        this.navcontentTarget.classList.remove('hidden');
    }

    if (this.timerValue) {
        clearTimeout(this.timerValue);
    }

    this.timerValue = setTimeout(() => {
        if (window.scrollY > 50) {
            this.navbarTarget.classList.add('hidden');
            this.navcontentTarget.classList.add('hidden');
        }
    }, 2500);


  }

  handleMousemove(e) {
    if (e.clientY <= 100) {
        this.navbarTarget.classList.remove('hidden');
        this.navcontentTarget.classList.remove('hidden');
    }
  }

  // comportamento do menu hamburger

  clickBurger() {

    const maxWidth = 1200;
    const mediaQueryList = window.matchMedia(`(max-width: ${maxWidth}px)`);

    let burgerButton = document.querySelector("#hamburger")
    let menuColapso = document.querySelector(".menu")

    if (mediaQueryList.matches) {

      if (burgerButton.classList.contains("fechado")) {

        burgerButton.classList.remove("fechado")
        burgerButton.classList.add("aberto")

        menuColapso.classList.remove("menu-off")
        menuColapso.classList.add("menu-on")

      } else {

        burgerButton.classList.remove("aberto")
        burgerButton.classList.add("fechado")

        menuColapso.classList.remove("menu-on")
        menuColapso.classList.add("menu-off")

      }

    }




  }

}
