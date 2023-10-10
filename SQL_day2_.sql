---------------------DAY-2---------------
--TEKRAR

CREATE TABLE  sairler(
id int,
name varchar(50),
email varchar(50)
);

INSERT INTO sairler VALUES(1001,'Can Yucel','sair@gmail.com');
INSERT INTO sairler VALUES(1001,'Necip Fazil','sair@gmail.com');
INSERT INTO sairler(name) VALUES('Nazim Hikmet');›
SELECT * FROM sairler;

--9- tabloya UNIQUE constrainti ekleme
CREATE TABLE it_persons(
id SERIAL,
name VARCHAR(50),
email VARCHAR UNIQUE,
salery REAL,
prog_long VARCHAR(50)
);
INSERT INTO it_persons(name,email,salery,prog_long) VALUES('Yusuf Alas','yusufalas103@gmail.com',5000,'Java');

INSERT INTO it_persons(name,email,salery,prog_long) VALUES('zafer bey','zafer103@gmail.com',5000,'Java');

INSERT INTO it_persons(name,email,salery,prog_long) VALUES('buse hanim','buse@gmail.com',5000,'Java');

SELECT * FROM it_persons;


--10- tabloya not null constrainti ekleme

CREATE TABLE doctors(
id SERIAL,
NAME VARCHAR(50) NOT NULL,
email VARCHAR(50) UNIQUE,
salery REAL
);

INSERT INTO doctors(name,email,salery) VALUES('Fatma Hoca','dr@gmail.com',7000);

INSERT INTO doctors(name,email,salery) VALUES('Dr gregory','doctor@gmail.com',7000);

--INSERT INTO doctors(email,salery) VALUES('dr@gmail.com',7000);

INSERT INTO doctors(name,email,salery) VALUES(' ','doctor1@gmail.com',7000);

SELECT * FROM doctors;

--11-tabloya PK constrainti ekleme
CREATE TABLE students2(
id int PRIMARY KEY,--UNIQUE,NOT NULL,başka bir tablo ile ilişkilendirmek için kullanılacak
name varchar(50),
grade real,
register_date date	
);
SELECT * FROM students2;


--11-tabloya PK constrainti ekleme:2.yöntem
CREATE TABLE students3(
id int,--UNIQUE,NOT NULL,başka bir tablo ile ilişkilendirmek için kullanılacak
name varchar(50),
grade real,
register_date date,
CONSTRAINT std_pk PRIMARY KEY(id)	
);
SELECT * FROM students3;

--composite key
CREATE TABLE students4(
id int,
name varchar(50),
grade real,
register_date date,
CONSTRAINT composite_pk PRIMARY KEY(id,name) 
);
SELECT * FROM students4;



--12
CREATE TABLE address3(
address_id int,
street varchar(50),
city varchar(20),
student_id int,--fk olSUN
CONSTRAINT add_fk FOREIGN KEY(student_id) REFERENCES students3(id)
);
select * from address3;


--13-tabloya CHECK constrainti ekleme
CREATE TABLE personel(
id int,
name varchar(50),
salary real CHECK(salary>5000),
age int CHECK(age>0 AND age<50)--Negatif olmamalı
);














