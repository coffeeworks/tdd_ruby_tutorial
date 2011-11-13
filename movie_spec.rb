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

  it "accepts hash for available formats" do
    movie = Movie.new("Life Aquatic")
    movie.vhs?.should be_false
    movie.dvd?.should be_false
    movie.bluray?.should be_false

    movie = Movie.new("Life Aquatic", {vhs: true})
    movie.vhs?.should be_true
    movie.dvd?.should be_false
    movie.bluray?.should be_false

    movie = Movie.new("Life Aquatic", {dvd: true, bluray: true, year: 2004})
    movie.vhs?.should be_false
    movie.dvd?.should be_true
    movie.bluray?.should be_true
  end

  it "returns title and formats info" do
    movie = Movie.new("Life Aquatic", {dvd: true})
    movie.info.should == "Life Aquatic. Available in: DVD"

    movie = Movie.new("Life Aquatic", {vhs: true, dvd: true, bluray: true})
    movie.info.should == "Life Aquatic. Available in: VHS, DVD, Blu-ray"

    movie = Movie.new("Life Aquatic")
    movie.info.should == "Life Aquatic. Not available"
  end

  it "allows rating from 1 to 5" do
    movie = Movie.new("Life Aquatic")

    movie.rating.should be_nil

    movie.rate(4)
    movie.rating.should == 4

    movie.rate(10)
    movie.rating.should == 5

    movie.rate(-2)
    movie.rating.should == 1
  end
  
  it "shows rating as: Bad, Good, Excelent" do
    movie = Movie.new("Life Aquatic")

    movie.in_one_word.should == "Unknown"

    movie.rate(1)
    movie.in_one_word.should == "Bad"

    movie.rate(2)
    movie.in_one_word.should == "Bad"

    movie.rate(3)
    movie.in_one_word.should == "Good"

    movie.rate(4)
    movie.in_one_word.should == "Good"

    movie.rate(5)
    movie.in_one_word.should == "Excelent"

    # Tip: Use a case statement
  end

end
