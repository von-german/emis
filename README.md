Use:

admin@gmail.com for administrator

doctor@gmail.com for doctor

r@gmail.com for receptionist

nurse@gmail.com for nurse

the password for all these users is:password

Installations steps for Linux with your terminal:

1-Install dependencies for ruby:

sudo apt-get update sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs

2-Install rvm:

sudo apt-get install libgdbm-dev libncurses5-dev automake libtool bison libffi-dev gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 curl -sSL https://get.rvm.io | bash -s stable source ~/.rvm/scripts/rvm rvm install 2.4.0 rvm use 2.4.0 --default ruby -v

3-Install bundler:

gem install bundler

4-Install NodeJs:

curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - sudo apt-get install -y nodejs

5-Install Rails:

gem install rails -v 5.1.1 *you can make sure its installed with command rails -v

6-Install PostgreSQL:

sudo sh -c "echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list" wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add - sudo apt-get update sudo apt-get install postgresql-common sudo apt-get install postgresql-9.5 libpq-dev

7-Set up a user with permission to create databases: sudo -u postgres create user 'username' -s

8- Clone the project to you local machine

9- Change the present working directory to the one of the project

10-Run the following commands:

bundle install rails db:migrate rails db:seed rails server

11- Now the application should be up and running, go to http://localhost:3000 so you can see it up and run on your local machine
