class Movie
  def initialize(title, params = {})
    @title = title
    @year = params[:year]
    @rating = params[:rating]
  end

  def title
    str = @title
    str << " (#{self.year})" if @year
    str
  end

  def year
    @year
  end

  def rating
    @rating
  end

  def released_years_ago
    return unless @year

    Time.now.year - @year
  end
end

