import { Controller } from "@hotwired/stimulus";
import Swup from 'swup';


// Connects to data-controller="swup"
export default class extends Controller {
  connect() {
    const swup = new Swup();
  }
}
