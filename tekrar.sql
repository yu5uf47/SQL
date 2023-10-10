CREATE TABLE sairler2(
id int,
NAME VARCHAR (50),
email varchar(50)
);

INSERT INTO sairler VALUES('1001','NAZIM HIKMET','NAZIM@gmail.com');

INSERT INTO sairler VALUES('1001','didem','NAZIM@gmail.com');

INSERT INTO sairler VALUES('1002','Necip fazli','necip@gmail.com');

INSERT INTO sairler(name) VALUES('Necip fazli');

-- unique kullnam essiz deger girme

CREATE TABLE it_persons(
id serial,
name varchar(50),
email varchar(50) UNIQUE,
salary real,
programing_lang varchar(20)
);

INSERT INTO it_persons(name, email, salary,programing_lang) 
VALUES('Yusuf Alas','yusufalas103@gmail.com',5000,'QA');

INSERT INTO it_persons(name, email, salary,programing_lang) 
VALUES('fathis','yusufalas103@gmail.com',7000,'java'); --Key (email)=(yusufalas103@gmail.com) already exists.duplicate key value violates unique constraint "it_persons_email_key" 

SELECT * FROM it_persons;



 --tabloya not null constrainti ekleme
 
 
 CREATE TABLE doctors(
 id serial,
name varchar(50) not null,
email varchar(50) Unique,
salary real
 );
 
INSERT INTO doctors(NAME,EMAIL,SALARY) VALUES('DR.YUSUF','DRYSF@gmail.com',4000)
 
INSERT INTO doctors(EMAIL,SALARY) VALUES('DRYSF@gmail.com',4000) -- hata-  null value in column "name" of relation "doctors" violates not-null constraint
  
 SELECT * FROM  doctors;
 
 
 --tabloya primary keey ekleme
 create table students2(
 id int primary key, -- not null unique baska bir tablo ile iliskilendirmek icin kullanilacak 
name varchar(50),
grade real,
register_date date 
 );
 SELECT * FROM students2;
 
-- pk ekleme 2.yontem
  create table students3(
 id int,  -- not null unique baska bir tablo ile iliskilendirmek icin kullanilacak 
 name varchar(50),
 grade real,
 register_date date,
 CONSTRAINT std_pk PRIMARY KEY(id)
 );
 
 SELECT * FROM students3;
 
 -- composite key birden fazla pk olunca composite denir ve birden fazla pk olunca bu yontem kullanilir 
 
   create table students4(
 id int,  
 name varchar(50),
 grade real,
 register_date date,
 CONSTRAINT std4_pk PRIMARY KEY(id,name)
 );
 
 SELECT * FROM students4;
 
 
 
 
 
 






