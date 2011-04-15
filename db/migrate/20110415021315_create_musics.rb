class CreateMusics < ActiveRecord::Migration
  def self.up
    create_table :musics do |t|
      t.string :title
      t.string :genre
      t.string :singer
      t.string :composer
      t.string :country
      t.integer :year
      t.timestamps
    end
  end

  def self.down
    drop_table :musics
  end
end
