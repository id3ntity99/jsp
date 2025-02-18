package filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;

/**
 * A Filter is used for client-request validation, data compression and encryption/decryption, etc
 * before and after Servlet process the request.
 */
public class SimpleFilter implements Filter {

  @Override
  public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
      throws IOException, ServletException {
    System.out.println("SimpleFilter.doFilter() has been called");

    chain.doFilter(req, resp);
  }
}
