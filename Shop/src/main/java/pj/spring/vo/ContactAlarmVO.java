package pj.spring.vo;

public class ContactAlarmVO {
	private String contact_alarm_no;				// 관리자알림번호
	private String contact_alarm_contact_no;		// 알림대상번호			
	private String contact_alarm_is_read;			// 알림읽음여부
	private String contact_alarm_date;				// 알림일
	private String contact_alarm_create_at;			// 등록일
	private String contact_alarm_create_id;			// 등록id
	private String contact_alarm_create_ip;			// 등록ip
	private String contact_alarm_update_at;			// 수정일
	private String contact_alarm_update_id;			// 수정id
	private String contact_alarm_update_ip;			// 수정ip
	
	private String user_id;                         // 유저 id
	
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContact_alarm_no() {
		return contact_alarm_no;
	}
	public void setContact_alarm_no(String contact_alarm_no) {
		this.contact_alarm_no = contact_alarm_no;
	}
	public String getContact_alarm_contact_no() {
		return contact_alarm_contact_no;
	}
	public void setContact_alarm_contact_no(String contact_alarm_contact_no) {
		this.contact_alarm_contact_no = contact_alarm_contact_no;
	}
	public String getContact_alarm_is_read() {
		return contact_alarm_is_read;
	}
	public void setContact_alarm_is_read(String contact_alarm_is_read) {
		this.contact_alarm_is_read = contact_alarm_is_read;
	}
	public String getContact_alarm_date() {
		return contact_alarm_date;
	}
	public void setContact_alarm_date(String contact_alarm_date) {
		this.contact_alarm_date = contact_alarm_date;
	}
	public String getContact_alarm_create_at() {
		return contact_alarm_create_at;
	}
	public void setContact_alarm_create_at(String contact_alarm_create_at) {
		this.contact_alarm_create_at = contact_alarm_create_at;
	}
	public String getContact_alarm_create_id() {
		return contact_alarm_create_id;
	}
	public void setContact_alarm_create_id(String contact_alarm_create_id) {
		this.contact_alarm_create_id = contact_alarm_create_id;
	}
	public String getContact_alarm_create_ip() {
		return contact_alarm_create_ip;
	}
	public void setContact_alarm_create_ip(String contact_alarm_create_ip) {
		this.contact_alarm_create_ip = contact_alarm_create_ip;
	}
	public String getContact_alarm_update_at() {
		return contact_alarm_update_at;
	}
	public void setContact_alarm_update_at(String contact_alarm_update_at) {
		this.contact_alarm_update_at = contact_alarm_update_at;
	}
	public String getContact_alarm_update_id() {
		return contact_alarm_update_id;
	}
	public void setContact_alarm_update_id(String contact_alarm_update_id) {
		this.contact_alarm_update_id = contact_alarm_update_id;
	}
	public String getContact_alarm_update_ip() {
		return contact_alarm_update_ip;
	}
	public void setContact_alarm_update_ip(String contact_alarm_update_ip) {
		this.contact_alarm_update_ip = contact_alarm_update_ip;
	}
	
	
}
