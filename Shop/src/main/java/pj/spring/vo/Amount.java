package pj.spring.vo;

public class Amount {
    private int total;       // 총 결제 금액
    private int tax_free;    // 비과세 금액
    private int vat;         // 부가세 금액
    private int point;       // 포인트 사용 금액
    private int discount;    // 할인 금액

    // Getter 및 Setter
    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getTax_free() {
        return tax_free;
    }

    public void setTax_free(int tax_free) {
        this.tax_free = tax_free;
    }

    public int getVat() {
        return vat;
    }

    public void setVat(int vat) {
        this.vat = vat;
    }

    public int getPoint() {
        return point;
    }

    public void setPoint(int point) {
        this.point = point;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }
}

