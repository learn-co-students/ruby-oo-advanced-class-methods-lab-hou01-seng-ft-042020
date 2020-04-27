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
   song = Song.new
   song.save
   song
 end

 def self.new_by_name(name)
  song = Song.new
  # binding.pry
  song.name = name
  # binding.pry
  song
 end

 def self.create_by_name(name)
  song = Song.new
  song.name = name
  song.save
  song
 end

 def self.find_by_name(name)
   Song.all.find {|song| song.name == name}
 end

 def self.find_or_create_by_name(name)
   found_song = Song.find_by_name(name)
   create_song = Song.create_by_name(name)
    if found_song
      found_song
    else
      create_song
    end
 end

 def self.alphabetical
  # Song.all.sort {|a,b| a.name<=>b.name}
    Song.all.sort_by {|song| song.name}
 end

 def self.new_from_filename(filename)
  split_filename = filename.split(/[-.]/,3)
  only_artist_name = split_filename[0].split.join(" ")
  only_song_name = split_filename[1].split.join(" ")
  # binding.pry
  # song = self.new(artist_name: only_artist_name, name: only_song_name)
  song = self.new
  song.artist_name = only_artist_name
  song.name = only_song_name
  song
 end


 def self.create_from_filename(filename)
  song = self.new_from_filename(filename)
  song.save

 end

 def self.destroy_all
  self.all.clear
 end
end
