package pj.spring.vo;

public class RecentlyproductVO extends WishlistVO {
	private String recentlyproduct_no;			// 위시리스트 번호
	private String recentlyproduct_create_at;			// 등록일
	private String recentlyproduct_create_id;			// 등록id
	private String recentlyproduct_create_ip;			// 등록ip
	private String recentlyproduct_update_at;			// 수정일
	private String recentlyproduct_update_id;			// 수정id
	private String recentlyproduct_update_ip;			// 수정ip
	private String user_id;
	private String product_no;					// 상품 번호
	
	public String getProduct_no() {
		return product_no;
	} 
	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRecentlyproduct_no() {
		return recentlyproduct_no;
	}
	public void setRecentlyproduct_no(String recentlyproduct_no) {
		this.recentlyproduct_no = recentlyproduct_no;
	}
	public String getRecentlyproduct_create_at() {
		return recentlyproduct_create_at;
	}
	public void setRecentlyproduct_create_at(String recentlyproduct_create_at) {
		this.recentlyproduct_create_at = recentlyproduct_create_at;
	}
	public String getRecentlyproduct_create_id() {
		return recentlyproduct_create_id;
	}
	public void setRecentlyproduct_create_id(String recentlyproduct_create_id) {
		this.recentlyproduct_create_id = recentlyproduct_create_id;
	}
	public String getRecentlyproduct_create_ip() {
		return recentlyproduct_create_ip;
	}
	public void setRecentlyproduct_create_ip(String recentlyproduct_create_ip) {
		this.recentlyproduct_create_ip = recentlyproduct_create_ip;
	}
	public String getRecentlyproduct_update_at() {
		return recentlyproduct_update_at;
	}
	public void setRecentlyproduct_update_at(String recentlyproduct_update_at) {
		this.recentlyproduct_update_at = recentlyproduct_update_at;
	}
	public String getRecentlyproduct_update_id() {
		return recentlyproduct_update_id;
	}
	public void setRecentlyproduct_update_id(String recentlyproduct_update_id) {
		this.recentlyproduct_update_id = recentlyproduct_update_id;
	}
	public String getRecentlyproduct_update_ip() {
		return recentlyproduct_update_ip;
	}
	public void setRecentlyproduct_update_ip(String recentlyproduct_update_ip) {
		this.recentlyproduct_update_ip = recentlyproduct_update_ip;
	}
}
