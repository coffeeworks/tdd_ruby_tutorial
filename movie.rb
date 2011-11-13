class Movie
  def initialize(title, vhs = false, dvd = false, bluray = false)
    @title = title
    @vhs = vhs
    @dvd = dvd
    @bluray = bluray
  end

  def title
    @title
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
end
