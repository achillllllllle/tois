import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

// Connects to data-controller="post-form"
export default class extends Controller {
  static targets = ["selectInput", "newToiForm"]

  connect() {
    this.buildSelect()
  }

  buildSelect() {
    const options = {
      create: this.createEvent.bind(this),
      onChange: this.itemSelected.bind(this)
    }
    new TomSelect(this.selectInputTarget, options)
  }

  createEvent(toiName) {
    this.newToiFormTarget.classList.remove('d-none')

    return {value:toiName,text:toiName}
  }

  itemSelected(value) {
    console.log('selected', value);
  }
}
