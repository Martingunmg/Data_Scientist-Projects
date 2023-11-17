from pydantic import BaseModel
from datetime import date


# skapar Relation Schema

class Programme(BaseModel): # Serializer

    id: int
    name: str
    description: str
    start_date: date = None
    end_date: date = None

    

class Course(BaseModel):
    
    id: int
    name: str
    description: str
    start_date: date = None
    end_date: date = None
    programme_id: int

    class config: # Gör så sqlalchmeny funkar
        orm_mode=True


class Student(BaseModel):
    
    id: int
    name: str
    email: str
    programme_id: int

    class config: # Gör så sqlalchmeny funkar
        orm_mode=True

class Student_course(BaseModel):
    id: int
    student_id: int
    course_id: int

    class config: # Gör så sqlalchmeny funkar
        orm_mode=True

class Teacher(BaseModel):
    id: int
    name: int
    email: str
    course_id: int

    class config: # Gör så sqlalchmeny funkar
        orm_mode=True


class Assignment(BaseModel):
    id: int
    description: str
    name: int
    start_date: date = None
    end_date: date = None
    course_id: int
    