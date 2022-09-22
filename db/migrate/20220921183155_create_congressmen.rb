class CreateCongressmen < ActiveRecord::Migration[6.1]
  def change
    create_table :congressmen do |t|

      t.string :name,                     null: false
      t.integer :registration_code,       null: false, unique: true
      t.string :state,                    null: false

      t.timestamps
    end
  end
end
