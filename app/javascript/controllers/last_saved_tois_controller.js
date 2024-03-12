import { Controller } from "@hotwired/stimulus"

// data-controller="last-saved-tois"
export default class extends Controller {
  static targets = ["lastSavings"];

  update(event) {
    let savedToisUrl = this.data.get("url");

    fetch(savedToisUrl)
      .then(response => response.text())
      .then(data => {
        this.lastSavingsTarget.innerHTML = data;
      });
  }
}
