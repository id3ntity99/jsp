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
import kr.co.jboard.dto.TermsDTO;
import kr.co.jboard.service.TermsService;

@WebServlet("/user/terms.do")
public class TermsController extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();
  private final TermsService service = TermsService.getInstance();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    RequestDispatcher dp = req.getRequestDispatcher("/WEB-INF/user/terms.jsp");
    try {
      TermsDTO dto = service.find(1);
      req.setAttribute("terms-dto", dto);
      dp.forward(req, resp);
    } catch (SQLException e) {
      resp.sendError(500);
    }
  }
}
