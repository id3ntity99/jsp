package kr.co.jboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import kr.co.jboard.dto.TermsDTO;
import kr.co.jboard.util.ConnectionUtil;

public class TermsDAO {
  private static final TermsDAO INSTANCE = new TermsDAO();

  public static TermsDAO getInstance() {
    return INSTANCE;
  }

  private TermsDAO() {
    // Empty Constructor
  }

  public void insert(TermsDTO dto) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.INSERT_TERMS);

    psmt.setInt(1, dto.getNo());
    psmt.setString(2, dto.getTerms());
    psmt.setString(3, dto.getPrivacy());

    psmt.executeUpdate();

    conn.close();
    psmt.close();
  }

  public TermsDTO select(int no) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.SELECT_TERMS);
    psmt.setInt(1, no);

    ResultSet rs = psmt.executeQuery();

    TermsDTO terms = null;
    if (rs.next()) {
      terms = new TermsDTO();

      terms.setNo(rs.getInt(1));
      terms.setTerms(rs.getString(2));
      terms.setPrivacy(rs.getString(3));
    }

    conn.close();
    psmt.close();
    rs.close();
    return terms;
  }

  public List<TermsDTO> selectAll() throws SQLException {
    List<TermsDTO> termsList = new ArrayList<>();
    Connection conn = ConnectionUtil.getConnection();
    Statement stmt = conn.createStatement();

    ResultSet rs = stmt.executeQuery(Query.SELECT_ALL_TERMS);

    while (rs.next()) {
      TermsDTO dto = new TermsDTO();
      dto.setNo(rs.getInt(1));
      dto.setTerms(rs.getString(2));
      dto.setPrivacy(rs.getString(3));
      termsList.add(dto);
    }

    conn.close();
    stmt.close();
    rs.close();

    return termsList;
  }

  public void update(TermsDTO dto) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.UPDATE_TERMS);

    psmt.setString(1, dto.getTerms());
    psmt.setString(2, dto.getPrivacy());
    psmt.setInt(3, dto.getNo());
    psmt.executeUpdate();

    conn.close();
    psmt.close();
  }

  public void delete(int no) throws SQLException {
    Connection conn = ConnectionUtil.getConnection();
    PreparedStatement psmt = conn.prepareStatement(Query.DELETE_TERMS);

    psmt.setInt(1, no);
    psmt.executeUpdate();

    conn.close();
    psmt.close();
  }
}
