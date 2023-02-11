import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  connect() {
    console.log('recibido!')
    createConsumer().subscriptions.create({ channel: "ProductChannel", room: this.element.dataset.productid }, {
      received(data) {
        console.log('recibido data!')
        console.log(data.action)
        if (data.action === "updated") {
          location.reload()
        }
      }
    })
  }
}