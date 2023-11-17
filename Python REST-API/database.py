from sqlalchemy.orm import declarative_base
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

# Skapar en engine som kontaktar med databasen
# Använder mig utav postsql med PGadmin4 skriver in mig database string.
engine=create_engine("postgresql://postgres:martin97@localhost/programme_db", 
    echo=True
)

# Deklarera base
Base=declarative_base()

# Använder mig utav sessionmaker
# skapar en session class

SessionLocal=sessionmaker(bind=engine)