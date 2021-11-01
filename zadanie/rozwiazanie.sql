## Zadanie 1
select * 
from ksiazki 
order by nazwiskoautora;

## Zadanie 2
select * 
from zamowienia 
where status = "wyslano";

## Zadanie 3
select * 
from klienci 
where nazwisko = "Skorupa";

## Zadanie 4
select * 
from ksiazki 
where tytul like "%PHP%";

## Zadanie 5
select * 
from zamowienia 
order by data desc;

## Zadanie 6
select imie, nazwisko, idzamowienia, data 
from zamowienia 
inner join klienci on zamowienia.idklienta = klienci.idklienta;

## Zadanie 7
select imie as "Imie klienta", nazwisko as "Nazwisko klienta", idzamowienia as "Numer zamowienia", data as "Data zamowienia" 
from zamowienia 
inner join klienci on zamowienia.idklienta = klienci.idklienta;

## Zadanie 8
select imie, nazwisko, miejscowosc 
from klienci 
inner join zamowienia 
on klienci.idklienta = zamowienia.idklienta where idksiazki = 5;

## Zadanie 9
select ksiazki.tytul 
from ksiazki 
inner join zamowienia on zamowienia.idksiazki = ksiazki.idksiazki 
inner join klienci on klienci.idklienta = zamowienia.idklienta 
where klienci.imie = "Karenina";

## Zadanie 10
select klienci.imie, klienci.nazwisko, zamowienia.idzamowienia, zamowienia.data, zamowienia.status, ksiazki.tytul
from klienci
inner join zamowienia on zamowienia.idklienta = klienci.idklienta
inner join ksiazki on ksiazki.idksiazki = zamowienia.idksiazki
where klienci.nazwisko = "Rutkowski"
order by zamowienia.data asc;



select klienci.imie, zamowienia.idzamowienia 
from zamowienia
left join klienci on zamowienia.idklienta = klienci.idklienta;