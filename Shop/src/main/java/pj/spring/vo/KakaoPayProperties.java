package pj.spring.vo;

public class KakaoPayProperties {
	
	private String secretKey = "DEV4585768F73DA4201B5949323CE5E29D49E2B4";
	private String cid = "TC0ONETIME";
	
	public String getSecretKey() {
		return secretKey;
	}
	public void setSecretKey(String secretKey) {
		this.secretKey = secretKey;
	}
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
}
