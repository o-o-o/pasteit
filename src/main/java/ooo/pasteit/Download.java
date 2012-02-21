package ooo.pasteit;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/d/*" })
public class Download extends HttpServlet {

    private static final long serialVersionUID = 4743123388235933389L;

    private static final String STORAGE = "var"; //$NON-NLS-1$

    private File storage;

    @Override
    public void init() throws ServletException {
        storage = new File(FileUtils.getUserDir(), STORAGE);
        if (!storage.exists()) {
            storage.mkdirs();
        }
    }

    @Override
    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("/"); //$NON-NLS-1$
    }

    @Override
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        final String uri = request.getRequestURI();
        final File file = new File(storage, uri.substring(uri.lastIndexOf("/") + 1, uri.length())); //$NON-NLS-1$
        if (!file.exists() || !file.isFile()) {
            response.sendRedirect("/"); //$NON-NLS-1$
            return;
        }
        if (!storage.equals(file.getParentFile())) {
            response.sendRedirect("/"); //$NON-NLS-1$
            return;
        }

        response.setHeader("Content-Disposition", "attachment;filename=\"" + file.getName() + "\""); //$NON-NLS-1$ //$NON-NLS-2$ //$NON-NLS-3$
        response.setContentLength((int) file.length());
        response.setContentType("application/octet-stream"); //$NON-NLS-1$
        ServletOutputStream out = null;
        BufferedInputStream in = null;

        try {
            out = response.getOutputStream();
            in = new BufferedInputStream(new FileInputStream(file));

            int size = 0;
            final byte[] buff = new byte[2048];
            while ((size = in.read(buff)) > -1) {
                out.write(buff, 0, size);
            }
        } finally {
            if (in != null) {
                in.close();
            }
            if (out != null) {
                out.close();
            }
        }
    }
}
