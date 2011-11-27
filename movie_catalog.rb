require './movie'

class MovieCatalog
  def initialize
    load_movies
  end

  def all
    @movies
  end

  protected

  def load_movies
    @movies = []

    File.open("./movies.csv", 'r') do |f|
      f.each_line do |line|
        cols = line.split(',')
        year = cols[0].to_i
        title = cols[1].gsub('"', '')
        rating = cols[2].to_f

        @movies << Movie.new(title, {year: year, rating: rating})
      end
    end
  end
end
