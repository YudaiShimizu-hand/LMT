class CreateChannelContents < ActiveRecord::Migration[7.0]
  def change
    create_table :channel_contents do |t|
      t.string :title, null:false
      t.text :content
      t.integer :flag, null:false
      t.boolean :emergency, default:false
      t.belongs_to :user, foreign_key: true
      t.belongs_to :channel, foreign_key: true
      t.timestamps
    end
  end
end
