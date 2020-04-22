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
    song
  end
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    song = self.find_by_name(name)
    if song == nil
      song = self.create_by_name(name)
    else
      song 
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(filename)
    separate = filename.split(" - ")
    song_artist = separate[0]
    song_name = separate[1].gsub(".mp3", "")
    song = self.new
    song.name = song_name
    song.artist_name = song_artist
    song
  end
 
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all = []
  end
end