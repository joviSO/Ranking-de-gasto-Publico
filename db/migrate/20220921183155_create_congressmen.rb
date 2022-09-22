class CreateCongressmen < ActiveRecord::Migration[6.1]
  def change
    create_table :congressmen do |t|

      t.string :name
      t.integer :registration_code
      t.string :state

      t.timestamps
    end
  end
end
  