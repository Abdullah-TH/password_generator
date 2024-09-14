import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="passwords"
export default class extends Controller {
  static targets = ["generatedPasswordTextField", "savePasswordButton"]
  connect() {
    console.log("Connected")
  }

  generatedPasswordTextFieldValueChanged() {
    var isEmpty = this.generatedPasswordTextFieldTarget.value == ""
    this.savePasswordButtonTarget.disabled = isEmpty
    this.savePasswordButtonTarget.classList.toggle("opacity-50", isEmpty)
  }
}
