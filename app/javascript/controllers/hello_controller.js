import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["transition"]

  connect() {
    console.log(this.transitionTarget.classList);
    if (!this.transitionTarget.classList.contains("page-transition")) {
      document.addEventListener("ready turbo:load", () => {
        this.transitionTarget.classList.add("page-transition")
        console.log("animation de transition de page en cours...")
      })
    }
  }
}
