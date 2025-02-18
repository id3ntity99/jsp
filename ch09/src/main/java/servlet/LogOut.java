package servlet;

import java.io.IOException;
import java.util.UUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/logout.do")
public class LogOut extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    HttpSession session = req.getSession();
    session.invalidate();

    Cookie cookie = new Cookie("username", "");
    cookie.setMaxAge(0);
    resp.addCookie(cookie);

    resp.sendRedirect("/ch09/Listener.jsp");
  }
}
