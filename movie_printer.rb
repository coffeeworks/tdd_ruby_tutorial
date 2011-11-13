class MoviePrinter
  def initialize(movie, width = 40)
    @movie = movie
    @width = 40
  end

  def print_box
    str = ""

    str << self.border
    str << self.line(@movie.title, true)
    str << self.line("")
    str << self.line("Review: #{@movie.in_one_word}")
    str << self.line(@movie.availability)
    str << self.border

    str
  end

  def border
    str = "-" * @width
    str << "\n"
    str
  end

  def line(text, center = false)
    str = "|"
    extra = @width - 2 - text.length

    if center
      extra = @width - 2 - text.length
      left = extra / 2
      str << " " * left
      str << text
    else
      left = 2
      str << " " * left
      str << text
    end

    str << " " * (extra - left)
    str << "|\n"
  end
end
