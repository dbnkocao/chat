# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Stack 
..* Ruby 2.7.1
..* rails  6.0.3
..* redis 6.0.4
..* postgresql 12

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions
```bash
docker-compose run --rm website bundle install
docker-compose run --rm website yarn install
docker-compose run --rm website bundle exec rake db:create db:migrate
docker-compose up -d

```
* ...
