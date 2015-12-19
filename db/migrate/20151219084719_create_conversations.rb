class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.text :theme
      t.belongs_to :sender_crafter, :class_name => 'Crafter',:foreign_key => 'id'
      t.belongs_to :receiver_crafter, :class_name => 'Crafter',:foreign_key => 'id'
      t.belongs_to :sender_user, :class_name => 'User',:foreign_key => 'id'
      t.belongs_to :receiver_user, :class_name => 'User',:foreign_key => 'id'
      t.timestamps
    end
  end
end
