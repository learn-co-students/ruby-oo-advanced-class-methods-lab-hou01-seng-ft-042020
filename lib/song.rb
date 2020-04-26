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
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.find {|obj| obj.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}.uniq
  end

  def self.new_from_filename(file_name)
    song = Song.new
    file = file_name.split("-")
    song.name = file[1].gsub(".mp3", "").strip
    song.artist_name = file[0].strip
    song
  end

  def self.create_from_filename(file_name)
    song = self.create
    file = file_name.split("-")
    song.name = file[1].gsub(".mp3", "").strip
    song.artist_name = file[0].strip
    song
  end

  def self.destroy_all
    @@all.clear
  end
        
  



end
