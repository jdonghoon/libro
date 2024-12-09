package pj.spring.vo;

public class UserLoginHistoryVO {
	private String user_login_history_no;			// 회원 로그인 이력번호
	private String user_login_history_date;			// 로그인 시점
	private String user_login_history_ip;			// 로그인 생성 ip
	private String user_login_history_status;		// 로그인 성공여부
	private String user_login_history_create_at;	// 기록 생성 일시
	
	public String getUser_login_history_no() {
		return user_login_history_no;
	}
	public void setUser_login_history_no(String user_login_history_no) {
		this.user_login_history_no = user_login_history_no;
	}
	public String getUser_login_history_date() {
		return user_login_history_date;
	}
	public void setUser_login_history_date(String user_login_history_date) {
		this.user_login_history_date = user_login_history_date;
	}
	public String getUser_login_history_ip() {
		return user_login_history_ip;
	}
	public void setUser_login_history_ip(String user_login_history_ip) {
		this.user_login_history_ip = user_login_history_ip;
	}
	public String getUser_login_history_status() {
		return user_login_history_status;
	}
	public void setUser_login_history_status(String user_login_history_status) {
		this.user_login_history_status = user_login_history_status;
	}
	public String getUser_login_history_create_at() {
		return user_login_history_create_at;
	}
	public void setUser_login_history_create_at(String user_login_history_create_at) {
		this.user_login_history_create_at = user_login_history_create_at;
	}
	
	
}
