[![Code Climate](https://codeclimate.com/github/elenagarrone/bookmark_manager/badges/gpa.svg)](https://codeclimate.com/github/elenagarrone/bookmark_manager)
[![Test Coverage](https://codeclimate.com/github/elenagarrone/bookmark_manager/badges/coverage.svg)](https://codeclimate.com/github/elenagarrone/bookmark_manager)

Bookmark manager
================

During week four we built a bookmark manager, similar to pineapple.io or delicious.com in spirit. A bookmark manager is a good use case for exploring how relational databases work.
<img src='http://i59.tinypic.com/sgr32w.jpg'>
<img src='http://i58.tinypic.com/33o5j42.jpg'>
<img src='http://i61.tinypic.com/154fyph.jpg'>
<img src='http://i61.tinypic.com/2ywzali.jpg'>

Technologies:
------------
- Ruby
- Rspec
- Cucumber
- Capybara
- Sinatra
- PSQL and Postgres
- BCrypt
- DataMapper
- HTML/CSS

On Heroku:
---------

######It's a work in progress but you can have a look at it here:
https://elenabookmarkmanager.herokuapp.com/

To do:
-----
- [ ] request for new password;
- [ ] password token should be sent by email;

How to use:
----------
Clone the repo:
```shell
$ git clone https://github.com/elenagarrone/bookmark_manager.git
```
Change into the directory:
```shell
$ cd bookmark_manager
```
Install the gems:
```shell
$ bundle install
```
Try it on localhost:
```shell
$ rackup
#then on the browser go to:
localhost:9292
```

How to test it:
--------------
From inside the directory run:
```shell
$ rspec
```
