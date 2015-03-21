class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.text :name

      t.timestamps
    end
  end
end
