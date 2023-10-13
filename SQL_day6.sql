--------------DAY'6---------------------
--29-GROUP BY clause:

CREATE TABLE manav
(
isim varchar(50),
urun_adi varchar(50),
urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);  
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);


SELECT * FROM manav;


--Manav tablosundaki tüm isimleri ve her bir isim için toplam ürün miktarını görüntüleyiniz.

select isim,sum(urun_miktar) 
from manav
group by isim
order by sum(urun_miktar) desc

--Her bir ismin aldığı her bir ürünün toplam miktarını isme göre sıralı görüntüleyi

select isim,urun_adi, sum(urun_miktar)
from manav
group by isim,urun_adi
order by isim


--NOT:group by ile gruplama yapıldığında SELECTden sonra sadece gruplanan sütun adı veya
--herhangi bir sütunun AGGREGATE fonk. ile kullanımı mümkündür.

SELECT isim,urun_adi,SUM(urun_miktar)
FROM manav
GROUP BY isim,urun_adi


--NOT : GROUP BY dan sonraki sütun sırası önemli, ilk sütundan başlayarak gruplar, AGGREGATE fonk. kullanıldığında 
--en son (en içteki) gruba göre hesaplanır.




--ürün ismine göre her bir ürünü alan toplam kişi sayısı gösteriniz.
SELECT urun_adi,COUNT(DISTINCT isim) kisi_sayisi
FROM manav
GROUP BY urun_adi



--Isme göre alınan toplam ürün miktarı ve ürün çeşit miktarını bulunuz
SELECT isim,SUM(urun_miktar) toplam_kg,COUNT(DISTINCT urun_adi) urun_cesidi
FROM manav
GROUP BY isim


--Alinan ürün miktarina gore musteri sayisinı görüntüleyiniz.
--musteri sayisina göre artan sıralayınız.


SELECT urun_miktar, COUNT(urun_adi) AS toplam_urun_sayısı
FROM manav
GROUP BY urun_miktar
ORDER BY toplam_urun_sayısı ASC




--30-HAVING clause:group by komutundan sonra filtrelemek için aggregate fonk ile birlikte kullanılır
-- grup siramadan sonra where gibi kullanilir siralanir  where sutun icinde olur   where gruplamadan once kullanilir

DROP TABLE personel;

CREATE TABLE personel  (
id int,
isim varchar(50),
sehir varchar(50), 
maas int,  
sirket varchar(20)
);

INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');
INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
INSERT INTO personel VALUES(678901245, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel;

--Her bir şirketin MIN maas bilgisini, bu bilgi eğer 4000 den fazla ise görüntüleyiniz.
select sirket,min(maas)
from personel
group by sirket
having min(maas)>4000


--Maaşı 4000 den fazla olan çalışanlardan, her bir şirketin MIN maas bilgisini görüntüleyiniz.

select sirket, min(maas)
from personel
where maas>4000
group by sirket

--NOT:gruplama yaptıktan sonra sonuçları filtrelemek için HAVING aggregate fonk ile
--gruplamadan önce mevcut kayıtları filtrelemek için ise WHERE kullanılır.

--Her bir ismin aldığı toplam gelir 10000 liradan fazla ise ismi ve toplam maasi gösteren sorgu yaziniz.

SELECT isim, SUM(maas) toplam_gelir
FROM personel
GROUP BY isim
HAVING SUM(maas)>10000


--Eğer bir şehirde çalışan personel(id) sayısı 1’den çoksa sehir ismini ve personel sayısını veren sorgu yazınız

SELECT sehir, COUNT(DISTINCT id) AS personel_sayisi
FROM personel
GROUP BY sehir
HAVING COUNT(DISTINCT id)>1


--Eğer bir şehirde alınan MAX maas 5000’den düşükse sehir ismini ve MAX maasi veren sorgu yazınız.ÖDEV

select * from personel

SELECT maas,sehir
FROM personel
GROUP BY maas,sehir
HAVING max ( maas)<5000






--having kullan








--31-UNION: iki farkli sorgu sonucunu birlestirerek goruntulemeyi saglar 
--          tekrarli olanlari gostermez
--  UNINON ALL union ile ayni islevi gorur tekrarli olanlari da gösterir 



DROP TABLE developers;

CREATE TABLE developers(
id SERIAL PRIMARY KEY,
name varchar(50),
email varchar(50) UNIQUE,
salary real,
prog_lang varchar(20),
city varchar(50),
age int	
);

INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Abdullah Berk','abdullah@mail.com',4000,'Java','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mehmet Cenk','mehmet@mail.com',5000,'JavaScript','Istanbul',35);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Ayşenur Han ','aysenur@mail.com',5000,'Java','Izmir',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Kübra Han','kubra@mail.com',4000,'JavaScript','Istanbul',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Muhammed Demir','muhammed@mail.com',6000,'Java','Izmir',25);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Fevzi Kaya','fevzi@mail.com',6000,'Html','Istanbul',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Enes Can','enes@mail.com',5500,'Css','Ankara',28);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Tansu Han','tansu@mail.com',5000,'Java','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Said Ran','said@mail.com',4500,'Html','Izmir',33);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Mustafa Pak','mustafa@mail.com',4500,'Css','Bursa',32);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Hakan Tek','hakan@mail.com',7000,'C++','Konya',38);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Deniz Çetin','deniz@mail.com',4000,'C#','Istanbul',30);
INSERT INTO developers(name,email,salary,prog_lang,city,age) VALUES('Betül Çetin','ummu@mail.com',4000,'C#','Bursa',29);


CREATE TABLE contact_info(
address_id int,
street varchar(30),
number int,	
city varchar(30),
FOREIGN KEY(address_id) REFERENCES developers(id)	
);

INSERT INTO contact_info VALUES(1,'Kaya Sok.',5,'Bursa');
INSERT INTO contact_info VALUES(2,'Kaya Sok.',3,'Ankara');
INSERT INTO contact_info VALUES(3,'Can Sok.',10,'Bursa');
INSERT INTO contact_info VALUES(4,'Gül Sok.',12,'Ankara');
INSERT INTO contact_info VALUES(5,'Can Sok.',4,'Afyon');
INSERT INTO contact_info VALUES(6,'Taş Sok.',6,'Bolu');
INSERT INTO contact_info VALUES(7,'Dev Sok.',6,'Sivas');
INSERT INTO contact_info VALUES(8,'Dev Sok.',8,'Van');


SELECT * FROM developers;
SELECT * FROM contact_info;


--Yaşı 25’den büyük olan developer isimlerini ve 
--yaşı 30'dan küçük developerların kullandığı prog. dillerini
--birlikte tekrarsız gösteren sorguyu yaziniz

select name from developers where age>25
union
select prog_lang from developers where age<30


select name from developers where age>25
union all
select prog_lang from developers where age<30

--not: union \ union all ile sonuclarini birlestirdigimiz sorgular ayni sayisda sutunu gostermeli ve alt alta gelecek olan bu 
--sutunlar  ayni fata tipini icermeli

--Java kullananların maaşını ve prog. dilini ve 
--JavaScript kullananların yaşını ve prog. dilini
--tekrarsız gösteren sorguyu yaziniz

select salary,prog_lang from developers where prog_lang='Java'
union
select age,prog_lang from developers where prog_lang='JavaScript'



--id si 8 olan developerın çalıştığı şehir ve maaşını
--iletişim adresindeki şehir ve kapı nosunu görüntüleyiniz.


SELECT city,salary maas_kapino FROM developers WHERE id=8
UNION
SELECT city,number maas_kapino FROM contact_info WHERE address_id=8




--developers tablosundaki şehirler ve
--calisanlar3 tablosunda sehirlerin
--tümünü tekrarsız olarak listeleyiniz


select city from developers
union
select sehir from calisanlar3



--32-INTERSECT:iki farklı sorgunun sonuçlarından ortak olanları tekrarsız gösterir
--iki tablonun ortak sonuclarini gosterir



--developers tablosundaki şehirler ve
--calisanlar3 tablosunda sehirlerin
--aynı olanlarını tekrarsız olarak listeleyiniz


SELECT city FROM developers
INTERSECT
SELECT sehir FROM calisanlar3


--developers tablosunda Java kullananların çalıştıkları şehirler ve
--calisanlar3 tablosunda maaşı 1000 den fazla olanların sehirlerinden 
--ortak olanlarını listeleyiniz.

select city from developers where prog_lang='Java'
intersect
select sehir from calisanlar3 where maas>1000





--33-EXCEPT:bir sorgunun sonuçlarından diğer sorgunun sonuçları hariç olarak 
--gösterir

--developers tablosundaki şehirleri
--calisanlar3 tablosunda sehirler hariç olarak listeleyiniz

SELECT city FROM developers
EXCEPT
SELECT sehir FROM calisanlar3

--calisanlar3 tablosundaki şehirleri
--developers tablosunda sehirler hariç olarak listeleyiniz

SELECT sehir FROM calisanlar3
EXCEPT
SELECT city FROM developers

----developers tablosundaki maaşı 4000 den büyük olanların idlerinden
--contact_info tablosunda olmayanları listeleyiniz.

SELECT id FROM developers WHERE salary>4000
EXCEPT
SELECT address_id FROM contact_info 

 --ÖDEV:mart ve nisan tablolarındaki tüm ürünlerin isimlerini tekrarsız listeleyiniz.  
 select urun_isim from mart
union
select urun_isim from nisan

 --ÖDEV:mart ve nisan tablolarındaki ortak ürünlerin isimlerini listeleyiniz.
 
  select urun_isim from mart
intersect
select urun_isim from nisan
 
 --ÖDEV:mart ayında satılıp nisan ayında satılmayan ürünlerin isimlerini listeleyiniz. 
select urun_isim from mart
except
select urun_isim from nisan










