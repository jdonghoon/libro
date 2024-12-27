package pj.spring.vo;

public class UserVO extends AddressBookVO {
	
	private String user_no;         // 회원 번호
	private String user_id;         // 아이디
	private String user_password;   // 비밀번호
	private String user_name;       // 이름
	private String user_phone;      // 휴대폰번호
	private String user_email;      // 이메일
	private String user_created_at; // 회원가입일
	private String user_note;       // 기타 사항
	private String user_status;     // 상태
	private String user_type;       // 회원구분
	private String user_update_at;  // 수정일
	
	private String user_create_id;
	private String user_update_id;
	
	
	public String getUser_create_id() {
		return user_create_id;
	}
	public void setUser_create_id(String user_create_id) {
		this.user_create_id = user_create_id;
	}
	public String getUser_update_id() {
		return user_update_id;
	}
	public void setUser_update_id(String user_update_id) {
		this.user_update_id = user_update_id;
	}
	public String getUser_no() {
		return user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public String getUser_name() {
		return user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public String getUser_created_at() {
		return user_created_at;
	}
	public String getUser_note() {
		return user_note;
	}
	public String getUser_status() {
		return user_status;
	}
	public String getUser_type() {
		return user_type;
	}
	public String getUser_update_at() {
		return user_update_at;
	}

	
	public void setUser_no(String user_no) {
		this.user_no = user_no;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public void setUser_created_at(String user_created_at) {
		this.user_created_at = user_created_at;
	}
	public void setUser_note(String user_note) {
		this.user_note = user_note;
	}
	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	public void setUser_update_at(String user_update_at) {
		this.user_update_at = user_update_at;
	}
	
}
