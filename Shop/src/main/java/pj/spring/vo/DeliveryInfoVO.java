package pj.spring.vo;

public class DeliveryInfoVO {
    private String address;         // 배송지 주소
    private String detailAddress;   // 상세 주소
    private String extraAddress;    // 추가 주소 정보 (예: 참고 항목)
    private String memo;            // 배송 메모

    // 기본 생성자
    public DeliveryInfoVO() {}

    // 생성자
    public DeliveryInfoVO(String address, String detailAddress, String extraAddress, String memo) {
        this.address = address;
        this.detailAddress = detailAddress;
        this.extraAddress = extraAddress;
        this.memo = memo;
    }

    // Getter & Setter
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDetailAddress() {
        return detailAddress;
    }

    public void setDetailAddress(String detailAddress) {
        this.detailAddress = detailAddress;
    }

    public String getExtraAddress() {
        return extraAddress;
    }

    public void setExtraAddress(String extraAddress) {
        this.extraAddress = extraAddress;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    @Override
    public String toString() {
        return "DeliveryInfoVO{" +
               "address='" + address + '\'' +
               ", detailAddress='" + detailAddress + '\'' +
               ", extraAddress='" + extraAddress + '\'' +
               ", memo='" + memo + '\'' +
               '}';
    }
}

