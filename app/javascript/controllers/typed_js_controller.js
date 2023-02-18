import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ['Équipements en veille inutilement ?',
               'Vous privilegez les modes eco ?'],
      typeSpeed: 70,
      loop: true
    })
  }
}
