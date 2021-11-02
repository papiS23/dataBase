create database spozywczak_4i;

use spozywczak_4i;

create table produkty (
    id int auto_increment primary key, 
    nazwa varchar (20), 
	dostawca varchar(20), 
    ilosc int, 
    cena_sz float
    );


insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('maslo', 'mlekol', 23, 2.30);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('mleko', 'mlekol', 31, 2.50);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('cukier', 'cukpol', 15, 3.50);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('woda', 'wodpol', 65, 2.30);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('baton', 'cukpol', 41, 2.30);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('chleb', 'chlebpol', 7, 2.30);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('mleko', 'mleczarniopol', 14, 2.45);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('chrupki', 'chruppol', 12, 1.30);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('chipsy', 'chippol', 75, 2.90);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('musztarda', 'przetworpol', 24, 1.30);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('majonez', 'przetworpol', 11, 5.30);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('majonez', 'cukpol', 21, 6.30);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('musztarda', 'przetworpol', 35, 2.30);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('sok owocowy', 'wodpol', 21, 3.35);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('chleb', 'piekarniopol', 43, 6.05);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('herbatniki', 'piekarniopol', 33, 7.55);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('cukierki', 'cukpol', 123, 1.05);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('maslo', 'chippol', 23, 9.05);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('herbata', 'herbapol', 3, 7.05);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('mleko', 'chippol', 21, 2.05);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('rogale', 'chippol', 34, 2.55);
insert into produkty(nazwa, dostawca, ilosc, cena_sz) values ('oliwki', 'przetworpol', 3, 9.05);

select * from produkty;

## ilosc produktow w tabeli
select count(id) as "Ilosc produktow" from produkty;

## ilosc produktow dostarczanych przez dostawcow
select dostawca, count(id) 
from produkty
group by dostawca;

## dostawcy ktorzy dostarczaja jeden produkt
select dostawca, count(id) 
from produkty
group by dostawca
having count(id) = 1;

## wartosc produktow
select concat(round(sum(cena_sz*ilosc), 2), " zl")
as "wartosc towaru" 
from produkty;

## srednia cena dla danego produktu
select dostawca, concat(round(avg(cena_sz), 2), " zl") as "srednia cena"
from produkty
group by dostawca;

## najtanszy produkt
select nazwa, cena_sz
from produkty
where cena_sz = (select min(cena_sz) from produkty);

## najdrozszy produkt
select nazwa, cena_sz
from produkty
where cena_sz = (select max(cena_sz) from produkty);


