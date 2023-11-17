import datetime
from sqlalchemy.sql.expression import null
from database import Base
from sqlalchemy import String,Integer,Column,ForeignKey,Text, DateTime
from sqlalchemy.orm import relationship


class Programme(Base):
    
    __tablename__ = 'programme' # Definerar tablename till programme

    id = Column(Integer, primary_key=True)
    name = Column(String(80), unique=True, nullable=False)
    description = Column(Text)
    start_date = Column(DateTime)
    end_date = Column(DateTime)
    
    course = relationship("Course", back_populates="programme")
    student = relationship("Student", back_populates="programme")
   
    
    def __repr__(self):
        return f"{self.name} - {self.description} - {self.start_date}  - {self.end_date}"

class Course(Base):

    __tablename__ = 'course' # Definerar tablename till course

    id = Column(Integer, primary_key=True)
    name = Column(String(80), unique=True, nullable=False)
    description = Column(Text)
    start_date = Column(DateTime)
    end_date = Column(DateTime)
    programme_id = Column(Integer, ForeignKey('programme.id'))
    
    programme = relationship("Programme", back_populates="course")

    student_course = relationship("student_course", back_populates="course")
    teacher = relationship("teacher", back_populates="course")
    assignment = relationship("assignment", back_populates="course")
    
    def __repr__(self):
        return f"{self.name} - {self.description} - {self.start_date}  - {self.end_date} - {self.programme_id}"


class Student(Base):

    __tablename__ = 'student' # Definerar tablename till student

    id = Column(Integer, primary_key=True)
    name = Column(String(80), unique=True, nullable=False)
    email = Column(String(120), nullable=False)
    programme_id = Column(Integer, ForeignKey('programme.id'))
    
    programme = relationship("Programme", back_populates="student")
    
    student_course = relationship("Student_course", back_populates="student")


    def __repr__(self):
        return f"{self.name} - {self.email} - {self.programme_id}"


class Student_course(Base):

    __tablename__ = 'student_course' # Definerar tablename till student_course

    id = Column(Integer, primary_key=True)
    student_id = Column(Integer, ForeignKey('student.id'))
    course_id = Column(Integer, ForeignKey('course.id'))

    student = relationship("Student", back_populates="student")
    course = relationship("Course", back_populates="course")

    def __repr__(self):
        return f"{self.student_id} - {self.course_id}"
    

class Teacher(Base):

    __tablename__ = 'teacher' # Definerar tablename till teacher

    id = Column(Integer, primary_key=True)
    name = Column(String(80), unique=True, nullable=False)
    email = Column(String(120), nullable=False)
    course_id = Column(Integer, ForeignKey('course.id'))

    course = relationship("Course", back_populates="course")

    def __repr__(self):
        return f"{self.name} - {self.email} - {self.course_id}"
    

class Assignment(Base):

    __tablename__ = 'assignment' # Definerar tablename till assignment

    id = Column(Integer, primary_key=True)
    name = Column(String(80), unique=True, nullable=False)
    description = Column(Text)
    start_date = Column(DateTime)
    end_date = Column(DateTime)
    course_id = Column(Integer, ForeignKey('course.id'))

    course = relationship("Course", back_populates="course")

    def __repr__(self):
        return f"{self.name} - {self.description} - {self.start_date}  - {self.end_date} - {self.course_id}"
