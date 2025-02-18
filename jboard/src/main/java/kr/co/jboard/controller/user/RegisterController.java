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
import kr.co.jboard.dto.UserDTO;
import kr.co.jboard.service.UserService;

@WebServlet("/user/register.do")
public class RegisterController extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();
  private final UserService service = UserService.getInstance();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    RequestDispatcher dp = req.getRequestDispatcher("/WEB-INF/user/register.jsp");
    dp.forward(req, resp);
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    String uid = req.getParameter("uid");
    String pass1 = req.getParameter("pass1");
    String pass2 = req.getParameter("pass2");
    String name = req.getParameter("name");
    String nick = req.getParameter("nick");
    String email = req.getParameter("email");
    String hp = req.getParameter("hp");
    String zip = req.getParameter("zip");
    String addr1 = req.getParameter("addr1");
    String addr2 = req.getParameter("addr2");
    String regip = req.getRemoteAddr();

    if (!pass1.equals(pass2)) {
      resp.sendRedirect("/jboard/user/register.do?result=100");
    }

    UserDTO user = new UserDTO();
    user.setUid(uid);
    user.setPass(pass2);
    user.setName(name);
    user.setNick(nick);
    user.setEmail(email);
    user.setHp(hp);
    user.setZip(zip);
    user.setAddr1(addr1);
    user.setAddr2(addr2);
    user.setRegip(regip);

    try {
      service.register(user);
    } catch (SQLException e) {
      resp.sendRedirect("/jboard/error.do?code=500");
    }
    resp.sendRedirect("/jboard/user/login.do");
  }
}
