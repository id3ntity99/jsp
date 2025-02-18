package servlet;

import java.io.IOException;
import java.util.UUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/test.do")
public class PostTest extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();

  public PostTest() {
    // Empty Constructor
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    log("POST requets received");
  }
}
