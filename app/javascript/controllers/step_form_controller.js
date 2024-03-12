import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "step1", "step1Bis", "step2", "nextButton"]

  connect() {
    this.hideSteps()
    this.showStep(this.step1Target)
  }

  next() {
    this.hideSteps()
    if (this.step1BisTarget.classList.contains('d-none')) {
      this.showStep(this.step1BisTarget)
    } else {
      this.showStep(this.step2Target)
    }
  }

  hideSteps() {
    this.step1Target.classList.add('d-none')
    this.step1BisTarget.classList.add('d-none')
    this.step2Target.classList.add('d-none')
  }

  showStep(step) {
    step.classList.remove('d-none')
  }
}
