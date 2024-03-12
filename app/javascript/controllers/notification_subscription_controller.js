import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification-subscription"
export default class extends Controller {
  static values = { userId: Number }
  static targets = ["notifContainer", "cpt"]

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.userIdIdValue },
      { received: (data) => {
        this.notifContainerTarget.insertAdjacentHTML("beforeend", data)
        this.cptTarget.innerText = parseInt(this.cptTarget.innerText) + 1
        this.cptTarget.classList.remove('d-none')
      }}
    )
    console.log(`Subscribe to notifications with the id ${this.userIdValue}.`)
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
