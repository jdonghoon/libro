package pj.spring.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class KakaoPayRequestBody {
    private String cid; // 상점 ID
    private String partner_order_id; // 주문 번호
    private String partner_user_id; // 사용자 ID
    private String item_name; // 상품 이름
    private int quantity; // 수량
    private int total_amount; // 총 금액
    private int tax_free_amount; // 비과세 금액
    private String approval_url; // 성공 시 리다이렉트 URL
    private String cancel_url; // 취소 시 리다이렉트 URL
    private String fail_url; // 실패 시 리다이렉트 URL
    
    // 생성자 정의
    public KakaoPayRequestBody(String cid, String partner_order_id, String partner_user_id,
                               String item_name, int quantity, int total_amount,
                               int tax_free_amount, String approval_url, String cancel_url, String fail_url) {
        this.cid = cid;
        this.partner_order_id = partner_order_id;
        this.partner_user_id = partner_user_id;
        this.item_name = item_name;
        this.quantity = quantity;
        this.total_amount = total_amount;
        this.tax_free_amount = tax_free_amount;
        this.approval_url = approval_url;
        this.cancel_url = cancel_url;
        this.fail_url = fail_url;
    }
    
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getPartner_order_id() {
		return partner_order_id;
	}
	public void setPartner_order_id(String partner_order_id) {
		this.partner_order_id = partner_order_id;
	}
	public String getPartner_user_id() {
		return partner_user_id;
	}
	public void setPartner_user_id(String partner_user_id) {
		this.partner_user_id = partner_user_id;
	}
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	public int getTax_free_amount() {
		return tax_free_amount;
	}
	public void setTax_free_amount(int tax_free_amount) {
		this.tax_free_amount = tax_free_amount;
	}
	public String getApproval_url() {
		return approval_url;
	}
	public void setApproval_url(String approval_url) {
		this.approval_url = approval_url;
	}
	public String getCancel_url() {
		return cancel_url;
	}
	public void setCancel_url(String cancel_url) {
		this.cancel_url = cancel_url;
	}
	public String getFail_url() {
		return fail_url;
	}
	public void setFail_url(String fail_url) {
		this.fail_url = fail_url;
	}
    
    
}
