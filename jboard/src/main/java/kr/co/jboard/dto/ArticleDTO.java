package kr.co.jboard.dto;

public class ArticleDTO {
  private int no;
  private String cate;
  private String title;
  private String content;
  private int hit;
  private String writer;
  private String regIp;
  private String wdate;

  public ArticleDTO() {
    // Empty constructor.
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getCate() {
    return cate;
  }

  public void setCate(String cate) {
    this.cate = cate;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getHit() {
    return hit;
  }

  public void setHit(int hit) {
    this.hit = hit;
  }

  public String getWriter() {
    return writer;
  }

  public void setWriter(String writer) {
    this.writer = writer;
  }

  public String getRegIp() {
    return regIp;
  }

  public void setRegIp(String regIp) {
    this.regIp = regIp;
  }

  public String getWdate() {
    return wdate;
  }

  public void setWdate(String wdate) {
    this.wdate = wdate;
  }

  @Override
  public String toString() {
    return "ArticleDTO [no=" + no + ", cate=" + cate + ", title=" + title + ", content=" + content
        + ", hit=" + hit + ", writer=" + writer + ", regIp=" + regIp + ", wdate=" + wdate + "]";
  }
}
