import consumer from "./consumer"

if (location.pathname.match(/\/spots\/\d/)) {

  consumer.subscriptions.create({
    channel: "CommentChannel",
    spot_id: location.pathname.match(/\d+/)[0]
  }, {

    connected() {
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // Called when there's incoming data on the websocket for this channel
      const html = `
      <p class = 'comment'>
      <span>${data.user.name}:</span>
      <span>${data.comment.text}</span>
      <span class='comment-time'>たった今</span>
      </p>`

      const comments = document.getElementById('comments')
      comments.insertAdjacentHTML('beforeend', html)
      const commentForm = document.getElementById('comment-form')
      commentForm.reset();
    }
  })
}