class Crafter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  belongs_to :subcategory

  mount_uploader :avatar, CrafterAvatarUploader
  # mount_uploaders :images, CrafterAlbumLogoUploader

  has_many :albums

  after_update :send_email_to_crafter_after_checked, if: :check_changed?

  def unread_messages
    conversations = Conversation.where('sender_crafter_id=? OR receiver_crafter_id=?', id, id)
    count_messages = 0
    conversations.each{ |conversation|
      conversation.messages.each{|message|
        if message.receiver_crafter_id == id
          count_messages=count_messages+1 unless message.read
        end
      }
    }
    count_messages
  end

  private

  def send_email_to_crafter_after_checked
    if check == true
      AdminMailer.successful_checked(email).deliver
    else
      AdminMailer.fail_checked(email).deliver
    end
  end

end
