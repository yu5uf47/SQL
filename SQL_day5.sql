-----------DAY 5 -----------
--26-UPDATE:?

--CREATE:INSERT
--READ:SELECT
--UPDATE:?
--DELETE:DELETE

--26-UPDATE ..
   --SET sütunadı=yeni değer
   --WHERE koşul            :koşulu sağlayan satırlardaki dataları değiştirir, günceller


--idsi 123456789 olan çalışanın isyeri ismini 'Trendyol' olarak güncelleyeniz.
select * from calisanlar3;

UPDATE calisanlar3
set isyeri='Trendyol'
where id=123456789;

select * from calisanlar3;


-- id’si 567890123 olan çalışanın ismini 'Veli Yıldırım' ve
--sehirini 'Bursa' olarak güncelleyiniz.


UPDATE calisanlar3
set isim='Veli Yildirim', sehir='bursa'
where id=567890123;


--  markalar tablosundaki marka_id değeri 102 ye eşit veya büyük olanların marka_id’sini 2 ile çarparak değiştirin.

update markalar
set marka_id=marka_id*2
where marka_id>=102;


-- markalar tablosundaki tüm markaların calisan_sayisi değerlerini marka_id ile toplayarak güncelleyiniz.

update markalar
set calisan_sayisi=calisan_sayisi+marka_id


--calisanlar3 tablosundan Ali Seker'in isyerini, 'Veli Yıldırım' ın isyeri ismi ile güncelleyiniz.
update calisanlar3
set isyeri=(select isyeri from calisanlar3 where isim='Veli Yildirim')
where isim='Ali Seker';



--calisanlar3 tablosunda maasi 1500 olanların isyerini, markalar tablosunda
--calisan_sayisi 20000 den fazla olan markanın ismi ile değiştiriniz.

update calisanlar3 set isyeri=(select marka_isim from markalar where calisan_sayisi>20000) where maas=1500;



--calisanlar3 tablosundaki isyeri 'Vakko' olanların sehir bilgisinin sonuna ' Şubesi' ekleyiniz.

update calisanlar3
set sehir= sehir||' subesi'
where isyeri='Vakko';

UPDATE calisanlar3
SET sehir=CONCAT(sehir,'i')
WHERE isyeri='Vakko'



select * from calisanlar3;
select * from markalar;


--27-IS NULL condition
CREATE TABLE people
(
ssn char(9),
name varchar(50),
address varchar(50)
);
INSERT INTO people VALUES(123456789, 'Ali Can', 'Istanbul');
INSERT INTO people VALUES(234567890, 'Veli Cem', 'Ankara');
INSERT INTO people VALUES(345678901, 'Mine Bulut', 'Izmir');
INSERT INTO people (ssn, address) VALUES(456789012, 'Bursa');
INSERT INTO people (ssn, address) VALUES(567890123, 'Denizli');
INSERT INTO people (ssn, name) VALUES(567890123, 'Veli Han');
SELECT * FROM people;

--people tablosundaki name sütununda NULL olan değerleri listleyiniz.

select *
from people
where name is null

--people tablosundaki adres sütununda NULL olmayan değerleri listleyiniz.

select *
from people
where address is not null

--people tablosunda name sütunu null olanların name değerini 
--'MISSING...' olarak güncelleyiniz..


update people
set  name='missing...'
where name is null;

--people tablosunda address sütunu null olanların address değerini 
--'MISSING...' olarak güncelleyiniz..

update people
set  address='MISSING...'
where address is null;




select * from people;


--28-ORDER BY
--kayitlari belirli bir veya daha fazla sutuna gore varsayilan olarak natural(artan, ASCENDING) olarak siralamamizi saglar

CREATE TABLE person
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),
adres varchar(50)
);
INSERT INTO person VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO person VALUES(234567890, 'Veli','Cem', 'Ankara');
INSERT INTO person VALUES(345678901, 'Mine','Bulut', 'Ankara');
INSERT INTO person VALUES(256789012, 'Mahmut','Bulut', 'Istanbul');
INSERT INTO person VALUES (344678901, 'Mine','Yasa', 'Ankara');
INSERT INTO person VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');
INSERT INTO person VALUES(256789018, 'Samet','Bulut', 'Izmir');
INSERT INTO person VALUES(256789013, 'Veli','Cem', 'Bursa');
INSERT INTO person VALUES(256789010, 'Samet','Bulut', 'Ankara');
SELECT * FROM person;


--person tablosundaki tüm kayıtları adrese göre (artan) sıralayarak listeleyiniz.

SELECT * 
FROM person
ORDER BY adres;--default:ASC:artan

SELECT * 
FROM person
ORDER BY adres ASC;--okunabilirlik artar


--person tablosundaki tüm kayıtları soyisime göre (azalan) sıralayarak listeleyiniz.

SELECT * 
FROM person
ORDER BY soyisim DESC;--DESCENDING:azalan

--person tablosundaki soyismi Bulut olanları isime göre (azalan) sıralayarak listeleyiniz.



SELECT * 
FROM person
where soyisim='Bulut'
ORDER BY isim desc;


--alternatif
SELECT *
FROM person
WHERE soyisim='Bulut'
ORDER BY 2 DESC;--not recommended:tavsiye edilmez


--person tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyiniz

SELECT *
FROM person
ORDER BY isim ASC, soyisim DESC



--İsim ve soyisim değerlerini, soyisim kelime uzunluklarına göre sıralayarak listeleyiniz.

select isim,soyisim
from person
order by length(soyisim)

SELECT isim,soyisim,LENGTH(soyisim) AS karakter_sayisi
FROM person
ORDER BY LENGTH(soyisim) 


--Tüm isim ve soyisim değerlerini aralarında bir boşluk ile aynı sutunda çağırarak her bir isim ve 
--soyisim değerinin toplam uzunluğuna göre sıralayınız.

select concat(isim,' ',soyisim) as ad_soyad,length(isim||soyisim) karater_sayisi
from person
order by length(isim||soyisim);


select isim||' '||soyisim ad_soyadd 
from person
order by length(isim)+length(soyisim) 
 



--calisanlar3 tablosunda maaşı ortalama maaştan yüksek olan çalışanların
--isim,şehir ve maaşlarını maaşa göre artan sıralayarak listeleyiniz.

select isim,sehir,maas
from calisanlar3
where maas>(select avg(maas) from calisanlar3)
order by maas asc



guncellme 
null nasil tanimlanir is null
siralma


