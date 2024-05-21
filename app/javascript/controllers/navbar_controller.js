import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {

  static targets = ["navbar", "navcontent"];
  static values = {
      lastScrollTop: Number,
      timer: Number
  }

  connect() {

    console.log("oi")
    this.lastScrollTopValue = 0;
    this.timerValue = null;

    window.addEventListener('scroll', this.handleScroll.bind(this));
    window.addEventListener('mousemove', this.handleMousemove.bind(this));
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
    }, 5000);

    // this.lastScrollTopValue = currentScroll <= 0 ? 0 : currentScroll;
  }

  handleMousemove(e) {
    if (e.clientY <= 100) {
        this.navbarTarget.classList.remove('hidden');
        this.navcontentTarget.classList.remove('hidden');
    }
  }

}
