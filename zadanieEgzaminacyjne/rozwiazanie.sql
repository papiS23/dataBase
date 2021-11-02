## Zapytanie 1
select nazwa, cena from Uslugi;

## Zapytanie 2
select imie, rodzaj, nastepna_wizyta, telefon 
from Zwierzeta 
where nastepna_wizyta != 0;

## Zapytanie 3
select Zwierzeta.rodzaj, Uslugi.nazwa 
from Zwierzeta
inner join Uslugi
on Zwierzeta.Usluga_id = Uslugi.id;

## Zapytanie 4
select min(cena) from Uslugi;