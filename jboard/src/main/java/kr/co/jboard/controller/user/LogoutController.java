package kr.co.jboard.controller.user;

import java.io.IOException;
import java.util.UUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user/logout.do")
public class LogoutController extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    // Disable HTTP session
    req.getSession().removeAttribute("sessUser");;
    req.getSession().invalidate();

    resp.sendRedirect("/jboard/user/login.do?result=101");
  }
}
