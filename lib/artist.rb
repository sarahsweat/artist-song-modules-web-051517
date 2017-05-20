require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  extend Memorable::ClassMethods, Findable
  include Paramable, Memorable::InstanceMethods

  @@artists = []

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self unless song.artist
  end

  def initialize
    super
    @songs = []
  end
  
  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

end
