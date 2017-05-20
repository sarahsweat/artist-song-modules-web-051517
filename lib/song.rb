require 'pry'

class Song
  attr_accessor :name, :artist
  extend Memorable::ClassMethods, Findable
  include Paramable, Memorable::InstanceMethods

  @@songs = []

  def self.all
    @@songs
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self) unless artist.songs.include?(self)
  end
end
