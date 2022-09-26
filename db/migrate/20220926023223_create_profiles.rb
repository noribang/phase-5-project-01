class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :firstname
      t.string :lastname
      t.string :email

      t.timestamps
    end
  end
end
