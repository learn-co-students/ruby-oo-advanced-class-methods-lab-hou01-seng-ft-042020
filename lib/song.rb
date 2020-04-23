class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.new_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = Song.new
    new_song.name = song_name
    new_song.save
    return new_song
  end

  def self.find_by_name(song_name)
    @@all.each do |song|
      if song.name == song_name
        return song
      end
    end
    return nil
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name) == nil
      self.create_by_name(song_name)
    else
      self.find_by_name(song_name)
    end

  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(string)
    array = string.split(" - ")
    name = array[1].gsub(".mp3","")
    song = self.create
    song.name = name
    song.artist_name = array[0]
    song
  end

  def self.create_from_filename(string)
    array = string.split(" - ")
    name = array[1].gsub(".mp3","")
    song = self.create
    song.name = name
    song.artist_name = array[0]
    song
  end

  def self.destroy_all
    self.all.clear
  end





end
