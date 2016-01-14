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
    set_conversations
  end

  def show
    set_conversations
    @conversation = Conversation.find_by_id params[:id]
    @messages = @conversation.messages
    unless current_user.nil?
      # @user = User.find_by_id @conversation.sender_user_id
      @messages.each { |message|
        if message.receiver_user_id == current_user.id
          message.read = true
          message.save!
        end
      }
    end
    unless current_crafter.nil?
      @messages.each { |message|
        if message.receiver_crafter_id == current_crafter.id
          message.read = true
          message.save!
        end
      }
    end
  end

  def add_message
    conversation = Conversation.find_by_id params[:id]
    message = conversation.messages.build
    message.body = params[:message]
    message.conversation_id = params[:id]
    unless current_user.nil?
      message.sender_user_id = params[:conversation_user_id]
      message.receiver_crafter_id = params[:conversation_crafter_id]
    end
    unless current_crafter.nil?
      message.receiver_user_id = params[:conversation_user_id]
      message.sender_crafter_id = params[:conversation_crafter_id]
    end
    message.save!
    @messages = conversation.messages
  end

  private

  def set_conversations
    unless current_user.nil?
      @conversations = Conversation.where sender_user_id: current_user.id
      @unread_messages = current_user.unread_messages
    end
    unless current_crafter.nil?
      @conversations = Conversation.where receiver_crafter_id: current_crafter.id
      @unread_messages = current_crafter.unread_messages
    end
  end


end
