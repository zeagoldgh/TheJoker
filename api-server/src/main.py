from fastapi import FastAPI, HTTPException


app = FastAPI()


@app.get("/")
def health():
    return {"health": "OK"}

@app.get("/joke")
def getJokes():
    return [{
        "id": "id1",
        "value": "Hilarious Joke"
    },{
        "id": "id2",
        "value": "Funny Joke"
    }]