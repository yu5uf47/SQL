CREATE TABLE ogrenciler (
	id integer primary key,
	isim varchar(50),
	adres varchar(100),
	sinav_notu integer
);

-- veya

CREATE TABLE ogrenciler (
	id integer ,
	isim varchar(50),
	adres varchar(100),
	sinav_notu integer,
	CONSTRAINT std_pk PRIMARY KEY(id)
);
​
-- 2 PK olursa :
CREATE TABLE ogrenciler (
	id integer ,
	isim varchar(50),
	adres varchar(100),
	sinav_notu integer,
	CONSTRAINT composite_pk PRIMARY KEY(id,isim)
);

-- niye composite pk ya ihtiyac var mi 
--Tek başına bir sütun Primary Key olma özelliklerini taşımiyorsa, bu özellikleri
--elde etmek için birden fazla sütun birleştirilerek Primary oluşturulur

	
Universite ogrenci numarasi	
2023064120 gibi composite PK dusunelim 
2023 --> ogrencinin kayit oldugu yil
064 --> bolum kodu
120 --> kayit Sirasi


-- Sinav notunun 0-100 arasi olma kontrolu :

CREATE TABLE ogrenciler (
	id integer primary key,
	isim varchar(50),
	adres varchar(100),
	sinav_notu integer CHECK(sinav_notu>0 AND sinav_notu<100)
);

INSERT INTO ogrenciler VALUES(1, 'yusuf','istanbul', 80);
INSERT INTO ogrenciler (id, isim, adres, sinav_notu) values
(2,'zeki','izmir',90),
(3,'cemal','trabzon',65),
(4,'mirac','bursa',45),
(5,'yavuz','antalya',55);


insert into ogrenciler (id,isim,sinav_notu) values
(6,'bilal',95),
(7,'fahri ersoz',20)

select * from ogrenciler;

-- SORU1: ogrenciler tablosundaki id ve isim bilgileri ile tum recordlari getirelim :

SELECT id,isim FROM ogrenciler

-- SORU2: Sinav notu 80'den buyuk olan ogrencilerin tum bilgilerini listele
SELECT * FROM ogrenciler WHERE sinav_notu>80;


-- SORU3: Adresi Ankara olan ogrencilerin tum bilgilerini listele
SELECT * FROM ogrenciler WHERE adres='Ankara';

-- SORU4: Sinav notu 80 ve adresi Istanbul olan ogrenci ismini listele
SELECT isim FROM ogrenciler WHERE adres='Istanbul' AND sinav_notu=80;

-- SORU5: Sinav notu 55 veya 100 olan ogrencilerin tum bilgilerini listele
SELECT * FROM ogrenciler WHERE sinav_notu=55 OR sinav_notu=100;
SELECT * FROM ogrenciler WHERE sinav_notu in (55,100);

select * from ogrenciler where sinav_notu>65 or sinav_notu>85;


-- SORU7: id'si 3 ve 5 arasinda olmayan ogrencilerin isim ve sinav notu listele
SELECT isim,sinav_notu FROM ogrenciler WHERE id not between 3 and 5;

-- SORU8: En yuksek sinav puani nedir

select max(sinav_notu) from ogrenciler;



-- SORU9: İzmir'de yaşayan ve sınav notu 50'den yuksek olan öğrencilerin listesi:
SELECT * FROM ogrenciler WHERE adres='Izmir' AND sinav_notu>50;




-- SORU10: Öğrenci sayısı ve ortalama sınav notu:

select avg(sinav_notu), count (*) from ogrenciler ;
SELECT COUNT(id), ROUND(AVG(sinav_notu)) FROM ogrenciler;


-- SORU11: sinav_notu 52 olan satiri siliniz

DELETE FROM ogrenciler
WHERE sinav_notu = 52;

-- SORU12: ismi Derya Soylu veya Yavuz Bal olan satirlari siliniz

DELETE FROM ogrenciler WHERE isim='derya soylu' or isim= 'yavuz bal';

DELETE From ogrenciler WHERE isim IN ('Derya Soylu','Yavuz Bal');







--truncatede kayıtlar silinir ama drop da tablo silinir

--truncatede geri gelmze


-- delete de geri gelir
--where kullanilabilir










