class CreateUserDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_details do |t|
      t.belongs_to :user, foreign_key: true
      t.string :image
      t.string :company_name
      t.timestamps
    end
  end
end
