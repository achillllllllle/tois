import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="bookmark"
export default class extends Controller {
  static targets = ["icon"]

  connect() {
    console.log("Hello");
  }

  toggle(event) {
    event.preventDefault()
    console.log(event.currentTarget.href);
    console.log(event.currentTarget.dataset.turboMethod);

    const url = event.currentTarget.href
    const action = event.currentTarget.dataset.turboMethod
    const options = {
      method: action === "post" ? "POST" : "DELETE",
      headers: {
        "Accept": "application/json",
        "X-CSRF-Token": this.csrfToken()
      }
    }

    fetch(url, options)
    .then(response => response.json())
    .then((data) => {
      console.log(data);
      this.updateIcon(data.saved)
    })
  }

  updateIcon(saved) {
    if (saved) {
      this.iconTarget.classList.remove("far")
      this.iconTarget.classList.add("fas")
    } else {
      this.iconTarget.classList.remove("fas")
      this.iconTarget.classList.add("far")
    }
  }

  csrfToken() {
    return document.querySelector('meta[name="csrf-token"]').getAttribute('content')
  }
}
