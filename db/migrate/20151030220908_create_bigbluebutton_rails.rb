class CreateBigbluebuttonRails < ActiveRecord::Migration

  def self.up
    create_table :bigbluebutton_servers do |t|
      t.string :name
      t.string :url
      t.string :salt
      t.string :version
      t.string :param
      t.timestamps
    end

    create_table :bigbluebutton_rooms do |t|
      t.integer :server_id
      t.integer :owner_id
      t.string :owner_type
      t.string :meetingid
      t.string :name
      t.string :attendee_password
      t.string :moderator_password
      t.string :welcome_msg
      t.string :logout_url
      t.string :voice_bridge
      t.string :dial_number
      t.integer :max_participants
      t.boolean :private, :default => false
      t.boolean :external, :default => false
      t.string :param
      t.boolean :record, :default => false
      t.integer :duration, :default => 0
      t.timestamps
    end
    add_index :bigbluebutton_rooms, :server_id
    add_index :bigbluebutton_rooms, :meetingid, :unique => true
    add_index :bigbluebutton_rooms, :voice_bridge, :unique => true

    create_table :bigbluebutton_recordings do |t|
      t.integer :server_id
      t.integer :room_id
      t.string :recordid
      t.string :meetingid
      t.string :name
      t.boolean :published, :default => false
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :available, :default => true
      t.timestamps
    end
    add_index :bigbluebutton_recordings, :room_id
    add_index :bigbluebutton_recordings, :recordid, :unique => true

    create_table :bigbluebutton_metadata do |t|
      t.integer :owner_id
      t.string :owner_type
      t.string :name
      t.text :content
      t.timestamps
    end

    create_table :bigbluebutton_playback_formats do |t|
      t.integer :recording_id
      t.string :format_type
      t.string :url
      t.integer :length
      t.timestamps
    end
  end

  def self.down
    drop_table :bigbluebutton_playback_formats
    drop_table :bigbluebutton_metadata
    drop_table :bigbluebutton_recordings
    drop_table :bigbluebutton_rooms
    drop_table :bigbluebutton_servers
  end

end
