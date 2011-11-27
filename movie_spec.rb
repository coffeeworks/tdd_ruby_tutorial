require './movie.rb'

describe Movie do
  it "returns its title" do
    movie = Movie.new("Life Aquatic")
    movie.title.should == "Life Aquatic"
  end

  it "accepts an optional year" do
    movie = Movie.new("Groundhog Day", {year: 1993})
    movie.title.should == "Groundhog Day (1993)"
  end

  it "accepts an optional rating" do
    movie = Movie.new("Groundhog Day", {rating: 9.9})
    movie.rating.should == 9.9
  end

  it "returns the number of years since it was released" do
    Time.stub_chain(:now, :year).and_return(2011) # Time.now.year => 2011
    movie = Movie.new("Ghostbusters", {year: 1984})
    movie.released_years_ago.should == 27

    Time.stub_chain(:now, :year).and_return(2020) # Time.now.year => 2020
    movie = Movie.new("Ghostbusters", {year: 1984})
    movie.released_years_ago.should == 36

    movie = Movie.new("Ghostbusters")
    movie.released_years_ago.should be_nil
  end
end
