[![Code Climate](https://codeclimate.com/github/elenagarrone/bookmark_manager/badges/gpa.svg)](https://codeclimate.com/github/elenagarrone/bookmark_manager)
[![Test Coverage](https://codeclimate.com/github/elenagarrone/bookmark_manager/badges/coverage.svg)](https://codeclimate.com/github/elenagarrone/bookmark_manager)

Bookmark manager
================

During week four we built a bookmark manager, similar to pineapple.io or delicious.com in spirit. A bookmark manager is a good use case for exploring how relational databases work.
<img src='public/images/home.png'>
<img src='public/images/sign_in1.png'>
<img src='public/images/sign_up.png'>
<img src='public/images/add_link.png'>

Technologies:
------------
- Ruby
- Rspec
- Capybara
- Sinatra
- PostgreSQL
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
Supposing you have installed <a href='http://www.postgresql.org/'>PostgreSQL</a>, create the databases:
```shell
$ psql
> create database "chitter_development";
#and
> create database "chitter_test";
#after they have been created, type:
>\q
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
