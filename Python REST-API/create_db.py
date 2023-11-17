# Koppling till en databas
from database import Base, engine
import models

#skapar en print med creating database
print("Creating database ...")

#skapar en method som skapar database

models.Base.metadata.create_all(engine)