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

    def self.new_by_name(name)
        song = self.new
        song.name = name
        song
    end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    songs = self.all.sort_by {|song| song.name}
    songs
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    array[1].slice!(".mp3")
    song = self.new
    song.artist_name = array[0]
    song.name = array[1]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
    song
  end
  
  def self.destroy_all
    self.all.clear
  end
end