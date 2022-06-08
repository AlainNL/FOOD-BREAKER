import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counting"
export default class extends Controller {
  static targets = [ "participant" ]

  connect() {
    console.log("Counting")
  }

  increment() {
    let data = parseFloat(this.participantTarget.innerHTML) + 1
    this.participantTarget.innerHTML = data;
  }

  decrement() {
    let data = parseFloat(this.participantTarget.innerHTML)
    if (data > 1) {
      data -= 1;
      this.participantTarget.innerHTML = data;
    }
  }
}
