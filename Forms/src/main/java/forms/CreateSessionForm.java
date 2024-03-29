package forms;

import Entities.Session;

public class CreateSessionForm {
    private final String form = "CreateSession";

    private Session session;

    public CreateSessionForm() {
    }

    public CreateSessionForm(Session session) {
        this.session = session;
    }

    public String getForm() {
        return form;
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }
}
