package kr.co.jboard.dto;

public class TermsDTO {
  private int no;
  private String trems;
  private String privacy;

  public TermsDTO() {
    // Empty constructor.
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getTrems() {
    return trems;
  }

  public void setTrems(String trems) {
    this.trems = trems;
  }

  public String getPrivacy() {
    return privacy;
  }

  public void setPrivacy(String privacy) {
    this.privacy = privacy;
  }

  @Override
  public String toString() {
    return "TermsDTO [no=" + no + ", trems=" + trems + ", privacy=" + privacy + "]";
  }
}
