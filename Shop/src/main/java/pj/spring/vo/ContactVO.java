package pj.spring.vo;

import java.util.List;

public class ContactVO extends AttachmentVO {
	private String contact_no;			// 문의번호
	private String contact_content;		// 내용
	private String contact_status;		// 상태
	private String contact_type;		// 문의유형
	private String contact_password;	// 비밀번호
	private String contact_comment;		// 답변내용
	private String contact_agree;		// 개인정보동의
	private String contact_create_at;	// 등록일
	private String contact_create_id;	// 등록id
	private String contact_create_ip;	// 등록ip
	private String contact_update_at;	// 수정일
	private String contact_update_id;	// 수정id
	private String contact_update_ip;	// 수정ip
	private String user_id;	            // 
	private String ordered_no;          //
	
	private String product_no;			// 상품번호
	
	private String user_name;           //
	private String contact_seq;           //
	
	
	
	
	public String getContact_seq() {
		return contact_seq;
	}
	public void setContact_seq(String contact_seq) {
		this.contact_seq = contact_seq;
	}
	public String getOrdered_no() {
		return ordered_no;
	}
	public void setOrdered_no(String ordered_no) {
		this.ordered_no = ordered_no;
	}
	public String getProduct_no() {
		return product_no;
	}
	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContact_no() {
		return contact_no;
	}
	public void setContact_no(String contact_no) {
		this.contact_no = contact_no;
	}
	public String getContact_content() {
		return contact_content;
	}
	public void setContact_content(String contact_content) {
		this.contact_content = contact_content;
	}
	public String getContact_status() {
		return contact_status;
	}
	public void setContact_status(String contact_status) {
		this.contact_status = contact_status;
	}
	public String getContact_type() {
		return contact_type;
	}
	public void setContact_type(String contact_type) {
		this.contact_type = contact_type;
	}
	public String getContact_password() {
		return contact_password;
	}
	public void setContact_password(String contact_password) {
		this.contact_password = contact_password;
	}
	public String getContact_comment() {
		return contact_comment;
	}
	public void setContact_comment(String contact_comment) {
		this.contact_comment = contact_comment;
	}
	public String getContact_agree() {
		return contact_agree;
	}
	public void setContact_agree(String contact_agree) {
		this.contact_agree = contact_agree;
	}
	public String getContact_create_at() {
		return contact_create_at;
	}
	public void setContact_create_at(String contact_create_at) {
		this.contact_create_at = contact_create_at;
	}
	public String getContact_create_id() {
		return contact_create_id;
	}
	public void setContact_create_id(String contact_create_id) {
		this.contact_create_id = contact_create_id;
	}
	public String getContact_create_ip() {
		return contact_create_ip;
	}
	public void setContact_create_ip(String contact_create_ip) {
		this.contact_create_ip = contact_create_ip;
	}
	public String getContact_update_at() {
		return contact_update_at;
	}
	public void setContact_update_at(String contact_update_at) {
		this.contact_update_at = contact_update_at;
	}
	public String getContact_update_id() {
		return contact_update_id;
	}
	public void setContact_update_id(String contact_update_id) {
		this.contact_update_id = contact_update_id;
	}
	public String getContact_update_ip() {
		return contact_update_ip;
	}
	public void setContact_update_ip(String contact_update_ip) {
		this.contact_update_ip = contact_update_ip;
	}
	
	
}
