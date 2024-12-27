package pj.spring.vo;

import lombok.Data;

@Data
public class KakaoPayRequest { // API 요청 데이터
    private String itemName;
    private int quantity;
    private int amount;
    
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
    
    
}

