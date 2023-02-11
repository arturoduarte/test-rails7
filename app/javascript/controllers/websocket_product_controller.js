// import { Controller } from "@hotwired/stimulus"
// import { createConsumer } from "@rails/actioncable";

// // lógica para conectarse desde el cliente al channel
// export default class extends Controller {
//   connect(){
//     // productid está en app/views/products/show.html.erb en data-productid
//     createConsumer().subscriptions.create({ channel: 'ProductChannel', room: this.element.dataset.productid }, {
//       received(data){
//         // console.log(data.action)
//         if(data.action == 'updated'){
//           // alert('refrescar')
//           location.reload()
//         }
//       }
//     })
//   }
// }

