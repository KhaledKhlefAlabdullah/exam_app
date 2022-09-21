from fastapi.middleware.cors import CORSMiddleware
from typing import Union
from pydantic import BaseModel
from fastapi import FastAPI
import sqlite3 as sq
app = FastAPI()


app.add_middleware(
    CORSMiddleware,
    allow_origins=['*']
)
### Insert Function ##
# Insert Data To Users Tabel


@app.post("/insert/Users")
def insert_data_to_Users_table(User_Name: str, Email: str, Password: str):
    connect_database = sq.connect("Exam_App_DB.db")
    insert_data = "insert into Users(User_Name,Email,Password) values('{}','{}','{}')".format(
        User_Name, Email, Password)
    connect_database.execute(insert_data)
    connect_database.commit()
    connect_database.close()
    return {"status": "success"}

# Insert Data To User_Detales Table


@app.post("/insert/User_Detales")
def insert_data_to_User_Detalse_table(User_Id: str, User_Type: str):
    User_Id = int(User_Id)
    connect_database = sq.connect("Exam_App_DB.db")
    insert_data = "insert into User_Detales(User_Id,User_Type) values({},'{}')".format(
        User_Id, User_Type)
    connect_database.execute(insert_data)
    connect_database.commit()
    connect_database.close()
    return {"status": "success"}

# Insert Data To Subjects Table


@app.post("/insert/Subjects")
def insert_data_to_User_Detalse_table(Subject_Name: str):
    connect_database = sq.connect("Exam_App_DB.db")
    insert_data = "insert into Subjects(Subject_Name) values('{}')".format(
        Subject_Name)
    connect_database.execute(insert_data)
    connect_database.commit()
    connect_database.close()
    return {"status": "success"}

# Insert Data To Scores Table


@app.post("/insert/Scores")
def insert_data_to_User_Detalse_table(True_Answers: str, False_Answers: str,
                                      Subject_Id: str, User_Id: str, Fainal_Score: str):
    True_Answers = int(True_Answers)
    False_Answers = int(False_Answers)
    Subject_Id = int(Subject_Id)
    User_Id = int(User_Id)
    connect_database = sq.connect("Exam_App_DB.db")
    insert_data = "insert into Scores(True_Answers,False_Answers,Subject_Id,User_Id,Fainal_Score) values({},{},{},{},'{}')".format(
        True_Answers, False_Answers, Subject_Id, User_Id, Fainal_Score)
    connect_database.execute(insert_data)
    connect_database.commit()
    connect_database.close()
    return {"status": "success"}

# Insert Data To Questions Table


@app.post("/insert/Questions")
def insert_data_to_User_Detalse_table(Question: str, Subject_Id: str):
    Subject_Id = int(Subject_Id)
    connect_database = sq.connect("Exam_App_DB.db")
    insert_data = "insert into Questions(Question,Subject_Id) values('{}',{})".format(
        Question, Subject_Id)
    connect_database.execute(insert_data)
    connect_database.commit()
    connect_database.close()
    return {"status": "success"}

# Insert Data To Question_Detales Table


@app.post("/insert/Question_Detales")
def insert_data_to_User_Detalse_table(Question_Id: str,
                                      Answer_Id: str,
                                      Answer_Type: str,
                                      User_Detales_Id: str):
    Question_Id = int(Question_Id)
    Answer_Id = int(Answer_Id)
    User_Detales_Id = int(User_Detales_Id)
    connect_database = sq.connect("Exam_App_DB.db")
    insert_data = "insert into Question_Detales(Question_ID,Answer_Id,Answer_Type,User_Detales_Id) values({},{},'{}',{})".format(
        Question_Id, Answer_Id, Answer_Type, User_Detales_Id)
    connect_database.execute(insert_data)
    connect_database.commit()
    connect_database.close()
    return {"status": "success"}

# Insert Data To Answers Table


@app.post("/insert/Answers")
def insert_data_to_User_Detalse_table(Answer: str):
    connect_database = sq.connect("Exam_App_DB.db")
    insert_data = "insert into Answers(Answer) values('{}')".format(Answer)
    connect_database.execute(insert_data)
    connect_database.commit()
    connect_database.close()
    return {"status": "success"}
