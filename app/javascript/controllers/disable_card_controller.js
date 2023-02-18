// import { Controller } from "@hotwired/stimulus";

// export default class extends Controller {
// static targets = ["card"];

// connect() {
// const checkbox = this.element.querySelector(#disableCard-${this.element.dataset.taskId});
// checkbox.addEventListener("change", () => {
//   if (!checkbox.checked) {
//     this.enable();
//   }
// });
// }

// enable() {
//   this.cardTarget.classList.remove("disabled");
// }

// get cardTarget() {
//   return this.targets.find((target) => target.classList.contains("card"));
// }
// }




import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "card" ]

  disable() {
    this.element.closest('.card').classList.add('disabled');
    const checkbox = this.element.querySelector(`#disableCard-${this.element.dataset.taskId}`)
     //checkbox.checked = !checkbox.checked
  }
}
