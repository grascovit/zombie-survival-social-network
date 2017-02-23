# Zombie Survival Social Network

[![Build Status](https://travis-ci.org/grascovit/zombie-survival-social-network.svg?branch=master)](https://travis-ci.org/grascovit/zombie-survival-social-network)
[![codecov](https://codecov.io/gh/grascovit/zombie-survival-social-network/branch/master/graph/badge.svg?token=fHFLeGRtlg)](https://codecov.io/gh/grascovit/zombie-survival-social-network)

[Zombie Survival Social Network](https://gist.github.com/mauricioklein/1b1f279ad2d9cb42bcf0018e1cf05cfb)

### Inicialização
Execute na pasta raíz do projeto:
```
$ bundle install
$ rake db:create
$ rake db:migrate
$ rails s
```

### Testes
Para executar os testes da aplicação:
```
$ rake db:migrate RAILS_ENV=test
$ bundle exec rspec
```
Após a execução, será gerado um relatório com a cobertura detalhada dos casos de teste em `coverage/index.html`.

### Análise estática de código
O Rubocop é responsável pela análise estática do código, garantindo muitas das [guidelines](https://github.com/bbatsov/ruby-style-guide) previstas na comunidade.
Foi utilizado um conjunto de regras customizadas que estão dispostas em `.rubocop.yml`.
Para executar a análise:
```
Checagem de código:
    $ rubocop
Autofix:
    $ rubocop -a
```

# API

## Users [/users]

### Create new user [POST]

+ Request (application/json)

        {
            "user": {
                "name": "João",
                "age": 22,
                "gender": "male",
                "latitude": -16.1290131,
                "longitude": 49.1290421,
                "items_attributes": [
                    {
                        "name": "water"
                    },
                    {
                        "name": "food"
                    }
                ]
            }
        }

+ Response 201 (application/json)

    + Headers

            Location: /users/1

    + Body

            {
                "id": 28,
                "name": "João",
                "age": 22,
                "gender": "male",
                "latitude": "-16.129013",
                "longitude": "49.129042",
                "created_at": "2017-02-23T15:48:22.294Z",
                "updated_at": "2017-02-23T15:48:22.294Z"
            }

### Update user current location [PUT/PATCH]

+ Request (application/json)

        {
            "user": {
                "latitude": -15.123456,
                "longitude": 40.123456
            }
        }

+ Response 200 (application/json)

    + Body

            {
                "id": 28,
                "latitude": "-15.123456",
                "longitude": "40.123456",
                "name": "João",
                "age": 22,
                "gender": "male",
                "created_at": "2017-02-23T15:48:22.294Z",
                "updated_at": "2017-02-23T15:53:03.396Z"
            }
            
## Infection Alerts [/infection_alerts]

### Mark user as infected [POST]

+ Request (application/json)

        {
            "infection_alert": {
                "infected_user_id": 1,
                "reporter_user_id": 2
            }
        }

+ Response 201 (application/json)

    + Headers

            Location: /infection_alerts/1

    + Body

            {
                "id": 1,
                "infected_user_id": 1,
                "reporter_user_id": 2,
                "created_at": "2017-02-23T15:57:07.219Z",
                "updated_at": "2017-02-23T15:57:07.219Z"
            }
            
## Items [/users/1/items]

### Create new user item [POST]

+ Request (application/json)

        {
            "item": {
                "name": "water"
            }
        }

+ Response 201 (application/json)

    + Headers

            Location: /items/1

    + Body

            {
              "id": 1,
              "name": "water",
              "user_id": 1,
              "created_at": "2017-02-23T16:00:27.469Z",
              "updated_at": "2017-02-23T16:00:27.469Z"
            }
            
+ Response 403 (application/json)

    + Body
            
            {
                "errors": "User infected. Cannot trade items"
            }
            
## Trade [/trade]

### Trade items between users [PUT/PATCH]

+ Request (application/json)

        {
            "user_one": {
                "id": 1,
                "items": [
                    1, 2
                ]
            },
            "user_two": {
                "id": 2,
                "items": [
                    3, 4
                ]
            }
        }

+ Response 200 (application/json)

    + Body

            [
              [
                {
                    "id": 1,
                    "name": "water",
                    "user_id": 1,
                    "created_at": "2017-02-23T15:21:16.175Z",
                    "updated_at": "2017-02-23T15:21:16.175Z"
                },
                {
                    "id": 2,
                    "name": "food",
                    "user_id": 1,
                    "created_at": "2017-02-23T15:21:16.175Z",
                    "updated_at": "2017-02-23T15:21:16.175Z"
                },
              ],
              [
                {
                    "id": 3,
                    "name": "water",
                    "user_id": 2,
                    "created_at": "2017-02-23T15:48:22.298Z",
                    "updated_at": "2017-02-23T15:48:22.298Z"
                },
                {
                    "id": 4,
                    "name": "food",
                    "user_id": 2,
                    "created_at": "2017-02-23T15:21:16.175Z",
                    "updated_at": "2017-02-23T15:21:16.175Z"
                },
              ]
            ]
            
+ Response 403 (application/json)

    + Body
            
            {
                "errors": "User infected. Cannot trade items"
            }
            
+ Response 422 (application/json)

    + Body
            
            {
                "errors": "The items are not worth the same amount of points"
            }
            
## Reports [/reports]

### Infected users percentage (/infected_users) [GET]

+ Response 200 (application/json)

            {
              "data": "10.71% of the users are infected"
            }

### Uninfected users percentage (/uninfected_users) [GET]

+ Response 200 (application/json)

            {
              "data": "89.29% of the users are not infected"
            }

### Average items per user (/average_items_per_user) [GET]

+ Response 200 (application/json)

            {
              "data": {
                "water_per_user": 0.11,
                "food_per_user": 0.11,
                "medicine_per_user": 0.14,
                "ammo_per_user": 0
              }
            }
            
### Points lost by infected users (/points_lost) [GET]

+ Response 200 (application/json)

            {
              "data": {
                "total_points_lost": 0
              }
            }