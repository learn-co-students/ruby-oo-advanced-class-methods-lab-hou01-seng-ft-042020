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
    song = self.new
    song.save
    song
  end 
 
  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find do |obj| 
      obj.name == name 
    end 
  end 

  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if !song 
      song = self.create_by_name(name)
    end 
    song
  end

  def self.alphabetical
    self.all.sort_by do |song| 
      song.name
    end.uniq
  end 

  def self.new_from_filename(file_name)
    name = file_name.split("-")[1].split(".")[0].strip
    song = self.new_by_name(name)
    song.artist_name = file_name.split("-")[0].strip
    song
  end 

  def self.create_from_filename(file_name)
    name = file_name.split("-")[1].split(".")[0].strip
    song = self.create_by_name(name)
    song.artist_name = file_name.split("-")[0].strip
    song
  end 

  def self.destroy_all
    self.all.clear
  end

end
