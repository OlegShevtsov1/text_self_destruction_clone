

# Group Messages


## Messages [/messages]


### Create a message [POST /v1/messages]


+ Request create message
**POST**&nbsp;&nbsp;`/v1/messages`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "description": "praesentium"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "message_link",
                "links": {
                  "url": "v1/messages/1"
                }
              }
            }

+ Request create project with wrong params
**POST**&nbsp;&nbsp;`/v1/messages`

    + Headers

            Accept: application/json
            Content-Type: application/json

    + Body

            {
              "description": ""
            }

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": [
                {
                  "source": {
                    "pointer": "data/attributes/description"
                  },
                  "detail": [
                    "can't be blank"
                  ]
                }
              ]
            }

### Get a message [GET /v1/messages/{id}]

+ Parameters
    + id: `2` (number, required)

+ Request returns status ok
**GET**&nbsp;&nbsp;`/v1/messages/2`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "message_response",
                "attributes": {
                  "message": "odio"
                }
              }
            }

+ Request returns status forbidden
**GET**&nbsp;&nbsp;`/v1/messages/3`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "3",
                "type": "message_requested",
                "attributes": {
                  "message": "You already requested this message"
                }
              }
            }

+ Request returns status not_found
**GET**&nbsp;&nbsp;`/v1/messages/1`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 404

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "error": "Message not found"
            }
