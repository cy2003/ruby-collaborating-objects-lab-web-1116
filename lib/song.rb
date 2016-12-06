require 'pry'

class Song
  attr_accessor :name
  attr_reader :artist

  def initialize(name)
    @name = name
  end

  # def artist(name)
  #   artist = Artist.new(name)
  # end

  def artist=(artist)
    @artist = artist
    # @artist.add_song(self)
  end

  def artist_name(artist)
    self.artist = Artist.find_or_create_by_name(artist)

    @artist.add_song(self)
    #artist - is a string "Action Bronson"
  end

  # def artist
  #   self.artist = Artist.find_or_create_by_name(artist)
  #   artist.add_song(self)
  # end

  def self.new_by_filename(filename)
    artist_and_song = filename.split(/\ - /).take(2)
    artist_name = artist_and_song.first
    song_name = artist_and_song.last
    song = self.new(song_name)
    song.artist_name(artist_name)
    song
  end

end
