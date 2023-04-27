import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loading"
export default class extends Controller {
  connect() {
  }

  loading(event) {
    console.log('loading')
    console.log(event.currentTarget)
    event.currentTarget.parentElement.innerHTML = "<div class='lds-ring'><div></div><div></div><div></div><div></div></div><h4 class='souffle'><br>L O A D I N G ...</h4></div>";
  }
}
