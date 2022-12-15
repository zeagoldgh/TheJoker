from fastapi import FastAPI, HTTPException
import uvicorn
import boto3


app = FastAPI()

jokes_data = [{
        "id": "id1",
        "value": "Hilarious Joke"
    },{
        "id": "id2",
        "value": "Funny Joke"
    }]

@app.get("/")
def health():
    return {"health": "OK"}

@app.get("/joke")
def getJokes():
    return jokes_data

@app.get("/joke/{id}")
def getJoke(id):
    for joke in jokes_data:
        if(joke["id"] == id):
            return joke
    raise HTTPException(status_code=404, detail="Joke with id " + id + " not found")

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=80)