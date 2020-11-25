class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all 
        @@all
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end 

    # def self.find(name)
    #     @@all.find {|artist| artist.name = artist}
    # end

    def self.find_or_create_by_name(name)
        if self.all.find {|i| i.name == name}
           self.all.find {|i| i.name == name}
        else  
            self.new(name)
        end
    end 

    def print_songs
        Song.all.each {|i| puts i.name if i.artist == self}
    end
end 