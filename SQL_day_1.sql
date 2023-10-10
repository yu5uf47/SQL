-- yorum satiri
/*coklu yorum satiri icin  javada oldugu gibi
SQL demkucuk buyuk kucuk harf duyarliligi yoktur*/
--1- Database olusturma
CREATE DATABASE yusuf;
create database yusuf2;

--2- database silme- DDL
DROP DATABASE yusuf;
DROP DATABASE yusuf; 

--3-tablo oluşturma 

CREATE TABLE students(
id CHAR(4),
name VARCHAR(20),
grade REAL,
register_date DATE
);

--4- mevcut bir tablodan yeni bir tablo olsuturma
CREATE TABLE grades AS SELECT name,grade FROM students;

--5 tabloya data ekleme DDL
INSERT INTO students VALUES('1001','Sherlock holmes',99.8,'2023-10-04');
INSERT INTO students VALUES('1002','Harry Potter',100.0,now());

--6-tablodaki tum kayitlari(datalari ) Görüntüleme  DQL

SELECT * FROM students;


--7-tablodaki bazi degerli girmee
INSERT INTO students(name,grade)VALUES('Yusuf Alas',88.8);

--8-tablodaki belirli stundaki datalri goruntuleme
SELECT name,grade FROM students;


select *from grades













