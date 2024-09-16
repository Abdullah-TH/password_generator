import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  connect() {
    this.element.addEventListener("turbo:submit-end", this.remove.bind(this));
  }

  remove(event) {
    // Check if the form submission was successful (HTTP status code 200)
    if (event.detail.success) {
      this.element.remove()
    }
  }

  removeNow() {
    this.element.remove()
  }
}