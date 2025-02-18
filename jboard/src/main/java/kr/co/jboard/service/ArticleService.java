package kr.co.jboard.service;

import java.sql.SQLException;
import java.util.List;
import kr.co.jboard.dao.ArticleDAO;
import kr.co.jboard.dto.ArticleDTO;

public enum ArticleService {
  INSTANCE;

  private ArticleDAO dao = ArticleDAO.getInstance();

  public void register(ArticleDTO dto) throws SQLException {

  }

  public ArticleDTO find(ArticleDTO dto) throws SQLException {
    return null;
  }

  public List<ArticleDTO> list() throws SQLException {
    return null;
  }

  public void modify(ArticleDTO dto) throws SQLException {

  }

  public void delete(ArticleDTO dto) throws SQLException {

  }
}
