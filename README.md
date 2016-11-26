# Books Store
[![Code Climate](https://codeclimate.com/github/lHydra/books_store/badges/gpa.svg)](https://codeclimate.com/github/lHydra/books_store)
[![Build Status](https://travis-ci.org/lHydra/books_store.svg?branch=master)](https://travis-ci.org/lHydra/books_store)
## Steps to start this application:

Go to the application directory


**Install rvm and gems**

Installing Ruby Version Manager
```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
```

Installing Ruby
```
rvm install 2.3.1
rvm use 2.3.1 --default

```

Creating gemset and installing gems
```
rvm gemset create book-store
rvm use @book-store
gem install bundler
bundle install
```

_Notice! In future when you open your console in app directory gemset enable automatically_

**Install and start docker(postgres) container**
```
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $(whoami)
sudo apt-get -y install python-pip
sudo pip install docker-compose
```
Please, restart your system =)

If your want starting postgres container:

```
docker-compose up
```
If your want stopping postgres container:

```
docker-compose stop
```

If your want check status postgres container:

```
docker-compose ps
```


**Database creation and filling**

Start container before running rake tasks.
 
```
docker-compose up
```

Start rake tasks.

```
rake db:create
rake db:migrate
rake db:seed_fu
```

**Start the application**

```
foreman start -f Procfile.dev
```

Open link in your browser: `http://localhost:3000`

Congratulations!

## Tests

Also you can run test with command

```console
bundle exec rspec spec
```

## Seeds

Then seed the database with command

```console
rails db:seed_fu
```

This create 2 users and 12 books, 6 - free and 6 - close

User №1

```ruby
email: 'first@mail.ru', password: '123123'
```

User №2

```ruby
email: 'second@mail.ru', password: '123123'
```

3 coupons for books: book 4 - **aaabbb**, book 5 - **123456**, book 12 - **free**

For more information see

```ruby
app/db/fixtures/3_coupons.rb
```

## Cron tasks

Start whenever with command (delete every 3 minutes coupons that was created more than 5 minute ago)
```console
whenever --update-crontab --set environment=development
```
