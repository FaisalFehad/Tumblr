Tumblr Clone
============
An attempt to clone as many features as possible from Tumblr.

## Install
Make sure you have [Docker](https://docs.docker.com/engine/installation/
) and [Docker-compose](https://docs.docker.com/compose/install/) installed on  your machine.

> $ git clone https://github.com/FaisalFehad/Tumblr

Make sure that Docker is running
> $ sudo dockerd

Run docker-compose to pull down the dependencies
> $ docker-compose up

Migrate the db
> $ docker-compose run web bi
n/rake db:migrate RAILS_ENV=development

Run
> $ docker-compose up

And access the app on http://0.0.0.0:3000 :tada:
