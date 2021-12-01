Istnieją 3 grupy uprawnień w bazie danych MySQL:
1. Do zarządzani danymi: select, insert, delete, update.
2. Do manipulowania strukturą baz oraz tabel, m.in: create, alter, drop, show.
3. Do administracji serwerem, m.in: grant, create user, reload, super.

Każde z tych uprawnień może być pojedynczo lub zbiorczo przypisywane użytkownikowi. Użytkownik może mieć określona prawa działające na poziomie całego serwera, pojedynczej bazy, a nawet pojedynczej tabeli w bazie.

--wyświetlenie zalogowanych użytkowników:

select current_user();

--alternatywnie: 

select user();

--wyświetlenie wszystkich istniejących użytkowników na serwerze:

select user from mysql.user;

--wyświetlenie uprawnień zalogowanego użytkownika:

show GRANTS;

/*
utworzenie nowego użytkownika - nazwa_użytkownika powinna zostać zamieniona na właściwy login, np: Dawid, Dyrektor czy Handlowiec, identified by to jego hasło
pamiętaj o apostrofach! WAŻNE!!! Localhost oznacza, że jest to użytkownik mający prawa do baz tylko na serwerze, na którym został utworzony:
*/ 
create user 'nazwa_użytkownika'@'localhost' identified by 'qwerty';

/*
nadanie pełnych praw dla przykładowego użytkownika marian do wszystkich baz i tabel na serwerze (pierwsza * oznacza wszystkie bazy, kolejna * po kropce oznacza wszystkie tabele w bazach, 
'with grant option' oznacza, że marian może również tworzyć użytkowników i nadawać im uprawnienia:
*/

grant all PRIVILEGES on *.* to 'marian'@'localhost' with grant option;

Przykłady:

--utworzenie konta użytkownika bibliotekarz (zapytanie 1) i nadanie mu pełnych praw do bazy biblioteka (zapytanie 2):

create user 'bibliotekarz'@'localhost' identified by 'qwerty';
grant all PRIVILEGES on biblioteka.* to 'bibliotekarz'@'localhost' ;

--utworzenie konta użytkownika bibliotekarz_autor (zapytanie 1) i nadanie mu pełnych praw tylko do tabeli autorzy w bazie biblioteka (zapytanie 2):

create user 'bibliotekarz_autor'@'localhost' identified by 'qwerty';
grant all PRIVILEGES on biblioteka.autorzy to 'bibliotekarz_autor'@'localhost'; 

--utworzenie konta użytkownika bibliotekarz_ksiazka (zapytanie 1) i nadanie mu prawa do wyświetlania, dodawania i aktualizowania danych z tabeli książki bazie biblioteka (zapytanie 2):

create user 'bibliotekarz_ksiazka'@'localhost' identified by 'qwerty';
grant select, insert, update on biblioteka.ksiazki to 'bibliotekarz_ksiazka'@'localhost';

--jeśli chcemy nadać uprawnienia do dwóch tabel w bazie, polecenie należy powtórzyć, np:

grant select, insert, delete on biblioteka.ksiazki to 'bibliotekarz'@'localhost';
grant select, insert, delete on biblioteka.autorzy to 'bibliotekarz'@'localhost';

--aktualizacja haseł użytkownika:

alter user 'bibliotekarz'@'localhost' identified by 'qwerty123';

alternatywnie:

UPDATE mysql.user SET authentication_string = PASSWORD('nowe_hasło') WHERE User = 'użytkownik' AND Host = 'localhost';
FLUSH PRIVILEGES;
