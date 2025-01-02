package pj.spring.vo;

public class cartPrice {
    private int totalProductPrice;  // 상품 가격 * 수량
    private int totalProductQuantity;  // 상품 수량
    
    // 해당 생성자가 있어야 합니다
    public cartPrice(int totalProductPrice, int totalProductQuantity) {
        this.totalProductPrice = totalProductPrice;
        this.totalProductQuantity = totalProductQuantity;
    }
    
	public int getTotalProductPrice() {
		return totalProductPrice;
	}
	public void setTotalProductPrice(int totalProductPrice) {
		this.totalProductPrice = totalProductPrice;
	}
	public int getTotalProductQuantity() {
		return totalProductQuantity;
	}
	public void setTotalProductQuantity(int totalProductQuantity) {
		this.totalProductQuantity = totalProductQuantity;
	}

    
}

