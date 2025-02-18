package kr.co.jboard.service;

import java.sql.SQLException;
import java.util.List;
import kr.co.jboard.dao.TermsDAO;
import kr.co.jboard.dto.TermsDTO;

public class TermsService {
  private static final TermsService INSTANCE = new TermsService();

  public static TermsService getInstance() {
    return INSTANCE;
  }

  private TermsDAO dao = TermsDAO.getInstance();

  private TermsService() {
    // Empty constructor
  }

  public void register(TermsDTO dto) throws SQLException {
    dao.insert(dto);
  }

  public TermsDTO find(int no) throws SQLException {
    return dao.select(no);
  }

  public List<TermsDTO> list() throws SQLException {
    return dao.selectAll();
  }

  public void modify(TermsDTO dto) throws SQLException {
    dao.update(dto);
  }

  public void delete(int no) throws SQLException {
    dao.delete(no);
  }
}
