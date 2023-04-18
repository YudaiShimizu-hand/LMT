class CreateChannelUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :channel_users do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :channel, foreign_key: true
      t.timestamps
    end
  end
end