require './movie_catalog.rb'

describe MovieCatalog do
  before(:each) do
    @catalog = MovieCatalog.new
  end
  
  it "has many movies" do
    @catalog.all.size.should == 250
  end

  it "returns movies by year" do
    movies_from_1990 = @catalog.by_year(1990)
    movies_from_1990.should_not be_empty
    movies_from_1990.all?{|movie| movie.year == 1990}.should be_true

    movies_from_1991 = @catalog.by_year(1991)
    movies_from_1991.should_not be_empty
    movies_from_1991.all?{|movie| movie.year == 1991}.should be_true
  end

  it "returns top10 movies" do
    top10 = @catalog.top10
    top10.size.should == 10

    top10.first.title.should ==  "The Shawshank Redemption (1994)"
    top10.last.title.should == "Star Wars: Episode V - The Empire Strikes Back (1980)"
  end

  it "counts movies by year" do
    counts = @catalog.counts_by_year

    counts.is_a?(Hash).should be_true
    counts.keys.size.should == 80

    counts[1995].should == 7
    counts[2005].should == 3
    counts[2010].should == 8
    counts[2012].should be_nil
  end
end
