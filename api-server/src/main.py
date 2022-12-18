from fastapi import FastAPI, HTTPException
import uvicorn
from dynamodb_repo import get_joke_data, list_jokes


app = FastAPI()

@app.get("/")
def health():
    return {"health": "OK"}

@app.get("/joke")
def getJokes():
    return list_jokes()

@app.get("/joke/{id}")
def getJoke(id):
    try:
        return get_joke_data("id")
    except Exception:        
        raise HTTPException(status_code=404, detail="Joke with id " + id + " not found")

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=80)
    