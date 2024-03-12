import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "step1", "step2", "nextButton"]

  connect() {
    this.hideSteps()
    this.showStep(this.step1Target)
  }

  next() {
    event.preventDefault()
    this.hideSteps()
    this.showStep(this.step2Target)
  }

  hideSteps() {
    this.step1Target.classList.add('d-none')
    this.step2Target.classList.add('d-none')
  }

  showStep(step) {
    step.classList.remove('d-none')
  }
}
