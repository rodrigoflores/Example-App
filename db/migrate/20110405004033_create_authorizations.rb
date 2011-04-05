class CreateAuthorizations < ActiveRecord::Migration
  def self.up
    create_table :authorizations do |t|
      t.string :provider
      t.string :uid
      t.string :full_name
      t.timestamps
    end
  end

  def self.down
    drop_table :authorizations
  end
end
