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
def insert_data_to_Subjects_table(Subject_Name: str):
    connect_database = sq.connect("Exam_App_DB.db")
    insert_data = "insert into Subjects(Subject_Name) values('{}')".format(
        Subject_Name)
    connect_database.execute(insert_data)
    connect_database.commit()
    connect_database.close()
    return {"status": "success"}

# Insert Data To Scores Table


@app.post("/insert/Scores")
def insert_data_to_Scores_table(True_Answers: str, False_Answers: str,
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
def insert_data_to_Questions_table(Question: str, Subject_Name: str):
    connect_database = sq.connect("Exam_App_DB.db")
    insert_data = "insert INTO Questions(Question,Subject_Id) VALUES('{}',(select Id from Subjects where Subject_Name='{}'))".format(
        Question, Subject_Name)
    connect_database.execute(insert_data)
    connect_database.commit()
    connect_database.close()
    return {"status": "success"}

# Insert Data To Question_Detales Table


@app.post("/insert/Question_Detales")
def insert_data_to_Question_Detalse_table(Question_Id: str,
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
def insert_data_to_Answers_table(Answer: str):
    connect_database = sq.connect("Exam_App_DB.db")
    insert_data = "insert into Answers(Answer) values('{}')".format(Answer)
    connect_database.execute(insert_data)
    connect_database.commit()
    connect_database.close()
    return {"status": "success"}
####Login####
@app.get("/login")
def login(email,password):
    connect_database = sq.connect("Exam_App_DB.db")
    select_data = "select Email,Password from Users where Email='{}' and Password='{}'".format(email,password)
    Coursor=connect_database.execute(select_data)
    lst=Coursor.fetchall()# تكرار عملية الاستعلام بعدد الريكوردات الموجودة
    print(lst)
    if len(lst)>0:#التأكد من وجود الحساب في قاعدة البيانات
        return list(lst)[0][0]
    else:
        return False
####Select Founction####
#Select Data From Users Table
@app.get("/select/Users")
def select_data_from_Users_table():
    connect_database = sq.connect("Exam_App_DB.db")
    select_data = "select * from Users"
    Coursor=connect_database.execute(select_data)
    lst=Coursor.fetchall()# تكرار عملية الاستعلام بعدد الريكوردات الموجودة
    lst_jason=[]# تعريف مصفوفة لتخزين الريكوردات على شكل دكشنري
    for i in lst:# حلقة لجلب محتوى كل خلية حسب فهرس السطر واسم العمود وتخزينه في دكشنري
        item={}
        item['id']=i[0]
        item['User_Name']=i[1]
        item['Email']=i[2]
        item['Password']=i[3]
        lst_jason.append(item)
    connect_database.close()
    print({"status": "success"})
    return lst_jason


#Select Data From Users_Detales Table
@app.get("/select/User_Detales")
def select_data_from_User_Detales_table(userEmail):
    connect_database = sq.connect("Exam_App_DB.db")
    select_data = "select User_Detales.User_Type from User_Detales where User_Id=(SELECT id from Users WHERE Email='{}')".format(userEmail)
    Coursor=connect_database.execute(select_data)
    type=Coursor.fetchall()# تكرار عملية الاستعلام بعدد الريكوردات الموجودة
    item={}
    for i in type:# حلقة لجلب محتوى كل خلية حسب فهرس السطر واسم العمود وتخزينه في دكشنري
        item['User_Type']=i[0]
    connect_database.close()
    print(item["User_Type"])
    print({"status": "success"})
    return item["User_Type"]

#Select Subject_Id
@app.get("/select/Subject_Id")
def selectSubject_Id(Subject_Name:str):
    connect_database = sq.connect("Exam_App_DB.db")
    select_data = "select Id from Subjects where Subject_Name='{}'".format(Subject_Name)
    Coursor=connect_database.execute(select_data)
    type=Coursor.fetchone()# تكرار عملية الاستعلام بعدد الريكوردات الموجودة
    return type[0]



# Select Data from Subjects and Questions
@app.get("/select/Subjects_Questions")
def select_data_from_subjects_questions():
    connect_database = sq.connect("Exam_App_DB.db")
    select_data = "select Questions.Question,Subjects.Subject_Name from Questions INNER JOIN Subjects WHERE Subjects.Id=Questions.Subject_Id"
    Cours=connect_database.execute(select_data)
    lst=Cours.fetchall()# تكرار عملية الاستعلام بعدد الريكوردات الموجودة
    print(lst)
    lst_jason=[]# تعريف مصفوفة لتخزين الريكوردات على شكل دكشنري
    for i in lst:# حلقة لجلب محتوى كل خلية حسب فهرس السطر واسم العمود وتخزينه في دكشنري
        item={}
        item['Question']=i[0]
        item['Subject_Name']=i[1]
        print(1)
        lst_jason.append(item)
    connect_database.close()
    print({"status": "success"})
    return lst_jason

