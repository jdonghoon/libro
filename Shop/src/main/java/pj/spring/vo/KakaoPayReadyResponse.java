package pj.spring.vo;

import java.util.Date;

public class KakaoPayReadyResponse {

	private String tid;                // 결제 고유 번호
    private String next_redirect_pc_url; // 사용자 결제 페이지 URL
    private Date created_at;           // 요청 시간
    
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}
	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
    
    
}
