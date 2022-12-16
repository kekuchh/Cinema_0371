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
    active          boolean default true
);

create table roles
(
    user_id   integer not null primary key,
    role varchar(10) not null,
    CONSTRAINT user_role FOREIGN KEY(user_id) REFERENCES users(user_id)
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
    row integer,
    seat integer,
    CONSTRAINT ticket_seat FOREIGN KEY(seat_id) REFERENCES seats(seat_id)
);