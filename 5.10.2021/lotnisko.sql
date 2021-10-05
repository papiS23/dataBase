create table samoloty (
    id int primary key auto_increment,
    typ varchar(20),
    linie varchar(10)
);
create table przyloty (
    id int auto_increment primary key,
    samoloty_id int,
    nr_rejsu varchar(8),
    kierunek varchar(10),
    czas time,
    dzien date,
    status_lotu text,
    foreign key (samoloty_id) references samoloty(id)
)