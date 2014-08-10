class WebSocket::CommentController < WebsocketRails::BaseController
  def create
    comment = Comment.new message
    if comment.save
      WebsocketRails[message[:slide_id]].trigger :new, message
    else
      send_message :create_fail, comment, namespace: :comments
    end
  end
end
