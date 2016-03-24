class AddSpeakerToChats < ActiveRecord::Migration
  def change
    add_column :chats, :speaker_id, :integer
  end
end
