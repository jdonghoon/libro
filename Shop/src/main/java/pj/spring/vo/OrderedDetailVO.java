package pj.spring.vo;

public class OrderedDetailVO extends ProductVO {
	private String ordered_detail_no;						// 주문상세번호				
	private String ordered_detail_quantity;				// 주문수량
	private String ordered_detail_totalquantity;			// 총주문수량
	private String ordered_detail_unit_price;				// 단가
	private String ordered_detail_total_price;			// 주문총금액
	private String ordered_detail_create_at;				// 등록일
	private String ordered_detail_create_id;				// 등록id
	private String ordered_detail_create_ip;				// 등록ip
	private String ordered_detail_update_at;				// 수정일
	private String ordered_detail_update_id;				// 수정id
	private String ordered_detail_update_ip;				// 수정ip
	private String ordered_no;								// 주문번호
	private String product_no;								// 상품 번호
	
	private String orderTotalAmount;
	private String orderTotalQuantity;
	
	
	
	
	public String getOrderTotalAmount() {
		return orderTotalAmount;
	}
	public void setOrderTotalAmount(String orderTotalAmount) {
		this.orderTotalAmount = orderTotalAmount;
	}
	public String getOrderTotalQuantity() {
		return orderTotalQuantity;
	}
	public void setOrderTotalQuantity(String orderTotalQuantity) {
		this.orderTotalQuantity = orderTotalQuantity;
	}
	public String getProduct_no() {
		return product_no;
	}
	public void setProduct_no(String product_no) {
		this.product_no = product_no;
	}
	public String getOrdered_no() {
		return ordered_no;
	}
	public void setOrdered_no(String ordered_no) {
		this.ordered_no = ordered_no;
	}
	public  String getOrdered_detail_no() {
		return ordered_detail_no;
	}
	public String getOrdered_detail_quantity() {
		return ordered_detail_quantity;
	}
	public String getOrdered_detail_totalquantity() {
		return ordered_detail_totalquantity;
	}
	public String getOrdered_detail_unit_price() {
		return ordered_detail_unit_price;
	}
	public String getOrdered_detail_total_price() {
		return ordered_detail_total_price;
	}
	public String getOrdered_detail_create_at() {
		return ordered_detail_create_at;
	}
	public String getOrdered_detail_create_id() {
		return ordered_detail_create_id;
	}
	public String getOrdered_detail_create_ip() {
		return ordered_detail_create_ip;
	}
	public String getOrdered_detail_update_at() {
		return ordered_detail_update_at;
	}
	public String getOrdered_detail_update_id() {
		return ordered_detail_update_id;
	}
	public String getOrdered_detail_update_ip() {
		return ordered_detail_update_ip;
	}
	public void setOrdered_detail_no(String ordered_detail_no) {
		this.ordered_detail_no = ordered_detail_no;
	}
	public void setOrdered_detail_quantity(String ordered_detail_quantity) {
		this.ordered_detail_quantity = ordered_detail_quantity;
	}
	public void setOrdered_detail_totalquantity(String ordered_detail_totalquantity) {
		this.ordered_detail_totalquantity = ordered_detail_totalquantity;
	}
	public void setOrdered_detail_unit_price(String ordered_detail_unit_price) {
		this.ordered_detail_unit_price = ordered_detail_unit_price;
	}
	public void setOrdered_detail_total_price(String ordered_detail_total_price) {
		this.ordered_detail_total_price = ordered_detail_total_price;
	}
	public void setOrdered_detail_create_at(String ordered_detail_create_at) {
		this.ordered_detail_create_at = ordered_detail_create_at;
	}
	public void setOrdered_detail_create_id(String ordered_detail_create_id) {
		this.ordered_detail_create_id = ordered_detail_create_id;
	}
	public void setOrdered_detail_create_ip(String ordered_detail_create_ip) {
		this.ordered_detail_create_ip = ordered_detail_create_ip;
	}
	public void setOrdered_detail_update_at(String ordered_detail_update_at) {
		this.ordered_detail_update_at = ordered_detail_update_at;
	}
	public void setOrdered_detail_update_id(String ordered_detail_update_id) {
		this.ordered_detail_update_id = ordered_detail_update_id;
	}
	public void setOrdered_detail_update_ip(String ordered_detail_update_ip) {
		this.ordered_detail_update_ip = ordered_detail_update_ip;
	}
	

	
	
}
