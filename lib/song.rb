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
    self.all << song
    song
  end

  def self.new_by_name(str)
    song = self.new 
    song.name = str 
    song
  end

  def self.create_by_name(str)
    song = self.create 
    song.name = str 
    song
  end

  def self.find_by_name(str)
    song_name = self.all.detect{|song| song.name == str}
    song_name
  end

  def self.find_or_create_by_name(str)
    song_name = self.find_by_name(str)
    if song_name
      song_name
    else
      self.create_by_name(str)
    end
  end

  def self.alphabetical
    return @@all.sort_by {|str| str.name}
  end

  def self.new_from_filename(file_name)
    file = self.new 
    file.name = (file_name.split(" - ")[1].chomp(".mp3"))
    file.artist_name = (file_name.split(" - ")[0]) 
    @@all << file
    file   
  end

  def self.create_from_filename(tune)
    file = self.new
    file.name = (tune.split(" - ")[1].chomp(".mp3"))
    file.artist_name = (tune.split(" - ")[0]) 
    @@all << file
    file  
  end

  def self.destroy_all
    @@all.clear
  end
end





