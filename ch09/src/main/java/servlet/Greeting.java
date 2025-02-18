package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.UUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/greeting.do") // This annotation replaces writing Servlet info into web.xml, which is
                            // not handy
public class Greeting extends HttpServlet {
  private static final long serialVersionUID = UUID.randomUUID().version();

  public Greeting() {
    // Empty constructor
  }

  @Override
  public void init() throws ServletException {
    log("Welcome.init() method has been called");
  }

  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    log("Welcome.doGet() method has been called");
    // Print HTML
    resp.setContentType("text/html;charset=utf-8");
    PrintWriter writer = resp.getWriter();
    writer.println("<html>");
    writer.println("<head>");
    writer.println("<meta charset='UTF-8'/>");
    writer.println("<title>Welcome</title>");
    writer.println("</head>");
    writer.println("<body>");
    writer.println("<h3>Welcome Servlet</h3>");
    writer.println("<a href='/ch09/hello.do'>Hello</a>");
    writer.println("<a href='/ch09/welcome.do'>Welcome</a>");
    writer.println("<a href='/ch09/greeting.do'>Greeting</a>");
    writer.println("</body>");
    writer.println("</html>");
  }

  @Override
  protected void doPost(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    log("Welcome.doPost() method has been called");
  }

  @Override
  public void destroy() {
    log("Welcome.destroy() method has been called...");
  }

}
