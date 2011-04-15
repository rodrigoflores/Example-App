class MusicController < ApplicationController
  def british_songs_from_eighties
    @music = Music.british_from_eighties
  end
end
