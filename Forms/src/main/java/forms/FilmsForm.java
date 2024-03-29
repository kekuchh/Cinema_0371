package forms;

import Entities.Film;

import java.util.ArrayList;

public class FilmsForm {
    private final String form = "FilmsList";

    private ArrayList<Film> films;

    public FilmsForm() {
    }

    public FilmsForm(ArrayList<Film> films) {
        this.films = films;
    }

    public String getForm() {
        return form;
    }

    public ArrayList<Film> getFilms() {
        return films;
    }

    public void setFilms(ArrayList<Film> film) {
        this.films = film;
    }
}
