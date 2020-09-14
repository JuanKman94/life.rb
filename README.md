# Conway's Game of Life

The Game of Life, also known simply as Life, is a cellular automaton devised
by the British mathematician John Horton Conway in 1970. The "game" is a
zero-player game, meaning that its evolution is determined by its initial
state, requiring no further input. One interacts with the Game of Life by
creating an initial configuration and observing how it evolves.

## Setup

```sh
# install dependencies
$ bundle

# run tests
$ bundle exec rake test

# run game
$ bundle exec rake run
```

## Rules

* Any living cell with fewer than two live neighbours dies, as if caused by
underpopulation.
* Any living cell with more than three live neighbours dies, as if by
overcrowding.
* Any living cell with two or three live neighbours lives on to the next
generation.
* Any dead cell with exactly three live neighbours becomes a live cell.

## Inspirations

* [eterry1388/ruby-game-of-life]: shamelessly based off of this great
implementation. There were others, but this seems just too elegant.

## TODO

* [x] lint code using [RuboCop]
* [x] add tests
* [ ] add output stream as a parameter to [Game#run](lib/game/game.rb)
(currently prints board during tests), see [fprintf(3p)]

[RuboCop]: https://rubocop.org/
[eterry1388/ruby-game-of-life]: https://github.com/eterry1388/ruby-game-of-life
[fprintf(3p)]: https://www.man7.org/linux/man-pages/man3/fprintf.3p.html
