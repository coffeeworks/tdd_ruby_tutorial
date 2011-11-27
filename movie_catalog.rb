require './movie'

class MovieCatalog
  def initialize
    load_movies
  end

  def all
    @movies
  end

  def by_year(year)
    self.all.select{|movie| movie.year == year}
  end

  def top10
    self.all.sort_by{|movie| -movie.rating}[0..9]
  end

  def counts_by_year
    counts = {}
    self.all.each do |movie|
      if counts[movie.year]
        counts[movie.year] += 1
      else
        counts[movie.year] = 1
      end
    end
    counts
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
