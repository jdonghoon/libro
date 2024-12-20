package pj.spring.vo;

public class CartVO extends ProductVO {
	private String cart_no;					// 장바구니 번호
	private String cart_create_at;			// 등록일
	private String cart_create_id;			// 등록id
	private String cart_create_ip;			// 등록ip
	private String cart_update_at;			// 수정일
	private String cart_update_id;			// 수정id
	private String cart_update_ip;			// 수정ip
	private String user_id;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getCart_no() {
		return cart_no;
	}
	public void setCart_no(String cart_no) {
		this.cart_no = cart_no;
	}
	public String getCart_create_at() {
		return cart_create_at;
	}
	public void setCart_create_at(String cart_create_at) {
		this.cart_create_at = cart_create_at;
	}
	public String getCart_create_id() {
		return cart_create_id;
	}
	public void setCart_create_id(String cart_create_id) {
		this.cart_create_id = cart_create_id;
	}
	public String getCart_create_ip() {
		return cart_create_ip;
	}
	public void setCart_create_ip(String cart_create_ip) {
		this.cart_create_ip = cart_create_ip;
	}
	public String getCart_update_at() {
		return cart_update_at;
	}
	public void setCart_update_at(String cart_update_at) {
		this.cart_update_at = cart_update_at;
	}
	public String getCart_update_id() {
		return cart_update_id;
	}
	public void setCart_update_id(String cart_update_id) {
		this.cart_update_id = cart_update_id;
	}
	public String getCart_update_ip() {
		return cart_update_ip;
	}
	public void setCart_update_ip(String cart_update_ip) {
		this.cart_update_ip = cart_update_ip;
	}
	
	
}
