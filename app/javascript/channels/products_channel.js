/*import consumer from "./consumer"

consumer.subscriptions.create("ProductsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected!")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data.html)
    document.querySelector(".store").innerHTML = data.html
    //document.querySelector("#cart").innerHTML = data.html
  }
});*/
