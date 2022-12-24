drop table if exists users cascade;
drop table if exists roles cascade;
drop table if exists films cascade;
drop table if exists halls cascade;
drop table if exists seats cascade;
drop table if exists sessions cascade;
drop table if exists tickets cascade;

create table users
(
    user_id         serial primary key unique,
    username        varchar(50) unique,
    password        varchar(70) not null,
    name            varchar(20),
    surname         varchar(20),
    role            varchar(5) default 'USER',
    active          boolean default true
);

create table films
(
    film_id serial primary key unique,
    title varchar(100) not null,
    year int,
    genre varchar(100),
    duration int not null,
    country varchar(100)
);

create table halls
(
    hall_id serial primary key unique,
    name varchar(100)
);

create table sessions
(
    date date,
    time time,
    hall_id integer,
    film_id integer not null,
    CONSTRAINT film_sess FOREIGN KEY(film_id) REFERENCES films(film_id),
    CONSTRAINT hall_sess FOREIGN KEY(hall_id) REFERENCES halls(hall_id),
    PRIMARY KEY(date, time, hall_id)
);

CREATE TABLE seats
(
    seat_id serial unique primary key,
    hall_id integer,
    row integer,
    seat integer,
    CONSTRAINT hall_seats FOREIGN KEY(hall_id) REFERENCES halls(hall_id)
);

CREATE TABLE tickets
(
    ticket_id serial primary key unique,
    seat_id integer not null,
    date date,
    time time,
    hall_id integer,
    is_sold bool DEFAULT false,
    CONSTRAINT ticket_seat FOREIGN KEY(seat_id) REFERENCES seats(seat_id),
    CONSTRAINT ticket_sess FOREIGN KEY(date, time, hall_id) REFERENCES sessions(date, time, hall_id)
);

INSERT INTO users(username, password, role)
VALUES ('kekekeke', 'kekekeke', 'ADMIN'),
       ('director', 'director', 'USER');

INSERT INTO films(title, year, genre, duration, country)
VALUES ('Гарри Поттер', 2003, 'Фантастика', 127, 'Великобритания'),
       ('Матрица', 2021, 'Комедия', 96, 'США'),
       ('Горько', 2016, 'Ужасы', 113, 'Россия'),
       ('Человек-паук', 1999, 'Приключение', 102, 'США'),
       ('Мстители', 2011, 'Комедия', 96, 'США'),
       ('Крестный отец', 2007, 'Триллер', 119, 'США'),
       ('Титаник', 1996, 'Ужасы', 203, 'США');

INSERT INTO halls(hall_id, name)
VALUES (1, 'Темный мир'),
       (2, 'Пират'),
       (3, 'Правая палочка Twix'),
       (4, 'Космос');

INSERT INTO sessions(date, time, hall_id, film_id)
VALUES ('2022-12-29', '12:40', 1, 3),
       ('2023-01-13', '11:10', 3, 5),
       ('2023-02-02', '18:01', 2, 1),
       ('2023-02-02', '12:01', 1, 1),
       ('2022-12-31', '22:22', 4, 1);

INSERT INTO seats(hall_id, row, seat)
VALUES (1, 1, 1),
       (1, 1, 2),
       (1, 1, 3),
       (1, 1, 4),
       (1, 1, 5),
       (1, 1, 6),
       (1, 1, 7),
       (1, 1, 8),
       (1, 1, 9),
       (1, 1, 10),
       (1, 2, 1),
       (1, 2, 2),
       (1, 2, 3),
       (1, 2, 4),
       (1, 2, 5),
       (1, 2, 6),
       (1, 2, 7),
       (1, 2, 8),
       (1, 2, 9),
       (1, 2, 10),
       (1, 3, 1),
       (1, 3, 2),
       (1, 3, 3),
       (1, 3, 4),
       (1, 3, 5),
       (1, 3, 6),
       (1, 3, 7),
       (1, 3, 8),
       (1, 3, 9),
       (1, 3, 10),
       (1, 4, 1),
       (1, 4, 2),
       (1, 4, 3),
       (1, 4, 4),
       (1, 4, 5),
       (1, 4, 6),
       (1, 4, 7),
       (1, 4, 8),
       (1, 4, 9),
       (1, 4, 10),
       (1, 5, 1),
       (1, 5, 2),
       (1, 5, 3),
       (1, 5, 4),
       (1, 5, 5),
       (1, 5, 6),
       (1, 5, 7),
       (1, 5, 8),
       (1, 5, 9),
       (1, 5, 10),
       (2, 1, 1),
       (2, 1, 2),
       (2, 1, 3),
       (2, 1, 4),
       (2, 1, 5),
       (2, 1, 6),
       (2, 1, 7),
       (2, 1, 8),
       (2, 1, 9),
       (2, 1, 10),
       (2, 2, 1),
       (2, 2, 2),
       (2, 2, 3),
       (2, 2, 4),
       (2, 2, 5),
       (2, 2, 6),
       (2, 2, 7),
       (2, 2, 8),
       (2, 2, 9),
       (2, 2, 10),
       (2, 3, 1),
       (2, 3, 2),
       (2, 3, 3),
       (2, 3, 4),
       (2, 3, 5),
       (2, 3, 6),
       (2, 3, 7),
       (2, 3, 8),
       (2, 3, 9),
       (2, 3, 10),
       (2, 4, 1),
       (2, 4, 2),
       (2, 4, 3),
       (2, 4, 4),
       (2, 4, 5),
       (2, 4, 6),
       (2, 4, 7),
       (2, 4, 8),
       (2, 4, 9),
       (2, 4, 10),
       (2, 5, 1),
       (2, 5, 2),
       (2, 5, 3),
       (2, 5, 4),
       (2, 5, 5),
       (2, 5, 6),
       (2, 5, 7),
       (2, 5, 8),
       (2, 5, 9),
       (2, 5, 10),
       (3, 1, 1),
       (3, 1, 2),
       (3, 1, 3),
       (3, 1, 4),
       (3, 1, 5),
       (3, 1, 6),
       (3, 1, 7),
       (3, 1, 8),
       (3, 1, 9),
       (3, 1, 10),
       (3, 2, 1),
       (3, 2, 2),
       (3, 2, 3),
       (3, 2, 4),
       (3, 2, 5),
       (3, 2, 6),
       (3, 2, 7),
       (3, 2, 8),
       (3, 2, 9),
       (3, 2, 10),
       (3, 3, 1),
       (3, 3, 2),
       (3, 3, 3),
       (3, 3, 4),
       (3, 3, 5),
       (3, 3, 6),
       (3, 3, 7),
       (3, 3, 8),
       (3, 3, 9),
       (3, 3, 10),
       (3, 4, 1),
       (3, 4, 2),
       (3, 4, 3),
       (3, 4, 4),
       (3, 4, 5),
       (3, 4, 6),
       (3, 4, 7),
       (3, 4, 8),
       (3, 4, 9),
       (3, 4, 10),
       (3, 5, 1),
       (3, 5, 2),
       (3, 5, 3),
       (3, 5, 4),
       (3, 5, 5),
       (3, 5, 6),
       (3, 5, 7),
       (3, 5, 8),
       (3, 5, 9),
       (3, 5, 10),
       (4, 1, 1),
       (4, 1, 2),
       (4, 1, 3),
       (4, 1, 4),
       (4, 1, 5),
       (4, 1, 6),
       (4, 1, 7),
       (4, 1, 8),
       (4, 1, 9),
       (4, 1, 10),
       (4, 2, 1),
       (4, 2, 2),
       (4, 2, 3),
       (4, 2, 4),
       (4, 2, 5),
       (4, 2, 6),
       (4, 2, 7),
       (4, 2, 8),
       (4, 2, 9),
       (4, 2, 10),
       (4, 3, 1),
       (4, 3, 2),
       (4, 3, 3),
       (4, 3, 4),
       (4, 3, 5),
       (4, 3, 6),
       (4, 3, 7),
       (4, 3, 8),
       (4, 3, 9),
       (4, 3, 10),
       (4, 4, 1),
       (4, 4, 2),
       (4, 4, 3),
       (4, 4, 4),
       (4, 4, 5),
       (4, 4, 6),
       (4, 4, 7),
       (4, 4, 8),
       (4, 4, 9),
       (4, 4, 10),
       (4, 5, 1),
       (4, 5, 2),
       (4, 5, 3),
       (4, 5, 4),
       (4, 5, 5),
       (4, 5, 6),
       (4, 5, 7),
       (4, 5, 8),
       (4, 5, 9),
       (4, 5, 10);

INSERT INTO tickets(seat_id, date, time, hall_id)
VALUES (1 ,'2022-12-29', '12:40', 1),
       (2 ,'2022-12-29', '12:40', 1),
       (3 ,'2022-12-29', '12:40', 1),
       (4 ,'2022-12-29', '12:40', 1),
       (5 ,'2022-12-29', '12:40', 1),
       (6 ,'2022-12-29', '12:40', 1),
       (7 ,'2022-12-29', '12:40', 1),
       (8 ,'2022-12-29', '12:40', 1),
       (9 ,'2022-12-29', '12:40', 1),
       (10 ,'2022-12-29', '12:40', 1),
       (11 ,'2022-12-29', '12:40', 1),
       (12 ,'2022-12-29', '12:40', 1),
       (13 ,'2022-12-29', '12:40', 1),
       (14 ,'2022-12-29', '12:40', 1),
       (15 ,'2022-12-29', '12:40', 1),
       (16 ,'2022-12-29', '12:40', 1),
       (17 ,'2022-12-29', '12:40', 1),
       (18 ,'2022-12-29', '12:40', 1),
       (19 ,'2022-12-29', '12:40', 1),
       (20 ,'2022-12-29', '12:40', 1),
       (21 ,'2022-12-29', '12:40', 1),
       (22 ,'2022-12-29', '12:40', 1),
       (23 ,'2022-12-29', '12:40', 1),
       (24 ,'2022-12-29', '12:40', 1),
       (25 ,'2022-12-29', '12:40', 1),
       (26 ,'2022-12-29', '12:40', 1),
       (27 ,'2022-12-29', '12:40', 1),
       (28 ,'2022-12-29', '12:40', 1),
       (29 ,'2022-12-29', '12:40', 1),
       (30 ,'2022-12-29', '12:40', 1),
       (31 ,'2022-12-29', '12:40', 1),
       (32 ,'2022-12-29', '12:40', 1),
       (33 ,'2022-12-29', '12:40', 1),
       (34 ,'2022-12-29', '12:40', 1),
       (35 ,'2022-12-29', '12:40', 1),
       (36 ,'2022-12-29', '12:40', 1),
       (37 ,'2022-12-29', '12:40', 1),
       (38 ,'2022-12-29', '12:40', 1),
       (39 ,'2022-12-29', '12:40', 1),
       (40 ,'2022-12-29', '12:40', 1),
       (41 ,'2022-12-29', '12:40', 1),
       (42 ,'2022-12-29', '12:40', 1),
       (43 ,'2022-12-29', '12:40', 1),
       (44 ,'2022-12-29', '12:40', 1),
       (45 ,'2022-12-29', '12:40', 1),
       (46 ,'2022-12-29', '12:40', 1),
       (47 ,'2022-12-29', '12:40', 1),
       (48 ,'2022-12-29', '12:40', 1),
       (49 ,'2022-12-29', '12:40', 1),
       (50 ,'2022-12-29', '12:40', 1),
       (101 ,'2023-01-13', '11:10', 3),
       (102 ,'2023-01-13', '11:10', 3),
       (103 ,'2023-01-13', '11:10', 3),
       (104 ,'2023-01-13', '11:10', 3),
       (105 ,'2023-01-13', '11:10', 3),
       (106 ,'2023-01-13', '11:10', 3),
       (107 ,'2023-01-13', '11:10', 3),
       (108 ,'2023-01-13', '11:10', 3),
       (109 ,'2023-01-13', '11:10', 3),
       (110 ,'2023-01-13', '11:10', 3),
       (111 ,'2023-01-13', '11:10', 3),
       (112 ,'2023-01-13', '11:10', 3),
       (113 ,'2023-01-13', '11:10', 3),
       (114 ,'2023-01-13', '11:10', 3),
       (115 ,'2023-01-13', '11:10', 3),
       (116 ,'2023-01-13', '11:10', 3),
       (117 ,'2023-01-13', '11:10', 3),
       (118 ,'2023-01-13', '11:10', 3),
       (119 ,'2023-01-13', '11:10', 3),
       (120 ,'2023-01-13', '11:10', 3),
       (121 ,'2023-01-13', '11:10', 3),
       (122 ,'2023-01-13', '11:10', 3),
       (123 ,'2023-01-13', '11:10', 3),
       (124 ,'2023-01-13', '11:10', 3),
       (125 ,'2023-01-13', '11:10', 3),
       (126 ,'2023-01-13', '11:10', 3),
       (127 ,'2023-01-13', '11:10', 3),
       (128 ,'2023-01-13', '11:10', 3),
       (129 ,'2023-01-13', '11:10', 3),
       (130 ,'2023-01-13', '11:10', 3),
       (131 ,'2023-01-13', '11:10', 3),
       (132 ,'2023-01-13', '11:10', 3),
       (133 ,'2023-01-13', '11:10', 3),
       (134 ,'2023-01-13', '11:10', 3),
       (135 ,'2023-01-13', '11:10', 3),
       (136 ,'2023-01-13', '11:10', 3),
       (137 ,'2023-01-13', '11:10', 3),
       (138 ,'2023-01-13', '11:10', 3),
       (139 ,'2023-01-13', '11:10', 3),
       (140 ,'2023-01-13', '11:10', 3),
       (141 ,'2023-01-13', '11:10', 3),
       (142 ,'2023-01-13', '11:10', 3),
       (143 ,'2023-01-13', '11:10', 3),
       (144 ,'2023-01-13', '11:10', 3),
       (145 ,'2023-01-13', '11:10', 3),
       (146 ,'2023-01-13', '11:10', 3),
       (147 ,'2023-01-13', '11:10', 3),
       (148 ,'2023-01-13', '11:10', 3),
       (149 ,'2023-01-13', '11:10', 3),
       (150 ,'2023-01-13', '11:10', 3),
       (51 ,'2023-02-02', '18:01', 2),
       (52 ,'2023-02-02', '18:01', 2),
       (53 ,'2023-02-02', '18:01', 2),
       (54 ,'2023-02-02', '18:01', 2),
       (55 ,'2023-02-02', '18:01', 2),
       (56 ,'2023-02-02', '18:01', 2),
       (57 ,'2023-02-02', '18:01', 2),
       (58 ,'2023-02-02', '18:01', 2),
       (59 ,'2023-02-02', '18:01', 2),
       (60 ,'2023-02-02', '18:01', 2),
       (61 ,'2023-02-02', '18:01', 2),
       (62 ,'2023-02-02', '18:01', 2),
       (63 ,'2023-02-02', '18:01', 2),
       (64 ,'2023-02-02', '18:01', 2),
       (65 ,'2023-02-02', '18:01', 2),
       (66 ,'2023-02-02', '18:01', 2),
       (67 ,'2023-02-02', '18:01', 2),
       (68 ,'2023-02-02', '18:01', 2),
       (69 ,'2023-02-02', '18:01', 2),
       (70 ,'2023-02-02', '18:01', 2),
       (71 ,'2023-02-02', '18:01', 2),
       (72 ,'2023-02-02', '18:01', 2),
       (73 ,'2023-02-02', '18:01', 2),
       (74 ,'2023-02-02', '18:01', 2),
       (75 ,'2023-02-02', '18:01', 2),
       (76 ,'2023-02-02', '18:01', 2),
       (77 ,'2023-02-02', '18:01', 2),
       (78 ,'2023-02-02', '18:01', 2),
       (79 ,'2023-02-02', '18:01', 2),
       (80 ,'2023-02-02', '18:01', 2),
       (81 ,'2023-02-02', '18:01', 2),
       (82 ,'2023-02-02', '18:01', 2),
       (83 ,'2023-02-02', '18:01', 2),
       (84 ,'2023-02-02', '18:01', 2),
       (85 ,'2023-02-02', '18:01', 2),
       (86 ,'2023-02-02', '18:01', 2),
       (87 ,'2023-02-02', '18:01', 2),
       (88 ,'2023-02-02', '18:01', 2),
       (89 ,'2023-02-02', '18:01', 2),
       (90 ,'2023-02-02', '18:01', 2),
       (91 ,'2023-02-02', '18:01', 2),
       (92 ,'2023-02-02', '18:01', 2),
       (93 ,'2023-02-02', '18:01', 2),
       (94 ,'2023-02-02', '18:01', 2),
       (95 ,'2023-02-02', '18:01', 2),
       (96 ,'2023-02-02', '18:01', 2),
       (97 ,'2023-02-02', '18:01', 2),
       (98 ,'2023-02-02', '18:01', 2),
       (99 ,'2023-02-02', '18:01', 2),
       (100 ,'2023-02-02', '18:01', 2),
       (1 ,'2023-02-02', '12:01:00', 1),
       (2 ,'2023-02-02', '12:01:00', 1),
       (3 ,'2023-02-02', '12:01:00', 1),
       (4 ,'2023-02-02', '12:01:00', 1),
       (5 ,'2023-02-02', '12:01:00', 1),
       (6 ,'2023-02-02', '12:01:00', 1),
       (7 ,'2023-02-02', '12:01:00', 1),
       (8 ,'2023-02-02', '12:01:00', 1),
       (9 ,'2023-02-02', '12:01:00', 1),
       (10 ,'2023-02-02', '12:01:00', 1),
       (11 ,'2023-02-02', '12:01:00', 1),
       (12 ,'2023-02-02', '12:01:00', 1),
       (13 ,'2023-02-02', '12:01:00', 1),
       (14 ,'2023-02-02', '12:01:00', 1),
       (15 ,'2023-02-02', '12:01:00', 1),
       (16 ,'2023-02-02', '12:01:00', 1),
       (17 ,'2023-02-02', '12:01:00', 1),
       (18 ,'2023-02-02', '12:01:00', 1),
       (19 ,'2023-02-02', '12:01:00', 1),
       (20 ,'2023-02-02', '12:01:00', 1),
       (21 ,'2023-02-02', '12:01:00', 1),
       (22 ,'2023-02-02', '12:01:00', 1),
       (23 ,'2023-02-02', '12:01:00', 1),
       (24 ,'2023-02-02', '12:01:00', 1),
       (25 ,'2023-02-02', '12:01:00', 1),
       (26 ,'2023-02-02', '12:01:00', 1),
       (27 ,'2023-02-02', '12:01:00', 1),
       (28 ,'2023-02-02', '12:01:00', 1),
       (29 ,'2023-02-02', '12:01:00', 1),
       (30 ,'2023-02-02', '12:01:00', 1),
       (31 ,'2023-02-02', '12:01:00', 1),
       (32 ,'2023-02-02', '12:01:00', 1),
       (33 ,'2023-02-02', '12:01:00', 1),
       (34 ,'2023-02-02', '12:01:00', 1),
       (35 ,'2023-02-02', '12:01:00', 1),
       (36 ,'2023-02-02', '12:01:00', 1),
       (37 ,'2023-02-02', '12:01:00', 1),
       (38 ,'2023-02-02', '12:01:00', 1),
       (39 ,'2023-02-02', '12:01:00', 1),
       (40 ,'2023-02-02', '12:01:00', 1),
       (41 ,'2023-02-02', '12:01:00', 1),
       (42 ,'2023-02-02', '12:01:00', 1),
       (43 ,'2023-02-02', '12:01:00', 1),
       (44 ,'2023-02-02', '12:01:00', 1),
       (45 ,'2023-02-02', '12:01:00', 1),
       (46 ,'2023-02-02', '12:01:00', 1),
       (47 ,'2023-02-02', '12:01:00', 1),
       (48 ,'2023-02-02', '12:01:00', 1),
       (49 ,'2023-02-02', '12:01:00', 1),
       (50 ,'2023-02-02', '12:01:00', 1),
       (151 ,'2022-12-31', '22:22', 4),
       (152 ,'2022-12-31', '22:22', 4),
       (153 ,'2022-12-31', '22:22', 4),
       (154 ,'2022-12-31', '22:22', 4),
       (155 ,'2022-12-31', '22:22', 4),
       (156 ,'2022-12-31', '22:22', 4),
       (157 ,'2022-12-31', '22:22', 4),
       (158 ,'2022-12-31', '22:22', 4),
       (159 ,'2022-12-31', '22:22', 4),
       (160 ,'2022-12-31', '22:22', 4),
       (161 ,'2022-12-31', '22:22', 4),
       (162 ,'2022-12-31', '22:22', 4),
       (163 ,'2022-12-31', '22:22', 4),
       (164 ,'2022-12-31', '22:22', 4),
       (165 ,'2022-12-31', '22:22', 4),
       (166 ,'2022-12-31', '22:22', 4),
       (167 ,'2022-12-31', '22:22', 4),
       (168 ,'2022-12-31', '22:22', 4),
       (169 ,'2022-12-31', '22:22', 4),
       (170 ,'2022-12-31', '22:22', 4),
       (171 ,'2022-12-31', '22:22', 4),
       (172 ,'2022-12-31', '22:22', 4),
       (173 ,'2022-12-31', '22:22', 4),
       (174 ,'2022-12-31', '22:22', 4),
       (175 ,'2022-12-31', '22:22', 4),
       (176 ,'2022-12-31', '22:22', 4),
       (177 ,'2022-12-31', '22:22', 4),
       (178 ,'2022-12-31', '22:22', 4),
       (179 ,'2022-12-31', '22:22', 4),
       (180 ,'2022-12-31', '22:22', 4),
       (181 ,'2022-12-31', '22:22', 4),
       (182 ,'2022-12-31', '22:22', 4),
       (183 ,'2022-12-31', '22:22', 4),
       (184 ,'2022-12-31', '22:22', 4),
       (185 ,'2022-12-31', '22:22', 4),
       (186 ,'2022-12-31', '22:22', 4),
       (187 ,'2022-12-31', '22:22', 4),
       (188 ,'2022-12-31', '22:22', 4),
       (189 ,'2022-12-31', '22:22', 4),
       (190 ,'2022-12-31', '22:22', 4),
       (191 ,'2022-12-31', '22:22', 4),
       (192 ,'2022-12-31', '22:22', 4),
       (193 ,'2022-12-31', '22:22', 4),
       (194 ,'2022-12-31', '22:22', 4),
       (195 ,'2022-12-31', '22:22', 4),
       (196 ,'2022-12-31', '22:22', 4),
       (197 ,'2022-12-31', '22:22', 4),
       (198 ,'2022-12-31', '22:22', 4),
       (199 ,'2022-12-31', '22:22', 4),
       (200 ,'2022-12-31', '22:22', 4);



