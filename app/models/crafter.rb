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

  private

  def send_email_to_crafter_after_checked
    if check == true
      AdminMailer.successful_checked(email).deliver
    else
      AdminMailer.fail_checked(email).deliver
    end
  end

end
