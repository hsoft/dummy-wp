# Wordpress dummy website

This is a dummy Wordpress wrapped around tooling that is as simple and elegant
as possible. The goal of this project is twofold:

1. Have something devoid of history so that it can represent elegance.
2. Be a hacking space where I can try stuff to perfect my knowledge of WP.

## Prerequisites

* PHP 7.2+ with cli, mysqlnd extensions
* PHP Composer
* Mysql server
* GNU Make

## Usage

Once you have the requirements, you have to create a `.env` file to describe
your local environment to the website. You can simply copy `env.sample` and
adapt it.

Then, you can run `make`, which builds the whole thing. It doesn't import the
initial dump just yet.

Then, you run `make run` to run the website. If the initial dump hasn't been
imported yet, it will be now. You can now visit the site at
http://localhost:8080 and the admin at http://localhost:8080/wp-admin.

Username: `admin` Password: `Foobar42`

