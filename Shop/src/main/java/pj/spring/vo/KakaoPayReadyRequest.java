package pj.spring.vo;

public class KakaoPayReadyRequest {
	
	private String cid = "TC0ONETIME"; // �׽�Ʈ�� CID
    private String partner_order_id;   // �ֹ� ��ȣ
    private String partner_user_id;    // ����� ID
    private String item_name;          // ��ǰ��
    private Integer quantity;          // ��ǰ ����
    private Integer total_amount;      // �� �ݾ�
    private Integer tax_free_amount;   // ����� �ݾ�
    private String approval_url;       // ���� ���� �� �����̷�Ʈ URL
    private String cancel_url;         // ���� ��� �� �����̷�Ʈ URL
    private String fail_url;           // ���� ���� �� �����̷�Ʈ URL
    
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
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(Integer total_amount) {
		this.total_amount = total_amount;
	}
	public Integer getTax_free_amount() {
		return tax_free_amount;
	}
	public void setTax_free_amount(Integer tax_free_amount) {
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