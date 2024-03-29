package Entities;

import java.sql.Date;
import java.sql.Time;

public class Session {
    private Date date;
    private Time time;
    private int hall_id;
    private int film_id;

    public Session() {
    }

    public Session(Date date, Time time, int hall_id, int film_id) {
        this.date = date;
        this.time = time;
        this.hall_id = hall_id;
        this.film_id = film_id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public int getHall_id() {
        return hall_id;
    }

    public void setHall_id(int hall_id) {
        this.hall_id = hall_id;
    }

    public int getFilm_id() {
        return film_id;
    }

    public void setFilm_id(int film_id) {
        this.film_id = film_id;
    }

    @Override
    public String toString() {
        String HTML_1 = "<html><body style='text-align: center'><h3>";
        String HTML_2 = "</h3></body></html>";
        return HTML_1 + "Дата: " + date + "<br>Время: " + time + HTML_2;
    }
}
