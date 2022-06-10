import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]
  static values = { position: String, eventId: Number }
  connect() {
    this.csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute("content")
  }
  send(event) {
    event.preventDefault();
    console.log(this.formTarget);

    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": this.csrfToken },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
        if (data.inserted_item) {
          const reviewsContainer = document.querySelector(`#modal-${this.eventIdValue} .reviews`);
          if (reviewsContainer) reviewsContainer.insertAdjacentHTML('beforeend', data.inserted_item)
          // this.itemsTarget.insertAdjacentHTML(this.positionValue, data.inserted_item)
        }
        this.formTarget.outerHTML = data.form
      })
  }
}
