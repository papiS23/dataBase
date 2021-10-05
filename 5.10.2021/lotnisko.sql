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
);

INSERT INTO `samoloty` (`id`, `typ`, `linie`) VALUES
(1, 'Boening 787', 'RYANAIR'),
(2, 'Boening 737', 'WIZZAIR'),
(3, 'Boening 787', 'SWISS'),
(4, 'Boening 737', 'LUFTHANSA'),
(5, 'Boening 838', 'EMIRATES'),
(6, 'Airbus A380', 'AirFrance');


INSERT INTO `odloty` (`id`, `samoloty_id`, `nr_rejsu`, `kierunek`, `czas`, `dzien`, `status_lotu`) VALUES
(1, 1, 'FR1646', 'Neapol', '09:20:00', '2019-07-25', 'wystartowal'),
(2, 1, 'FR1327', 'ALICANTE', '09:10:00', '2019-07-25', 'Opozniony 10 min'),
(3, 2, 'W63425', 'Warszawa', '09:45:00', '2019-07-25', 'odprawa'),
(4, 3, 'LX5647', 'Londyn LT', '10:03:00', '2019-07-25', 'odprawa'),
(5, 3, 'LX5673', 'Malta', '10:06:00', '2019-07-25', ''),
(6, 3, 'LX5622', 'Wieden', '10:13:00', '2019-07-25', ''),
(7, 4, 'LH9821', 'Berlin', '10:16:00', '2019-07-25', ''),
(8, 4, 'LH9888', 'Hamburg', '10:19:00', '2019-07-25', ''),
(9, 4, 'LH9331', 'Monachium', '10:22:00', '2019-07-25', ''),
(10, 2, 'W68769', 'Zurych', '09:56:00', '2019-07-25', 'boarding'),
(11, 5, 'W68769', 'Dubaj', '09:55:00', '2019-07-25', 'boarding');

INSERT INTO `przyloty` (`id`, `samoloty_id`, `nr_rejsu`, `kierunek`, `czas`, `dzien`, `status_lotu`) VALUES
(1, 2, 'W63454', 'Warszawa', '09:45:00', '2019-07-29', 'wyladowal'),
(2, 3, 'LX3447', 'Londyn LT', '10:03:00', '2019-07-29', 'opoznienie 10 min'),
(3, 3, 'LX5473', 'Malta', '10:06:00', '2019-07-29', 'planowy'),
(4, 3, 'LX5728', 'Wieden', '10:13:00', '2019-07-29', ''),
(5, 4, 'LH9829', 'Berlin', '10:16:00', '2019-07-29', ''),
(6, 4, 'LH9898', 'Hamburg', '10:19:00', '2019-07-29', ''),
(7, 4, 'LH3331', 'Monachium', '10:22:00', '2019-07-29', ''),
(8, 2, 'W68546', 'Zurych', '10:33:00', '2019-07-29', ''); 