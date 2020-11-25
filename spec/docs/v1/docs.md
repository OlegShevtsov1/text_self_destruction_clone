

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
              "description": "aut"
            }

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "77",
                "type": "message_link",
                "links": {
                  "url": "v1/messages/77"
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
    + id: `78` (number, required)

+ Request returns status ok
**GET**&nbsp;&nbsp;`/v1/messages/78`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "78",
                "type": "message_response",
                "attributes": {
                  "message": "qui"
                }
              },
              "status": "ok"
            }

+ Request returns status forbidden
**GET**&nbsp;&nbsp;`/v1/messages/79`

    + Headers

            Accept: application/json
            Content-Type: application/json

+ Response 403

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "79",
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
