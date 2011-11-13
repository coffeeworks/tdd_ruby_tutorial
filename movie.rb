class Movie
  def initialize(title, params = {})
    @title = title
    @year = params[:year]
    @vhs = params[:vhs]
    @dvd = params[:dvd]
    @bluray = params[:bluray]
  end

  def title
    str = @title
    str << " (#{@year})" if @year
    str
  end

  def rate(stars)
    @rating = if stars < 1
      1
    elsif (1..5).member?(stars)
      stars
    else
      5
    end
  end

  def rating
    @rating
  end

  def in_one_word
    case @rating
      when 1..2
        "Bad"
      when 2..4
        "Good"
      when 5
        "Excelent"
      else
        "Unknown"
    end
  end

  def vhs?
    @vhs
  end

  def dvd?
    @dvd
  end
  
  def bluray?
    @bluray
  end

  def info
    "#{self.title}. #{self.availability}"
  end

  def formats
    f = []
    f << "VHS" if self.vhs?
    f << "DVD" if self.dvd?
    f << "Blu-ray" if self.bluray?
    f
  end

  def availability
    f = self.formats
    if f.empty?
      "Not available"
    else
      "Available in: #{f.join(', ')}"
    end
  end

  def released_years_ago
    return unless @year

    Time.now.year - @year
  end
end
