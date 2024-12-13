package pj.spring.vo;

public class ProductVO extends AttachmentDetailVO {
	private String product_no;					// 상품번호
	private String product_name; 				// 상품명
	private String product_description;			// 상품소개
	private String product_author;				// 저자
	private String product_author_description;	// 저자 소개
	private String product_price;				// 가격
	private String product_isbn;				// 국제표준도서번호
	private String product_page;				// 쪽수
	private String product_stock;				// 재고
	private String product_status;				// 상태
	private String product_create_at;			// 등록일
	private String product_create_id;			// 등록id
	private String product_create_ip;			// 등록ip
	private String product_update_at;			// 수정일
	private String product_update_id;			// 수정id
	private String product_update_ip;			// 수정ip
	private String user_id;                     // ID
	private String category_name;				// 카테고리 이름
	
	
	
	public String getProduct_no() {
		return product_no;
	}
	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}
	public String getProduct_author() {
		return product_author;
	}
	public void setProduct_author(String product_author) {
		this.product_author = product_author;
	}
	public String getProduct_author_description() {
		return product_author_description;
	}
	public void setProduct_author_description(String product_author_description) {
		this.product_author_description = product_author_description;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_isbn() {
		return product_isbn;
	}
	public void setProduct_isbn(String product_isbn) {
		this.product_isbn = product_isbn;
	}
	public String getProduct_page() {
		return product_page;
	}
	public void setProduct_page(String product_page) {
		this.product_page = product_page;
	}
	public String getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(String product_stock) {
		this.product_stock = product_stock;
	}
	public String getProduct_status() {
		return product_status;
	}
	public void setProduct_status(String product_status) {
		this.product_status = product_status;
	}
	public String getProduct_create_at() {
		return product_create_at;
	}
	public String getUser_id() {
		return user_id;
	}
	public String getCategory_name() {
		return category_name;
	}
	
	
	public void setProduct_create_at(String product_create_at) {
		this.product_create_at = product_create_at;
	}
	public String getProduct_create_id() {
		return product_create_id;
	}
	public void setProduct_create_id(String product_create_id) {
		this.product_create_id = product_create_id;
	}
	public String getProduct_create_ip() {
		return product_create_ip;
	}
	public void setProduct_create_ip(String product_create_ip) {
		this.product_create_ip = product_create_ip;
	}
	public String getProduct_update_at() {
		return product_update_at;
	}
	public void setProduct_update_at(String product_update_at) {
		this.product_update_at = product_update_at;
	}
	public String getProduct_update_id() {
		return product_update_id;
	}
	public void setProduct_update_id(String product_update_id) {
		this.product_update_id = product_update_id;
	}
	public String getProduct_update_ip() {
		return product_update_ip;
	}
	public void setProduct_update_ip(String product_update_ip) {
		this.product_update_ip = product_update_ip;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}	
	
	
}
