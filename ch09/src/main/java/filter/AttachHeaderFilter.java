package filter;

import java.io.IOException;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;

@WebFilter(urlPatterns = {"/welcome.do", "/greeting.do"})
public class AttachHeaderFilter implements Filter {
  @Override
  public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
      throws IOException, ServletException {
    // TODO Implement this filter so that it adds header with key-value of (from,
    // AttachHeaderFilter.class).
    chain.doFilter(req, resp);
  }
}
