## 1.1
select count(id) as "Ilosc rekordow" from produkty;

## 1.2
select round(sum(cena_sz)*ilosc, 2) from produkty;

## 1.3
select nazwa, cena_sz from produkty where cena_sz = (select min(cena_sz) from produkty);

## 1.4
select dostawca, count(nazwa) from produkty group by dostawca;

## 1.5
select dostawca, count(nazwa) from produkty group by dostawca having count(nazwa) > 1;

## 1.6
select dostawca, round(avg(cena_sz), 2) from produkty group by dostawca;

## 2.1
select stanowiska.stanowisko, round(avg(pracownicy.pensja), 2) 
from stanowiska join pracownicy on stanowiska.id_stanowisko = pracownicy.stanowisko
group by stanowiska.stanowisko;

## 2.2
select stanowiska.stanowisko, round(avg(pracownicy.pensja), 2) 
from stanowiska join pracownicy on stanowiska.id_stanowisko = pracownicy.stanowisko
group by stanowiska.stanowisko having round(avg(pracownicy.pensja), 2) > 3000;

## 3.1
select dzial.nazwadzial, count(pracownik.idpracownik) 
from dzial join pracownik on pracownik.dzial = dzial.iddzial 
group by dzial;

## 3.2
select dzial.nazwadzial, count(pracownik.idpracownik) 
from dzial join pracownik on pracownik.dzial = dzial.iddzial 
group by dzial having count(pracownik.idpracownik) > 1;

## 3.3
select dzial.nazwadzial as "Dzial", count(pracownik.idpracownik) as "Ilosc pracownikow", round(avg(pracownik.wiek), 2)  as "Srednia wieku", min(pracownik.wiek) as "Wiek najmlodszego pracownika", max(pracownik.wiek) as "Wiek najstarszego pracownika"
from dzial join pracownik on pracownik.dzial = dzial.iddzial 
group by dzial;

## 3.4
SELECT imiepracownik, nazwiskopracownik, nazwadzial, wiek 
FROM pracownik 
INNER JOIN dzial ON pracownik.dzial = dzial.iddzial 
WHERE wiek IN (SELECT min(wiek) FROM pracownik INNER JOIN dzial ON pracownik.dzial = dzial.iddzial GROUP BY dzial);

## 3.5
SELECT imiepracownik, nazwiskopracownik, nazwadzial, wiek 
FROM pracownik 
INNER JOIN dzial ON pracownik.dzial = dzial.iddzial 
WHERE wiek IN (SELECT max(wiek) FROM pracownik INNER JOIN dzial ON pracownik.dzial = dzial.iddzial GROUP BY dzial);

