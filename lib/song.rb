require 'pry'
# a semantic API 


class Song
  attr_accessor :name, :artist_name
  @@all = []


  def self.create
    song_obj = Song.new
    Song.all << song_obj
    song_obj
  end 

  def self.new_by_name(song_name)
    song_obj = Song.new
    song_obj.name = song_name
    song_obj
  end 

  def self.create_by_name(song_name)
    song = self.new_by_name(song_name)
    self.all << song
    song 
  end 

  def self.find_by_name(song_name)
    #takes string
    #return matching object
    self.all.find do |song|
      song.name == song_name
    end 
  end

  def self.find_or_create_by_name(song_name)
    # return a matching song instance with that name 
    # or create a new song with the name 
    # and return the song instance.
    search = self.find_by_name(song_name)
    if search
      return search 
    else 
      return self.create_by_name(song_name)
    end 

  end 

  def self.alphabetical
    self.all.sort_by { |song| song.name[0]}
  end 

  def self.new_from_filename(file_name)
    # "Taylor Swift - Blank Space.mp3"
    # delimiter: - 
    #remove .mp3 part of string
    # artist_name = file_name.split(" - ")[0]
    name = file_name.split(" - ")[1].delete_suffix(".mp3")
    new_song = self.new_by_name(name)
    new_song.artist_name = file_name.split(" - ")[0]
    new_song

  end 


  def self.create_from_filename(file_name)
    # parse the filename correctly 
    # but should also save the Song instance that was created.
    self.new_from_filename(file_name).save
  end 

  def self.destroy_all
    self.all.clear
  end
  
  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

end
