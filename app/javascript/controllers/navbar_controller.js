import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["navbar", "navcontent", "burgerbutton"];
  static values = {
    lastScrollTop: Number,
    timer: Number,
  };

  connect() {
    this.lastScrollTopValue = 0;
    this.timerValue = null;
    let burgerButton = document.querySelector("#hamburger");

    window.addEventListener("scroll", this.handleScroll.bind(this));
    window.addEventListener("mousemove", this.handleMousemove.bind(this));
    window.addEventListener("resize", this.initialMenu.bind(this));
    burgerButton.addEventListener(
      "click",
      this.clickBurger.bind(this.burgerButton)
    );
  }

  handleScroll() {
    const currentScroll = window.scrollY || document.documentElement.scrollTop;


    if (currentScroll > this.lastScrollTopValue) {
      // Scroll down
      this.navbarTarget.classList.add("hidden");
      this.navcontentTarget.classList.add("hidden");

    } else {
      // Scroll up
      this.navbarTarget.classList.remove("hidden");
      this.navcontentTarget.classList.remove("hidden");
    }

    if (this.timerValue) {
      clearTimeout(this.timerValue);
    }

    this.timerValue = setTimeout(() => {
      if (window.scrollY > 50) {
        this.navbarTarget.classList.add("hidden");
        this.navcontentTarget.classList.add("hidden");
      }
    }, 2500);
  }

  handleMousemove(e) {
    if (e.clientY <= 100) {
      this.navbarTarget.classList.remove("hidden");
      this.navcontentTarget.classList.remove("hidden");
    }
  }

  // Comportamento do menu hamburger

  clickBurger() {
    const maxWidth = 1200;
    const mediaQueryList = window.matchMedia(`(max-width: ${maxWidth}px)`);

    let burgerButton = document.querySelector("#hamburger");
    let menuColapso = document.querySelector(".menu");

    if (mediaQueryList.matches) {
      if (burgerButton && menuColapso.classList.contains("menu-entrance")) {
        menuColapso.classList.add("menu-exit");
        menuColapso.classList.remove("menu-entrance");
      } else {
        menuColapso.classList.remove("menu-exit");
        menuColapso.classList.add("menu-entrance");
      }

      if (burgerButton.classList.contains("fechado")) {
        burgerButton.classList.remove("fechado");
        burgerButton.classList.add("aberto");

        menuColapso.classList.remove("menu-off");
        menuColapso.classList.add("menu-on");
      } else {
        burgerButton.classList.remove("aberto");
        burgerButton.classList.add("fechado");
      }
    }
  }

  initialMenu() {
    let menuColapso = document.querySelector(".menu");

    const minWidth = 1200;
    const mediaQueryList = window.matchMedia(`(min-width: ${minWidth}px)`);

    if (mediaQueryList.matches) {
      menuColapso.classList.remove("menu-on");
      menuColapso.classList.add("menu-initial");
      menuColapso.classList.remove("menu-entrance");
    } else {
      menuColapso.classList.add("menu-on");
      menuColapso.classList.remove("menu-initial");
    }
  }
}
