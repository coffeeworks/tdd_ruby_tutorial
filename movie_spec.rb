require './movie.rb'

describe Movie do
  it "returns its title" do
    movie = Movie.new("Life Aquatic")
    movie.title.should == "Life Aquatic"
  end

  it "accepts args for available formats" do
    movie = Movie.new("Life Aquatic")
    movie.vhs?.should be_false
    movie.dvd?.should be_false
    movie.bluray?.should be_false

    movie = Movie.new("Life Aquatic", true, false, false)
    movie.vhs?.should be_true
    movie.dvd?.should be_false
    movie.bluray?.should be_false
  
    movie = Movie.new("Life Aquatic", false, true, true)
    movie.vhs?.should be_false
    movie.dvd?.should be_true
    movie.bluray?.should be_true
  end

  it "returns title and formats info" do
    movie = Movie.new("Life Aquatic", false, true, false)    
    movie.info.should == "Life Aquatic. Available in: DVD"

    movie = Movie.new("Life Aquatic", true, true, true)    
    movie.info.should == "Life Aquatic. Available in: VHS, DVD, Blu-ray"

    movie = Movie.new("Life Aquatic")
    movie.info.should == "Life Aquatic. Not available"
  end
end
