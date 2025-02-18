package servlet;

import java.io.IOException;
import java.util.UUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login.do")
public class LogIn extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String uid = req.getParameter("uid");
    String pass = req.getParameter("pass");

    if (uid.equals("abc123") && pass.equals("1234")) {
      HttpSession session = req.getSession();

      session.setAttribute("username", uid);

      resp.sendRedirect("/ch09/Listener.jsp");
    } else {
      resp.sendRedirect("/ch09/Listener.jsp?login=100");
    }
  }
}
