from fastapi import FastAPI, status, HTTPException
from pydantic import BaseModel
from datetime import date
from sqlalchemy.orm import Session
from typing import Optional, List
from database import SessionLocal, engine
import models, schemas

models.Base.metadata.create_all(bind=engine)

# Skapar app
app = FastAPI()



# db = med sessionloacl kallar den.
db=SessionLocal()

# 2 "routes/endpoints" för att hämta olika typer av data (GET)

# programmes hämta (GET)
@app.get('/programmes',response_model=List[schemas.Programme],status_code=200)
def get_all_programmes():
    programmes=db.query(models.Programme).all()

    return programmes

# course hämta (GET)
@app.get('/courses',response_model=List[schemas.Course],status_code=200)
def get_all_course():
    course=db.query(models.Course).all()

    return course

# 2 "routes/endpoints" för att skapa data (POST)

# Programme(Post)
@app.post('/programmes',response_model=schemas.Programme,
        status_code=status.HTTP_201_CREATED)
def create_an_programme(programme:schemas.Programme):
    db_programme=db.query(models.Programme).filter(models.Programme.name==programme.name).first()

    if db_programme is not None:
        raise HTTPException(status_code=400,detail="Programme already exists")



    new_programme=models.Programme(
        name=programme.name,
        description=programme.description,
        start_date=programme.start_date,
        end_date=programme.end_date
    )


    
    db.add(new_programme)
    db.commit()

    return new_programme

# Course(Post)

@app.post('/courses',response_model=schemas.Course,
        status_code=status.HTTP_201_CREATED)
def create_an_course(course:schemas.Course):
    db_course=db.query(models.Course).filter(models.Course.name==course.name).first()

    if db_course is not None:
        raise HTTPException(status_code=400,detail="course already exists")



    new_course=models.Course(
        name=course.name,
        description=course.description,
        start_date=course.start_date,
        end_date=course.end_date
    )


    

    db.add(new_course)
    db.commit()

    return new_course

# 1 "route/endpoints" för att uppdatera data (PUT)

@app.put('/programme/{programme_id}',response_model=schemas.Programme,status_code=status.HTTP_200_OK)
def update_an_programme(programme_id:int,programme:schemas.Programme):
    programme_to_update=db.query(models.Programme).filter(models.Programme.id==programme_id).first()
    programme_to_update.name=programme.name
    programme_to_update.description=programme.description
    programme_to_update.start_date=programme.start_date
    programme_to_update.end_date=programme.end_date

    db.commit()

    return programme_to_update

# 1 "route/endpoints" för att ta bort data (DELETE)

@app.delete('/programme/{programme_id}')
def delete_Programme(programme_id:int):
    programme_to_delete=db.query(models.Programme).filter(models.Programme.id==programme_id).first()

    if programme_to_delete is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail="Resource Not Found")
    
    db.delete(programme_to_delete)
    db.commit()

    return programme_to_delete

"""
@app.post('/programmes',response_model=schemas.Programme,
        status_code=status.HTTP_201_CREATED)
def create_an_programme(programme: schemas.Programme):
    db_programme=db.query(models.Programme).filter(models.Programme.name==programme.name).first()

    if db_programme is not None:
        raise HTTPException(status_code=400,detail="Programme already exists")

        @app.get("/programme",response_model=List[Programme],status_code=200) #response_model kallar jag min model som returnerar en lista
def get_all_programme():
    programme=db.query(models.Programme).all()  # med db.query använd model programme alla.
    return programme #Returnear query

@app.get('/programmes',response_model=List[schemas.Programme],status_code=200)
def get_all_programmes():
    programmes=db.query(models.Programme).all()

    return programmes

@app.get('/programmes',response_model=List[Programme],status_code=200)
def get_all_programmes():
    programmes=db.query(models.Programme).all()

    return programmes

@app.get('/programme/{programme_id}',response_model=Programme,status_code=status.HTTP_200_OK)
def get_an_programme(programme_id:int):
    programme=db.query(models.Programme).filter(models.Programme.id==programme_id).first()
    
    return programme

@app.post('/programmes',response_model=Programme,
        status_code=status.HTTP_201_CREATED)
def create_an_programme(programme:Programme):
    db_programme=db.query(models.Programme).filter(models.Programme.name==programme.name).first()

    if db_programme is not None:
        raise HTTPException(status_code=400,detail="Programme already exists")



    new_programme=models.Programme(
        name=programme.name,
        description=programme.description,
        start_date=programme.start_date,
        end_date=programme.end_date
    )


    

    db.add(new_programme)
    db.commit()

    return new_programme

@app.put('/programme/{programme_id}',response_model=Programme,status_code=status.HTTP_200_OK)
def update_an_programme(programme_id:int,programme:Programme):
    programme_to_update=db.query(models.Programme).filter(models.Programme.id==programme_id).first()
    programme_to_update.name=programme.name
    programme_to_update.description=programme.description
    programme_to_update.start_date=programme.start_date
    programme_to_update.end_date=programme.end_date

    db.commit()

    return programme_to_update

@app.delete('/programme/{programme_id}')
def delete_Programme(programme_id:int):
    programme_to_delete=db.query(models.Programme).filter(models.Programme.id==programme_id).first()

    if programme_to_delete is None:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND,detail="Resource Not Found")
    
    db.delete(programme_to_delete)
    db.commit()

    return programme_to_delete

@app.get('/')
def index():
    return{"message":"Infromation om programme"}

"""

"""# Gör en route
@app.get('/')
def index():
    return{"message":"Infromation om programme"}

# put

@app.put("/programme/{programme_id}")
def update_programme(programme_id:int,programme:Programme):
    return {"name": programme.name,
            "description": programme.description,
            "start_date": programme.start_date,
            "end_date": programme.end_date,
            }

@app.get("/programme",response_model=List[Programme],status_code=200) #response_model kallar jag min model som returnerar en lista
def get_all_programme():
    programme=db.query(models.Programme).all()  # med db.query använd model programme alla.

    return programme #Returnear query

@app.get("/programme/{programme_id}")
def get_an_programme(programme_id:int):
    pass

@app.post("/programme",response_model=Programme,
          status_code=status.HTTP_201_CREATED)
def create_an_programme(programme:Programme):
    new_programme=models.Programme(
        name=programme.name,
        description=programme.description,
        start_date=programme.start_date,
        end_date=programme.end_date
    )
    db_programme=db.query(models.Programme).filter(programme.name==new_programme.name).first()
    
    if db_programme is not None:
        raise HTTPException(status_code=400,detail="Programme already exists")

    db.add(new_programme) # lägger den nya datan
    db.commit() #skickar den

    return new_programme

@app.put("/programme/{programme_id}")
def update_an_programme(programme_id:int):
    pass

@app.delete("/programme/{programme_id}")
def delete_programme(programme_id:int):
    pass"""