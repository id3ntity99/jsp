package kr.co.jboard.controller.user;

import java.io.IOException;
import java.sql.SQLException;
import java.util.UUID;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.co.jboard.dto.UserDTO;
import kr.co.jboard.service.UserService;

@WebServlet("/user/login.do")
public class LoginController extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();
  private final UserService service = UserService.getInstance();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String result = req.getParameter("result");
    req.setAttribute("result", result);

    RequestDispatcher dp = req.getRequestDispatcher("/WEB-INF/user/login.jsp");
    dp.forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String uid = req.getParameter("uid");
    String pass = req.getParameter("pass");

    UserDTO dto = new UserDTO();
    dto.setUid(uid);
    dto.setPass(pass);

    UserDTO loggedInUser = null;
    try {
      loggedInUser = service.find(dto);
    } catch (SQLException e) {
      resp.sendError(500);
    }

    if (loggedInUser != null) { // If a user with specified uid and password exists
      HttpSession session = req.getSession();
      session.setAttribute("sessUser", loggedInUser);
      resp.sendRedirect("/jboard/article/list.do");
    } else { // The user doesn't exist
      resp.sendRedirect("/jboard/user/login.do?result=100");
    }
  }
}
