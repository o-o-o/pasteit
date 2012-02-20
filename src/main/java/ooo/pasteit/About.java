package ooo.pasteit;

import javax.servlet.annotation.WebServlet;

@WebServlet(urlPatterns = { "/about" })
public class About extends Base {

    private static final long serialVersionUID = 4743123388235933389L;

    protected String getView() {
        return "about.jsp"; //$NON-NLS-1$
    }
}
