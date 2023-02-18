import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "card" ]

  disable() {
    this.element.closest('.card').classList.add('disabled');
    const checkbox = this.element.querySelector(`#disableCard-${this.element.dataset.taskId}`)
     checkbox.checked = !checkbox.checked
  }
}
