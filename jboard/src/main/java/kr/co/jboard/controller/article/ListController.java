package kr.co.jboard.controller.article;

import java.io.IOException;
import java.util.UUID;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/list.do")
public class ListController extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    RequestDispatcher dp = req.getRequestDispatcher("/WEB-INF/article/list.jsp");
    dp.forward(req, resp);
  }
}
