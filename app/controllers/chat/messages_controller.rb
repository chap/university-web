class Chat::MessagesController < ApplicationController
  def create
    message = JSON.parse(params[:message])
    
    channel = ChatChannel.find_or_create_by_name(message["channel"])
    handle  = ChatHandle.find_or_create_by_name(message["handle"])
    
    chat_message = ChatMessage.create( :handle_id   => handle.id,
                                       :channel_id  => channel.id,
                                       :body        => message["body"],
                                       :recorded_at => message["recorded_at"])
                                       
    render :json => chat_message.to_json
  end
end