import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="read-notifications"
export default class extends Controller {
  static values = { path: String }

  connect() {
    console.log(this.pathValue);
  }

  read(event) {
    event.preventDefault()
    console.log(this.pathValue.action)
    fetch(this.pathValue, {
      method: "PATCH",
      headers: { "Accept": "application/json" },
      body: { read: true }
    })
      .then(response => response.json())
      .then(data => {
        console.log(data);
      });
  }
}
