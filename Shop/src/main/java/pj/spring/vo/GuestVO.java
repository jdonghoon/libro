package pj.spring.vo;

public class GuestVO extends OrderedVO {
	private String guest_no;				// 비회원번호
	private String guest_email;				// 이메일
	private String guest_phone;				// 휴대폰번호
	private String guest_name;				// 이름
	private String guest_password;			// 비밀번호
	private String guest_ordered_at;		// 주문일
	private String guest_create_at;			// 등록일
	private String guest_create_id;			// 등록id
	private String guest_create_ip;			// 등록ip
	private String guest_update_at;			// 수정일
	private String guest_update_id;			// 수정id
	private String guest_update_ip;			// 수정ip
	
	
	
	public String getGuest_name() {
		return guest_name;
	}
	public void setGuest_name(String guest_name) {
		this.guest_name = guest_name;
	}
	public String getGuest_password() {
		return guest_password;
	}
	public void setGuest_password(String guest_password) {
		this.guest_password = guest_password;
	}
	public String getGuest_no() {
		return guest_no;
	}
	public void setGuest_no(String guest_no) {
		this.guest_no = guest_no;
	}
	public String getGuest_email() {
		return guest_email;
	}
	public void setGuest_email(String guest_email) {
		this.guest_email = guest_email;
	}
	public String getGuest_phone() {
		return guest_phone;
	}
	public void setGuest_phone(String guest_phone) {
		this.guest_phone = guest_phone;
	}
	public String getGuest_ordered_at() {
		return guest_ordered_at;
	}
	public void setGuest_ordered_at(String guest_ordered_at) {
		this.guest_ordered_at = guest_ordered_at;
	}
	public String getGuest_create_at() {
		return guest_create_at;
	}
	public void setGuest_create_at(String guest_create_at) {
		this.guest_create_at = guest_create_at;
	}
	public String getGuest_create_id() {
		return guest_create_id;
	}
	public void setGuest_create_id(String guest_create_id) {
		this.guest_create_id = guest_create_id;
	}
	public String getGuest_create_ip() {
		return guest_create_ip;
	}
	public void setGuest_create_ip(String guest_create_ip) {
		this.guest_create_ip = guest_create_ip;
	}
	public String getGuest_update_at() {
		return guest_update_at;
	}
	public void setGuest_update_at(String guest_update_at) {
		this.guest_update_at = guest_update_at;
	}
	public String getGuest_update_id() {
		return guest_update_id;
	}
	public void setGuest_update_id(String guest_update_id) {
		this.guest_update_id = guest_update_id;
	}
	public String getGuest_update_ip() {
		return guest_update_ip;
	}
	public void setGuest_update_ip(String guest_update_ip) {
		this.guest_update_ip = guest_update_ip;
	}
	
	
}
