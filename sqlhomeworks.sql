--ODEV1--
/*
1-film tablosunda bulunan title ve description sütunlarındaki verileri sıralayınız.
2-film tablosunda bulunan tüm sütunlardaki verileri film uzunluğu (length) 60 dan büyük VE 75 ten küçük olma koşullarıyla sıralayınız.
3-film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99 VE replacement_cost 12.99 VEYA 28.99 olma koşullarıyla sıralayınız.
4-customer tablosunda bulunan first_name sütunundaki değeri 'Mary' olan müşterinin last_name sütunundaki değeri nedir?
5-film tablosundaki uzunluğu(length) 50 ten büyük OLMAYIP aynı zamanda rental_rate değeri 2.99 veya 4.99 OLMAYAN verileri sıralayınız.
*/


--1-
SELECT title,description FROM film;
--2-
SELECT * FROM film WHERE 60 < length AND length < 75;
--3-
SELECT * FROM film WHERE rental_rate = 0.99 AND (replacement_cost = 12.99 OR replacement_cost = 28.99);
--4-
SELECT last_name FROM customer WHERE first_name = 'Mary';
--5-
SELECT * FROM film WHERE length < 50 AND (rental_rate <> 2.99 AND rental_rate <> 4.99);

--ODEV2--
/*
Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
1-film tablosunda bulunan tüm sütunlardaki verileri replacement cost değeri 12.99 dan büyük eşit 
ve 16.99 küçük olma koşuluyla sıralayınız ( BETWEEN - AND yapısını kullanınız.)
2-actor tablosunda bulunan first_name ve last_name sütunlardaki verileri first_name 'Penelope' veya
'Nick' veya 'Ed' değerleri olması koşuluyla sıralayınız. ( IN operatörünü kullanınız.)
3-film tablosunda bulunan tüm sütunlardaki verileri rental_rate 0.99, 2.99, 4.99
VE replacement_cost 12.99, 15.99, 28.99 olma koşullarıyla sıralayınız. ( IN operatörünü kullanınız.)
Kolay Gelsin.*/

--1-
SELECT * FROM film WHERE replacement_cost BETWEEN 12.99 AND 16.99 ;
--2-
SELECT first_name,last_name FROM actor WHERE first_name IN('Penelope','Nick','Ed');
--3-
SELECT * FROM film WHERE rental_rate IN( 0.99, 2.99, 4.99) AND replacement_cost IN(12.99, 15.99, 28.99);

--ODEV3--
/*
1-country tablosunda bulunan country sütunundaki ülke isimlerinden 'A' karakteri ile başlayıp 'a' karakteri ile sonlananları sıralayınız.
2-country tablosunda bulunan country sütunundaki ülke isimlerinden en az 6 karakterden oluşan ve sonu 'n' karakteri ile sonlananları sıralayınız.
3-film tablosunda bulunan title sütunundaki film isimlerinden en az 4 adet büyük ya da küçük harf farketmesizin 'T' karakteri içeren film isimlerini sıralayınız.
4-film tablosunda bulunan tüm sütunlardaki verilerden title 'C' karakteri ile başlayan ve uzunluğu (length) 90 dan büyük olan ve rental_rate 2.99 olan verileri sıralayınız.
*/

--1-
SELECT * FROM country WHERE country LIKE 'A%' AND country LIKE '%a';
--2-
SELECT country FROM country WHERE country LIKE '_____%n';
--3-
SELECT title FROM film WHERE title ILIKE '%t%t%t%t%';
--4-
SELECT * FROM film WHERE title LIKE 'C%' AND length > 90 AND rental_rate = 2.99;


--ODEV4--
/*
Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
1-film tablosunda bulunan replacement_cost sütununda bulunan birbirinden farklı değerleri sıralayınız.
2-film tablosunda bulunan replacement_cost sütununda birbirinden farklı kaç tane veri vardır?
3-film tablosunda bulunan film isimlerinde (title) kaç tanesini T karakteri ile başlar ve aynı zamanda rating 'G' ye eşittir?
4-country tablosunda bulunan ülke isimlerinden (country) kaç tanesi 5 karakterden oluşmaktadır?
5-city tablosundaki şehir isimlerinin kaç tanesi 'R' veya r karakteri ile biter?
*/

--1-
SELECT DISTINCT replacement_cost FROM film
--2-
SELECT COUNT(DISTINCT replacement_cost) FROM film
--3-
SELECT COUNT(*) FROM film WHERE title LIKE 'T%'AND rating IN ('G');
--4-
SELECT COUNT(country) FROM country WHERE country LIKE '_____'
--5-
SELECT COUNT(*) FROM city WHERE  city ILIKE '%r'


--ODEV5--
/*
Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
1-film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en uzun (length) 5 filmi sıralayınız.
2-film tablosunda bulunan ve film ismi (title) 'n' karakteri ile biten en kısa (length) ikinci(6,7,8,9,10) 5 filmi(6,7,8,9,10) sıralayınız.
3-customer tablosunda bulunan last_name sütununa göre azalan yapılan sıralamada store_id 1 olmak koşuluyla ilk 4 veriyi sıralayınız.
*/

--1--
SELECT * FROM film WHERE title LIKE '%n' ORDER BY length ASC LIMIT 5;
--2--
SELECT * FROM film WHERE title LIKE '%n' ORDER BY length OFFSET 5 LIMIT 5;
--3--
SELECT * FROM customer WHERE store_id = 1 ORDER BY last_name DESC LIMIT 4;


--ODEV6--
/*
1-film tablosunda bulunan rental_rate sütunundaki değerlerin ortalaması nedir?
2-film tablosunda bulunan filmlerden kaç tanesi 'C' karakteri ile başlar?
3-film tablosunda bulunan filmlerden rental_rate değeri 0.99 a eşit olan en uzun (length) film kaç dakikadır?
4-film tablosunda bulunan filmlerin uzunluğu 150 dakikadan büyük olanlarına ait kaç farklı replacement_cost değeri vardır?
*/


--1-
SELECT AVG(rental_rate) FROM film;
--2-
SELECT COUNT(*) FROM film WHERE title LIKE 'C%';
--3-
SELECT MAX(length) FROM film WHERE rental_rate = 0.99;
--4-
SELECT COUNT(DISTINCT replacement_cost) FROM film WHERE length > 150;


--ODEV7--
/*
Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
1.film tablosunda bulunan filmleri rating değerlerine göre gruplayınız.
2.film tablosunda bulunan filmleri replacement_cost sütununa göre grupladığımızda film sayısı
50 den fazla olan replacement_cost değerini ve karşılık gelen film sayısını sıralayınız.
3. customer tablosunda bulunan store_id değerlerine karşılık gelen müşteri sayılarını nelerdir?
4. city tablosunda bulunan şehir verilerini country_id sütununa göre gruplandırdıktan sonra
en fazla şehir sayısı barındıran country_id bilgisini ve şehir sayısını paylaşınız.
*/

--1-
SELECT rating FROM film GROUP BY rating;
--2-
SELECT replacement_cost,COUNT(*) FROM film GROUP BY replacement_cost HAVING COUNT(*) > 50;
--3-
SELECT store_id,COUNT(customer_id) FROM customer GROUP BY store_id;
--4-
SELECT country_id,COUNT(country_id) FROM city GROUP BY country_id  ORDER BY COUNT(country_id) DESCLIMIT 1;


--ODEV8--
/*
1-test veritabanınızda employee isimli sütun bilgileri id(INTEGER), name VARCHAR(50), birthday DATE, email VARCHAR(100) olan bir tablo oluşturalım.
2-Oluşturduğumuz employee tablosuna 'Mockaroo' servisini kullanarak 50 adet veri ekleyelim.
3-Sütunların her birine göre diğer sütunları güncelleyecek 5 adet UPDATE işlemi yapalım.
4-Sütunların her birine göre ilgili satırı silecek 5 adet DELETE işlemi yapalım.
*/

--1--
CREATE TABLE IF NOT EXISTS employee(
  id INTEGER,
  name VARCHAR(50),
  birthday DATE,
  email VARCHAR(100)
);
--2--
insert into employee (id, name, birthday, email) values (1, 'Vanya', '2021-12', 'vroxbrough0@indiatimes.com');
insert into employee (id, name, birthday, email) values (2, 'Lucretia', '2022-07', 'lmurley1@wix.com');
insert into employee (id, name, birthday, email) values (3, 'Devonne', '2022-03', 'dklossmann2@shop-pro.jp');
insert into employee (id, name, birthday, email) values (4, 'Sherline', '2022-07', 'smackrill3@google.ca');
insert into employee (id, name, birthday, email) values (5, 'Marcelle', '2022-10', 'mheynel4@latimes.com');
insert into employee (id, name, birthday, email) values (6, 'Marlo', '2021-12', 'merlam5@businessweek.com');
insert into employee (id, name, birthday, email) values (7, 'Cosmo', '2022-05', 'cbelvard6@goo.gl');
insert into employee (id, name, birthday, email) values (8, 'Finley', '2022-08', 'fcrumly7@ocn.ne.jp');
insert into employee (id, name, birthday, email) values (9, 'Tuck', '2022-06', 'tlodwig8@sakura.ne.jp');
insert into employee (id, name, birthday, email) values (10, 'Trista', '2022-09', 'tdecayette9@chron.com');
insert into employee (id, name, birthday, email) values (11, 'Jason', '2022-07', 'jfachea@barnesandnoble.com');
insert into employee (id, name, birthday, email) values (12, 'Sabra', '2022-05', 'ssouttarb@twitter.com');
insert into employee (id, name, birthday, email) values (13, 'Fergus', '2022-04', 'fketchenc@ucla.edu');
insert into employee (id, name, birthday, email) values (14, 'Emelita', '2022-07', 'eatteridged@dell.com');
insert into employee (id, name, birthday, email) values (15, 'Alfredo', '2022-08', 'alindermanne@istockphoto.com');
insert into employee (id, name, birthday, email) values (16, 'Laverne', '2022-06', 'lmcilmurrayf@illinois.edu');
insert into employee (id, name, birthday, email) values (17, 'Asa', '2021-12', 'asunnucksg@behance.net');
insert into employee (id, name, birthday, email) values (18, 'Doti', '2022-01', 'dmccarrickh@youtu.be');
insert into employee (id, name, birthday, email) values (19, 'Wald', '2021-12', 'wgutowskii@diigo.com');
insert into employee (id, name, birthday, email) values (20, 'Sloane', '2022-10', 'sseegarj@whitehouse.gov');
insert into employee (id, name, birthday, email) values (21, 'Jordanna', '2022-02', 'jgrennank@bing.com');
insert into employee (id, name, birthday, email) values (22, 'Shaina', '2022-08', 'soransl@bravesites.com');
insert into employee (id, name, birthday, email) values (23, 'Huntington', '2022-06', 'hjarrittm@paginegialle.it');
insert into employee (id, name, birthday, email) values (24, 'Ellette', '2022-02', 'ealdwichn@pinterest.com');
insert into employee (id, name, birthday, email) values (25, 'Nadiya', '2021-12', 'ntredgeto@barnesandnoble.com');
insert into employee (id, name, birthday, email) values (26, 'Hagen', '2022-07', 'hpaynterp@walmart.com');
insert into employee (id, name, birthday, email) values (27, 'Michell', '2022-01', 'misenorq@dedecms.com');
insert into employee (id, name, birthday, email) values (28, 'Lisabeth', '2022-01', 'lvasilievr@woothemes.com');
insert into employee (id, name, birthday, email) values (29, 'Shannon', '2022-12', 'sdisbreys@ocn.ne.jp');
insert into employee (id, name, birthday, email) values (30, 'Kimbra', '2021-12', 'kcurrant@blog.com');
insert into employee (id, name, birthday, email) values (31, 'Nanci', '2022-04', 'nodonohueu@cmu.edu');
insert into employee (id, name, birthday, email) values (32, 'Wiley', '2022-08', 'wtoghillv@amazon.de');
insert into employee (id, name, birthday, email) values (33, 'Horatia', '2022-11', 'hmcgannw@imageshack.us');
insert into employee (id, name, birthday, email) values (34, 'Lemmy', '2022-12', 'ldohertyx@tuttocitta.it');
insert into employee (id, name, birthday, email) values (35, 'Duane', '2022-11', 'dfruchtery@4shared.com');
insert into employee (id, name, birthday, email) values (36, 'Caresa', '2022-09', 'cmiskellyz@twitpic.com');
insert into employee (id, name, birthday, email) values (37, 'Roderic', '2022-11', 'rdomone10@last.fm');
insert into employee (id, name, birthday, email) values (38, 'Sam', '2022-04', 'sschoenfisch11@vistaprint.com');
insert into employee (id, name, birthday, email) values (39, 'Joellyn', '2022-12', 'jeldon12@bloglines.com');
insert into employee (id, name, birthday, email) values (40, 'Hugues', '2022-12', 'htresvina13@java.com');
insert into employee (id, name, birthday, email) values (41, 'North', '2022-08', 'nbrounfield14@oracle.com');
insert into employee (id, name, birthday, email) values (42, 'Paige', '2022-01', 'pmurrill15@irs.gov');
insert into employee (id, name, birthday, email) values (43, 'Ikey', '2022-05', 'ikirley16@ucoz.ru');
insert into employee (id, name, birthday, email) values (44, 'Jarrod', '2022-05', 'jmucklo17@answers.com');
insert into employee (id, name, birthday, email) values (45, 'Jenn', '2022-08', 'jcronchey18@joomla.org');
insert into employee (id, name, birthday, email) values (46, 'Roy', '2022-06', 'rtellenbrok19@google.com.au');
insert into employee (id, name, birthday, email) values (47, 'Quentin', '2022-07', 'qpickin1a@rakuten.co.jp');
insert into employee (id, name, birthday, email) values (48, 'Gustaf', '2022-08', 'gcanacott1b@cnn.com');
insert into employee (id, name, birthday, email) values (49, 'Blancha', '2022-04', 'bgrzelczak1c@umn.edu');
insert into employee (id, name, birthday, email) values (50, 'Dyna', '2022-10', 'dleather1d@macromedia.com');
--3--
UPDATE employee SET name = 'Dina' WHERE email = 'dleather1d@macromedia.com';
--4--
DELETE FROM employee WHERE name = 'Dina';


--ODEV9--
/*
Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
1-city tablosu ile country tablosunda bulunan şehir (city) ve ülke (country) isimlerini birlikte
görebileceğimiz INNER JOIN sorgusunu yazınız.
2-customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki
first_name ve last_name isimlerini birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.
3-customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki 
first_name ve last_name isimlerini birlikte görebileceğimiz INNER JOIN sorgusunu yazınız.
*/

--1-
SELECT city,country FROM city INNER JOIN country ON country.country_id = city.city_id;
--2-
SELECT payment_id,first_name,last_name FROM payment INNER JOIN customer ON payment.customer_id = customer.customer_id;
--3-
SELECT rental_id,first_name,last_name FROM rental INNER JOIN customer ON customer.customer_id = rental.customer_id;

--ODEV10--
/*
1-city tablosu ile country tablosunda bulunan şehir (city) ve ülke (country)
isimlerini birlikte görebileceğimiz LEFT JOIN sorgusunu yazınız.
2-customer tablosu ile payment tablosunda bulunan payment_id ile customer tablosundaki
first_name ve last_name isimlerini birlikte görebileceğimiz RIGHT JOIN sorgusunu yazınız.
3-customer tablosu ile rental tablosunda bulunan rental_id ile customer tablosundaki
first_name ve last_name isimlerini birlikte görebileceğimiz FULL JOIN sorgusunu yazınız.
*/

--1-

SELECT city,country
FROM country
LEFT JOIN city 
ON country.country_id = city.country_id;

--2-

SELECT payment_id,first_name,last_name
FROM payment
RIGHT JOIN customer 
ON payment.customer_id = customer.customer_id


--3-

SELECT rental.rental_id, customer.first_name, customer.last_name
FROM rental
FULL JOIN customer
ON rental.customer_id = customer.customer_id;


--ODEV11--
/*
Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
1-actor ve customer tablolarında bulunan first_name sütunları için tüm verileri sıralayalım.
2-actor ve customer tablolarında bulunan first_name sütunları için kesişen verileri sıralayalım.
3-actor ve customer tablolarında bulunan first_name sütunları için ilk tabloda bulunan ancak ikinci tabloda bulunmayan verileri sıralayalım.
4-İlk 3 sorguyu tekrar eden veriler için de yapalım.
*/

--1-
SELECT first_name FROM actor UNION SELECT first_name FROM customer;

--2-
SELECT first_name FROM actor INTERSECT SELECT first_name FROM customer;
--3--
SELECT first_name FROM actor EXCEPT SELECT first_name FROM customer;
--4-
  --4.1-
  SELECT first_name FROM actor UNION ALL SELECT first_name FROM customer;
  --4.2-
  SELECT first_name FROM actor INTERSECT ALL SELECT first_name FROM customer;
  --4.3-
  SELECT first_name FROM actor EXCEPT ALL SELECT first_name FROM customer;


--ODEV12--
/*
Aşağıdaki sorgu senaryolarını dvdrental örnek veri tabanı üzerinden gerçekleştiriniz.
1-film tablosunda film uzunluğu length sütununda gösterilmektedir. Uzunluğu ortalama film uzunluğundan fazla kaç tane film vardır?
2-film tablosunda en yüksek rental_rate değerine sahip kaç tane film vardır?
3-film tablosunda en düşük rental_rate ve en düşün replacement_cost değerlerine sahip filmleri sıralayınız.
4-payment tablosunda en fazla sayıda alışveriş yapan müşterileri(customer) sıralayınız.
*/

--1-
SELECT COUNT(*)
FROM film
WHERE length >
(
SELECT AVG(length)
FROM film
);
--2-
SELECT COUNT(*) 
FROM film
WHERE rental_rate = 
(
SELECT MAX(rental_rate)
FROM film
);
--3-
SELECT *
FROM film
WHERE rental_rate = 
(
SELECT MIN(rental_rate)
FROM film
)
AND
replacement_cost = 
(
SELECT MIN(replacement_cost)
FROM film
)
--4-
SELECT customer_id, SUM(amount)  FROM payment GROUP BY customer_id ORDER BY SUM DESC LIMIT 5;
