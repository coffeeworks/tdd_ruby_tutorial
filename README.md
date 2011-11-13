# Ruby Course - Day 1

## Getting Started

    git clone git://github.com/coffeeworks/tdd_ruby_tutorial.git
    cd tdd_ruby_tutorial
    gem install bundler
    rvm gemset create curso
    rvm gemset use curso
    bundle install

## Exercise 1

Checkout the spec1 tag

    git checkout -b implementation spec1

Implement the methods inside the class `Movie` in `movie.rb` according to the spec until it passes

    rspec movie_spec.rb

Commit the results

    git commit -am "Implementation for spec 1"

## Exercise 2

Update to the next version of the specs

    git cherry-pick spec2

Implement the new methods and refactor the code until it is all green again

    rspec movie_spec.rb

Commit the results

    git commit -am "Implementation for spec 2"

## Exercise 3

Update to the next version of the specs

    git cherry-pick spec3

Implement the new methods and refactor the code until it is all green again

    rspec movie_spec.rb

Commit the results

    git commit -am "Implementation for spec 3"

