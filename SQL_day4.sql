-------------DAY'4 NT-------------------
--23-ALIASES: gecici isim etiket rumuz

CREATE TABLE workers(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);

INSERT INTO workers VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO workers VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO workers VALUES(345678901, 'Mine Bulut', 'Izmir');

SELECT * FROM workers;

select calisan_id as yusuf from workers; -- as ten sonra adini degistiriyor


select  calisan_id,calisan_isim from woe







--24-SUBQUERY--NESTED QUERY
--24-a-SUBQUERY: WHERE ile kullanımı

select * from calisanlar3;
select * from markalar;

--marka_id si 100 olan markada çalışanları listeleyiniz.

select marka_isim from markalar where marka_id=100; --vakko
select * from calisanlar3 where isyeri='Vakko';

--2. yol
select *   --parantez icine outerqery denir
from calisanlar3
where isyeri=  (select marka_isim  --parantez icine subqury denir
			    from markalar 
			    where marka_id=100)
			  
			  
			  
--INTERVIEW QUESTION:calisanlar3 tablosunda max maaşı alan çalışanın tüm fieldlarını listeleyiniz. 			  
select *
from calisanlar3
where maas=(select max(maas) from calisanlar3)
			  

--Interview Question:calisanlar3 tablosunda ikinci en yüksek maaşı gösteriniz.ÖDEV
-- max maasi silip 2. gelen degeri aliriz
select * from calisanlar3 where maas= (delete max(maas) from calisanlar3 )and (select max(maas) from calisanlar3)



--calisanlar3 tablosunda max veya min maaşı alan çalışanların
-- tüm fieldlarını gösteriniz.

select *
from calisanlar3
where  maas=(SELECT MAX(maas) FROM calisanlar3) OR maas=(SELECT MIN(maas) FROM calisanlar3);


select *
from calisanlar3
where  maas in ((SELECT MAX (maas) FROM calisanlar3),(SELECT MIN(maas) FROM calisanlar3));

-- Ankara'da calisani olan markalarin marka id'lerini ve calisan sayilarini listeleyiniz.


SELECT marka_id, calisan_sayisi
FROM markalar
WHERE marka_isim IN (SELECT isyeri FROM calisanlar3 WHERE sehir='Ankara')


-- = tek bir sonuca bakar
-- in çoğul

--marka_id'si 101’den büyük olan marka çalişanlarinin isim, maaş ve şehirlerini listeleyiniz.

select maas,isim,isyeri
from calisanlar3
where isyeri in (select marka_isim from markalar where marka_id>101)


-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve 
--bu markada calisanlarin isimlerini ve maaşlarini listeleyiniz.



select isim,maas,isyeri
from calisanlar3
where isyeri in (select marka_isim from markalar where calisan_sayisi>15000)




--24-b-SUBQUERY: SELECT komutundan sonra kullanımı

-- Her markanin id'sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.

SELECT marka_id, marka_isim, (SELECT COUNT(DISTINCT(sehir)) 
							  FROM calisanlar3 
							  WHERE isyeri=marka_isim) AS sehir_sayisi
FROM markalar--correlated subquery

--SELECT DISTINCT(sehir) FROM calisanlar3;--sadece farklı olanları listeler



--view olsturma

create view marka_sehir_sayisi AS
SELECT marka_id, marka_isim, (SELECT COUNT(DISTINCT(sehir)) 
							  FROM calisanlar3 
							  WHERE isyeri=marka_isim) AS sehir_sayisi
FROM markalar



-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi,(SELECT MAX(maas) FROM calisanlar3 WHERE isyeri=marka_isim)AS max_maas,
								 (SELECT MIN(maas) FROM calisanlar3 WHERE isyeri=marka_isim) AS min_maas
FROM markalar;





--25-EXISTS Cond.
--Bir SQL sorgusunda alt sorgunun sonucunun boş olup olmadığını kontrol etmek için kullanılır.
--Eğer alt sorgu sonucu boş değilse, koşul sağlanmış sayılır ve sorgunun geri kalanı işletilir.
--Alt sorgu en az bir satır döndürürse sonucu EXISTS doğrudur.
--Alt sorgunun satır döndürmemesi durumunda, sonuç EXISTS yanlıştır.


CREATE TABLE mart
(     
urun_id int,      
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

CREATE TABLE nisan 
(     
urun_id int ,
musteri_isim varchar(50),
urun_isim varchar(50)
);

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

select * from mart;
select * from nisan;

select *
from nisan
where exists(select urun_isim from mart where urun_isim='Toyota') 


--Mart ayında 'Toyota' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.

SELECT *
FROM nisan
WHERE EXISTS (SELECT urun_isim FROM mart WHERE urun_isim='Toyota')

--Mart ayında 'Volvo' satışı yapılmış ise Nisan ayındaki tüm ürünlerin bilgilerini listeleyiniz.
SELECT *
FROM nisan
WHERE EXISTS (SELECT urun_isim FROM mart WHERE urun_isim='Volvo')

--Mart ayında satılan ürünün urun_id ve musteri_isim'lerini, eğer Nisan ayında da satılmışsa, listeleyen bir sorgu yazınız. 

SELECT urun_id,musteri_isim
FROM mart
WHERE EXISTS (SELECT urun_isim FROM nisan WHERE nisan.urun_isim=mart.urun_isim)

--tablolar için alias kullanalım
SELECT urun_id,musteri_isim
FROM mart AS m
WHERE EXISTS (SELECT urun_isim FROM nisan AS n WHERE n.urun_isim=m.urun_isim)

