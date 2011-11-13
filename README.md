# Ruby Course - Day 1

## Installation
    rvm gemset create curso
    gem install bundler
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

