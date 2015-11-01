class BigbluebuttonRailsTo200B < ActiveRecord::Migration
  def self.up
    rename_column :bigbluebutton_rooms, :attendee_key, :attendee_key
    rename_column :bigbluebutton_rooms, :moderator_key, :moderator_key
    add_column :bigbluebutton_rooms, :moderator_api_password, :string
    add_column :bigbluebutton_rooms, :attendee_api_password, :string
  end

  def self.down
    rename_column :bigbluebutton_rooms, :attendee_key, :attendee_key
    rename_column :bigbluebutton_rooms, :moderator_key, :moderator_key
    remove_column :bigbluebutton_rooms, :moderator_api_password
    remove_column :bigbluebutton_rooms, :attendee_api_password
  end
end
