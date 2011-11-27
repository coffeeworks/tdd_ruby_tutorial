require './movie_catalog.rb'

describe MovieCatalog do
  it "has many movies" do
    catalog = MovieCatalog.new
    catalog.all.size.should == 250
  end
end
