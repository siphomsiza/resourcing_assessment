# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:
* Heroku live environment Url
  
* Ruby version
  ruby 2.2.2
  rails 5

* Configuration
  run $ bundle install #To Install all of the required gems from your specified sources:

* Database creation and add seeds to DB
  run $ rake db:drop db:create db:migrate && seed:migrate

* How to run the test suite
  run $ RAILS_ENV=test rake db:drop db:create db:migrate
  run $ bundle exec rspec spec #To run controllers,models,requests,routing and views tests using rspec gem  
* ...
