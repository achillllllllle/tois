import { Controller } from "@hotwired/stimulus"
import TomSelect from "tom-select"

// Connects to data-controller="post-form"
export default class extends Controller {
  static targets = ["selectInput", "newToiForm", "trailerInput", "locationInput"]

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

    // fetch(`/api/toi/${toiName}`)
    //   .then(response => response.json())
    //   .then(data => {
    //     // Assuming data contains the fields to prefill
    //     // You can adapt this part according to your API response
    //     this.newToiFormTarget.querySelector('[name="field_name"]').value = data.field_name;
    //     this.newToiFormTarget.querySelector('[name="field_description"]').value = data.field_description;
    //     // Pre-fill other fields as needed
    //   })

    if (toi.category === "cinema") {
      this.trailerInputTarget.classList.remove('d-none');
    } else {
      this.trailerInputTarget.classList.add('d-none');
    }

    if (toi.category === "spectacle") {
      this.locationInputTarget.classList.remove('d-none');
    } else {
      this.locationInputTarget.classList.add('d-none');
    }

    return { value:toiName, text:toiName }
  }

  itemSelected(value) {
    console.log('selected', value);

    // if (item.classList.contains("create")) {
    //   this.newToiFormTarget.classList.add("d-none");
    // }
  }
}
