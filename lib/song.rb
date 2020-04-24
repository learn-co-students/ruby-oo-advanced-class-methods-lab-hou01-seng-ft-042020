require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new   #create a variable, with a new instance of self(Song)
    #creates the variable so we may return it
    song.save   #store new instance into all/array
    
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end
    

  def self.create_by_name(name)
    song = self.create
    song.name = name
    return song
  end

  def self.find_by_name(name)
    self.all.detect{|x| x.name == name}
    #returns fasley if song name isnt found
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    #if find_by returned false, it moves on to create by
    #using or || means one or the other should be true
  end

  def self.alphabetical
    self.all.sort{|a,b| a.name <=> b.name}
  end

  def self.new_from_filename(song_file)
    song_file_array = song_file.split(" - ")
    song_artist = song_file_array[0]
    song_name = song_file_array[1].gsub(".mp3","")

    song = self.new
    song.name = song_name
    song.artist_name = song_artist
    return song
    # binding.pry
  end

  def self.create_from_filename(song_file)
    song_file_array = song_file.split(" - ")
    song_artist = song_file_array[0]
    song_name = song_file_array[1].gsub(".mp3","")

    song = self.create
    song.name = song_name
    song.artist_name = song_artist
    return song
    # binding.pry
  end

  def self.destroy_all
    self.all.clear
  end

end
