# Bokmark 
### Rails 7 API APP with Postgresql as databse
## Features
- User can create bokmark in tree structure 
- Create endpoints for bookmark model (list/edit/create/delete url)
- Create endpoints for Site model (top Level URL) (list/show)
    - User can not edit or delete or create a site
- Create endpoints for tag model (list / create/show)
    - User can not delete or edit tag
    - Tags can be shown by all users unlike bookmark
- (Not implemented) Create endpoint for searching bookmark base on field or tag

## Gem 

bookmark uses a number of open source gem:
- Gem devise https://github.com/heartcombo/devise 
- Gem jwt https://github.com/jwt/ruby-jwt
- Gem ancestry https://github.com/stefankroes/ancestry
- Gem annotate https://github.com/CanCanCommunity/cancancan
- Gem cancancan https://github.com/CanCanCommunity/cancancan
- Gem bitly <https://github.com/philnash/bitly#creating-an-api-client>

## Installation

Install the dependencies and start the server.
To Build docker compose build
```
sudo docker-compose build
```
To create tables in postgrsql 
```
sudo docker-compose run web bundle exec rails db:migrate
```

To run rails server
```
sudo docker-compose up
```
Run test cases
```
sudo docker-compose run web bundle exec rspec
```
