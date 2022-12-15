# Rails web API that can create and retrieve quiz items
Upon Quiz creation, create a quiz item/distractor with the result of the Cerego Suggested Distractors API

## node backend server
- `bundle` install deps
- run migrations
- `rails s` start server
- `rspec` # runt tests

## sample POST request
```
curl --location --request POST 'localhost:3000/api/v1/quizes' \
--header 'Content-Type: application/json' \
--data-raw '{
    "question": "Mars is a _____ in our solar system.",
    "answer": "planet"
}'

## response

{
    "quiz": {
        "id": 1,
        "question": "Mars is a _____ in our solar system.",
        "answer": "planet",
        "created_at": "2022-12-15T01:20:13.281Z",
        "updated_at": "2022-12-15T01:20:13.281Z"
    }
}
```
## Sample GET request

```
curl --location --request GET 'localhost:3000/api/v1/quizes/1'

## response
{
    "quiz": {
        "id": 1,
        "question": "Mars is a _____ in our solar system.",
        "answer": "planet",
        "created_at": "2022-12-15T01:20:13.281Z",
        "updated_at": "2022-12-15T01:20:13.281Z",
        "quiz_items": [
            {
                "id": 1,
                "distractor": "universe",
                "created_at": "2022-12-15T01:20:13.740Z",
                "updated_at": "2022-12-15T01:20:13.740Z"
            },
            {
                "id": 2,
                "distractor": "moon",
                "created_at": "2022-12-15T01:20:13.748Z",
                "updated_at": "2022-12-15T01:20:13.748Z"
            },
            {
                "id": 3,
                "distractor": "galaxy",
                "created_at": "2022-12-15T01:20:13.766Z",
                "updated_at": "2022-12-15T01:20:13.766Z"
            },
            {
                "id": 4,
                "distractor": "comet",
                "created_at": "2022-12-15T01:20:13.772Z",
                "updated_at": "2022-12-15T01:20:13.772Z"
            },
            {
                "id": 5,
                "distractor": "spaceship",
                "created_at": "2022-12-15T01:20:13.779Z",
                "updated_at": "2022-12-15T01:20:13.779Z"
            },
            {
                "id": 6,
                "distractor": "starship",
                "created_at": "2022-12-15T01:20:13.785Z",
                "updated_at": "2022-12-15T01:20:13.785Z"
            },
            {
                "id": 7,
                "distractor": "nebula",
                "created_at": "2022-12-15T01:20:13.791Z",
                "updated_at": "2022-12-15T01:20:13.791Z"
            },
            {
                "id": 8,
                "distractor": "homeworld",
                "created_at": "2022-12-15T01:20:13.797Z",
                "updated_at": "2022-12-15T01:20:13.797Z"
            },
            {
                "id": 9,
                "distractor": "lifeform",
                "created_at": "2022-12-15T01:20:13.802Z",
                "updated_at": "2022-12-15T01:20:13.802Z"
            },
            {
                "id": 10,
                "distractor": "meteoroid",
                "created_at": "2022-12-15T01:20:13.806Z",
                "updated_at": "2022-12-15T01:20:13.806Z"
            }
        ]
    }
}
```
Happy Coding!
