# This is a Project for NetForemost
## How to run it locally
### MySQL installation
1. If you already have MySQL installed you can continue to the next section
2. You need to install `Docker`
3. After the Docker installation you need to check if `docker compose` is installed too
4. run `docker compose up -d`. This will run a container with MySQL
### Ruby
1. If you already have Ruby installed you can go to the step number #
2. For easy installation you can install a Ruby version manager like `rbenv`
   - You can follow this tutorial to install it [Install Ruby and Rails with rbenv](https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-with-rbenv-on-macos)
      1. You'll need to install the version `3.2.1`
      2. You'll also need to install `Rails` with the version `7.0.4.2`
3. Check if ruby is installed with `ruby --version`
4. Check if rails is installed with `rails -- version`
### Database setup
In the root of the project run the following commands
1. `rails db:create` this command will create the databases that you'll need
2. `rails db:migrate` this will run all the migrations
3. `rails db:seed` this will populate our database with some entry values
#### Run the project
You can choose one of the following options to run the project
* run `bin/dev` in the root folder
* run `rails s` in the root folder

both options will open up a localhost in the port `3000` so you can access within you browser to `localhost:3000`