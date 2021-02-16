# README

# NominappTest

This is an API for create a random array ando get the range more larger

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

  - Ruby 2.5.1
  - Rails 5.2.4.5
  - PostgreSQL 1.2.3
  * Using Docker for Development
  - Docker version 17.03.0-ce or higher
  - Docker Compose version 1.21.2 or higher
  - Use docker without 'sudo' command, you can follow the [instruccions](https://docs.docker.com/install/linux/linux-postinstall/)

  ### Build the app for first time
    - docker-compose build
    - docker-compose up and in other terminal docker-compose run web rake db:create
    - docker-compose run web bash, and inside the rails terminar run rails db:migrate RAILS_ENV=development
    - docker-compose run web rails db:seed

  ### Running the app and tests

    - docker-compose up
    - docker-compose run web rspec spec

  ### API Documents

    - docker-compose up
    - go to http://localhost:3000/api-docs/index.html

  ## Built With

  [Rails](https://github.com/rails/rails) - Framework used

  ## Contributing

  This is a public repository.

  ## Author

  * **Jairo Orjuela**    - *Full stack developer* - [Jairo](https://github.com/jairorjuela)

