package kr.co.jboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import kr.co.jboard.dto.ArticleDTO;
import kr.co.jboard.util.ConnectionUtil;

public class ArticleDAO {
  private static final ArticleDAO INSTANCE = new ArticleDAO();

  public static ArticleDAO getInstance() {
    return INSTANCE;
  }

  private ArticleDAO() {
    // Singleton pattern
  }

  public void insert(ArticleDTO dto) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.INSERT_ARTICLE);

    psmt.setInt(1, dto.getNo());
    psmt.setString(2, dto.getCate());
    psmt.setString(3, dto.getTitle());
    psmt.setString(4, dto.getContent());
    psmt.setInt(5, dto.getComment());
    psmt.setInt(6, dto.getFile());
    psmt.setInt(7, dto.getHit());
    psmt.setString(8, dto.getWriter());
    psmt.setString(9, dto.getRegIp());
    psmt.setString(10, dto.getWdate());

    psmt.executeUpdate();

    conn.close();
    psmt.close();
  }

  public ArticleDTO select(int no) {
    return null;
  }

  public List<ArticleDTO> selectAll() {
    List<ArticleDTO> articles = new ArrayList<>();
    return articles;
  }

  public void update(ArticleDTO dto) {

  }

  public void delete(int no) {

  }
}
