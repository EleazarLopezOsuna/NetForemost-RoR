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

## What you will find
### Functions
1. You can sort by `Title`, `Topic (hashtags)`, and `Date`
2. You will get a notification everytime you `Create`, `Edit` or `Delete` a Note
3. You can search by `Title`, `Body` and `Topic (hashtags)`
### Views
### Landing page / Login
![image](https://user-images.githubusercontent.com/48371383/222638049-2ced40d6-a886-406d-b9e7-b98626d84a2a.png)
### Sign up Page
![image](https://user-images.githubusercontent.com/48371383/222638103-461e1a29-2dbc-4362-9dad-164c6e6fa2e7.png)
### Notes page
![image](https://user-images.githubusercontent.com/48371383/222638473-877fa533-e5eb-4a83-97ae-65add475b540.png)
### Create new Note Area
![image](https://user-images.githubusercontent.com/48371383/222638516-2c488378-4382-4c86-a276-919fef5cfb58.png)
### Note list area
![image](https://user-images.githubusercontent.com/48371383/222638603-ceb31ca0-28e2-45ca-b588-1d91b3feb2c1.png)
### Seach result page
![image](https://user-images.githubusercontent.com/48371383/222638723-67eda2c0-9f6b-41cf-a813-d4940d775375.png)
### Visualize a single note
![image](https://user-images.githubusercontent.com/48371383/222639246-042dc61b-c137-4261-937b-8a8688db9f25.png)

## Errors
### You need to be logged in to access
![image](https://user-images.githubusercontent.com/48371383/222638247-0e910ae9-f159-4925-b704-ef200f80c7d9.png)
### You accidentally access to a page that does not exist
![image](https://user-images.githubusercontent.com/48371383/222638358-f83b2022-e7fd-47f2-8c8f-a2aee3bfab15.png)
