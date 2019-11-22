# Cinema Reservation System
Cinema Reservation System is an API based reservation system built using [Sinatra](http://sinatrarb.com/) with [Sequel](https://sequel.jeremyevans.net/).

The use of this reservation system is to book seats for movies.

The code base is hosted on Heroku. Host Name : https://crs-hays.herokuapp.com/

# Table of Contents
- [Installation](#installation)
- [Project Setup](#project-setup)
- [List of APIs](#list-of-apis)
    - [Create movie](#api-to-create-movie)
    - [Get the list of movies](#api-to-get-the-list-of-movies)
    - [Create Reservation](#api-to-create-reservation)
    - [Get the list of reservations](#api-to-get-the-list-of-reservations)
- [Heroku Endpoints](#heroku-endpoints)

## Installation
Before installing ruby, we have to install rvm. Follow the [RVM doc](https://rvm.io/rvm/install)
to install ruby.
```shell script
rvm install ruby-2.6.3
```

Create gemset by running the below command or open a new tab in the terminal which will pick from the `.ruby-gemset` file.
```shell script
 rvm gemset create crs_hays
```

## Project Setup

Clone the project from the github
```shell script
git clone git@github.com:libinenjoy/crs_hays.git
```

Install bundler gem
```shell script
gem install bundler
```

Go to the project path and install the dependent gems.
```shell script
bundle install
```

Migrate the database
```shell script
bundle exec sequel -m db/migrations postgres://[username]@localhost:5432/crs_hays_development
```

Here `shotgun` is used to reload rack development server.
```shell script
shotgun -p 3000
```

## List of APIs
Use [postman](www.getpostman.com) tool or install it as a browser extension.
### API to Create Movie
#### Request
```http request
POST localhost:3000/movies
```
Body
```json5
{
	"name": "The Jungle Book",
	"description": "The Jungle Book",
	"image_url": "https://www.imdb.com/title/tt3040964/",
	"presented_on": "2019-11-19"

}
```
#### Response
```json5
{
    "message": "Movie Created Successfully",
    "status": "created",
    "http_status": 201
}
```

### API to get the list of Movies
#### Request
```http request
GET localhost:3000/movies?presented_day=tuesday
```
#### Response
```json5
[
    {
        "id": 1,
        "name": "The Jungle Book",
        "description": "The Jungle Book",
        "image_url": "https://www.imdb.com/title/tt3040964/",
        "presented_on": "2019-11-19"
    }
]
```

### API to Create Reservation
#### Request
```http request
POST localhost:3000/reservations
```
Body
```json5
{
	"username": "James",
	"reserved_on": "2019-11-20",
	"no_of_seats": "2",
	"movie_id": "1"
}
```
####Response
```json5
{
    "message": "Reservation Created Successfully",
    "status": "created",
    "http_status": 201
}
```

### API to get the list of Reservations
#### Request
```http request
GET localhost:3000/reservations?start_date=2019-11-18&end_date=2019-11-20
```
#### Response
```json5
[
    {
        "id": 1,
        "username": "James",
        "reserved_on": "2019-11-19",
        "no_of_seats": 2,
        "movie": {
            "id": 7,
            "name": "Avengers"
        }
    },
    {
        "id": 2,
        "username": "Jack Sparrow",
        "reserved_on": "2019-11-20",
        "no_of_seats": 2,
        "movie": {
            "id": 9,
            "name": "Iron Man"
        }
    },
    {
        "id": 3,
        "username": "John Snow",
        "reserved_on": "2019-11-20",
        "no_of_seats": 2,
        "movie": {
            "id": 9,
            "name": "Iron Man"
        }
    },
    {
        "id": 4,
        "username": "Jack Sparrow",
        "reserved_on": "2019-11-21",
        "no_of_seats": 2,
        "movie": {
            "id": 10,
            "name": "Black Panther"
        }
    }
]
```


## Heroku Endpoints
Endpoint to create movie
```http request
POST https://crs-hays.herokuapp.com/movies
```
body
```json5
{
	"name": "The Jungle Book",
	"description": "The Jungle Book",
	"image_url": "https://www.imdb.com/title/tt3040964/",
	"presented_on": "2019-11-19"

}
```

Endpoint to get list of movies
```http request
GET https://crs-hays.herokuapp.com/movies?presented_on=friday
```

Endpoint to create reservations
```http request
POST https://crs-hays.herokuapp.com/reservations
```
body
```json5
{
	"username": "James",
	"reserved_on": "2019-11-20",
	"no_of_seats": "2",
	"movie_id": "1"
}

```

Endpoint to get list of reservations
```http request
GET https://crs-hays.herokuapp.com/reservations?start_date=2019-11-18&end_date=2019-11-20
```



