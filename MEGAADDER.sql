drop table if exists users cascade;
drop table if exists roles cascade;
drop table if exists films cascade;
drop table if exists halls cascade;
drop table if exists seats cascade;
drop table if exists sessions cascade;
drop table if exists tickets cascade;

create table roles
(
    role_id serial primary key,
    role varchar(10)
);

create table users
(
    user_id         serial primary key unique,
    username        varchar(50) unique,
    password        varchar(70) not null,
    name            varchar(20),
    surname         varchar(20),
    role_id         int not null,
    active          boolean default true,
    CONSTRAINT user_role FOREIGN KEY(role_id) REFERENCES roles(role_id)
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
INSERT INTO roles(role_id, role)
VALUES (1, 'USER'),
       (2, 'ADMIN');

INSERT INTO users(username, password, role_id)
VALUES ('kekekeke', 'kekekeke', 1),
       ('director', 'director', 2);