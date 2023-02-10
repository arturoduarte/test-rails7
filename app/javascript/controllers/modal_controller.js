import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["sidebar"]
  connect() {
    setTimeout(() => {
      this.sidebarTarget.classList.remove('translate-x-full')
      this.sidebarTarget.classList.add('translate-x-0')
    }, 50)

    this.element.addEventListener("turbo:submit-end", (event) => {
      // console.log(event.detail.fetchResponse)
      if (event.detail.success) {
        Turbo.visit(event.detail.fetchResponse.response.url)
      }
    })
  }

  close() {
    this.sidebarTarget.classList.remove('translate-x-0')
    this.sidebarTarget.classList.add('translate-x-full')
    // console.log(this.element)
    setTimeout(() => {
      this.element.parentElement.removeAttribute("src")
      // elimina el <div data-controller="modal"> que está en products/new.html.erb
      this.element.remove()
    }, 250)
  }
}