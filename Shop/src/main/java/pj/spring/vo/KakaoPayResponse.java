package pj.spring.vo;

import java.util.Map;

import lombok.Data;

@Data
public class KakaoPayResponse { // API 응답 데이터

    private String tid;                  // 결제 고유번호
    private Map<String, Integer> amount; // JSON 응답의 amount 객체를 Map으로 처리
    private String item_name;
    private String next_redirect_pc_url; // 카카오톡으로 결제 요청 메시지(TMS)를 보내기 위한 사용자 정보 입력화면 Redirect URL (카카오 측 제공)
    private String created_at; // 결제 생성 시간
	
    @Override
    public String toString() {
        return "KakaoPayResponse{" +
                "tid='" + tid + '\'' +
                ", amount=" + amount +
                ", itemName='" + item_name + '\'' +
                ", createdAt='" + created_at + '\'' +
                '}';
    }

	public Map<String, Integer> getAmount() {
		return amount;
	}

	public void setAmount(Map<String, Integer> amount) {
		this.amount = amount;
	}

	public String getItem_name() {
		return item_name;
	}


	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}


	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getTid() {
		return tid;
	}
	public void setTid(String tid) {
		this.tid = tid;
	}
	public String getNext_redirect_pc_url() {
		return next_redirect_pc_url;
	}
	public void setNext_redirect_pc_url(String next_redirect_pc_url) {
		this.next_redirect_pc_url = next_redirect_pc_url;
	}
}