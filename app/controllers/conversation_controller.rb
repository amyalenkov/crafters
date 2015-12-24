class ConversationController < ApplicationController

  def create
    conversation = Conversation.new
    conversation.theme = params[:theme]
    conversation.sender_user_id = params[:sender_user_id]
    conversation.receiver_crafter_id = params[:receiver_crafter_id]
    conversation.save!
    message = conversation.messages.build
    message.body = params[:message]
    message.sender_user_id = params[:sender_user_id]
    message.receiver_crafter_id = params[:receiver_crafter_id]
    message.save!
    render :nothing => "sdf"
  end

  def index
    unless current_user.nil?
      @conversations = Conversation.where sender_user_id: current_user.id
    end
    unless current_crafter.nil?
      @conversations = Conversation.where receiver_crafter_id: current_crafter.id
    end
  end

  def show
    @conversation = Conversation.find_by_id params[:id]
    @messages = @conversation.messages
  end

  def add_message
    conversation = Conversation.find_by_id params[:conversation_id]
    message = conversation.messages.build
    message.body = params[:message]
    message.conversation_id = params[:conversation_id]
    unless current_user.nil?
      message.sender_user_id = params[:conversation_user_id]
      message.receiver_crafter_id = params[:conversation_crafter_id]
    end
    unless current_crafter.nil?
      message.receiver_user_id = params[:conversation_user_id]
      message.sender_crafter_id = params[:conversation_crafter_id]
    end
    message.save!
    render :nothing => "sdf"
  end

end
