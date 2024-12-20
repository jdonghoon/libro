package pj.spring.vo;

public class ReviewVO extends OrderedVO {
	private String review_no;			// 리뷰번호
	private String review_content;		// 내용
	private String review_status;		// 상태
	private String review_starrating;	// 별점
	private String review_create_at;	// 등록일
	private String review_create_id;	// 등록id
	private String review_create_ip;	// 등록ip
	private String review_update_at;	// 수정일
	private String review_update_id;	// 수정id
	private String review_update_ip;	// 수정ip
	
	private String review_five_score;	// 5점 비율
	private String review_four_score;	// 4점 비율
	private String review_three_score;	// 3점 비율
	private String review_two_score;	// 2점 비율
	private String review_one_score;	// 1점 비율
	private String user_id;				// 유저 번호 (id로 변경 필요)
	private String review_seq;		 		
	
	public String getReview_seq() {
		return review_seq;
	}
	public void setReview_seq(String review_seq) {
		this.review_seq = review_seq;
	}
	public String getReview_five_score() {
		return review_five_score;
	}
	public void setReview_five_score(String review_five_score) {
		this.review_five_score = review_five_score;
	}
	public String getReview_four_score() {
		return review_four_score;
	}
	public void setReview_four_score(String review_four_score) {
		this.review_four_score = review_four_score;
	}
	public String getReview_three_score() {
		return review_three_score;
	}
	public void setReview_three_score(String review_three_score) {
		this.review_three_score = review_three_score;
	}
	public String getReview_two_score() {
		return review_two_score;
	}
	public void setReview_two_score(String review_two_score) {
		this.review_two_score = review_two_score;
	}
	public String getReview_one_score() {
		return review_one_score;
	}
	public void setReview_one_score(String review_one_score) {
		this.review_one_score = review_one_score;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getReview_no() {
		return review_no;
	}
	public void setReview_no(String review_no) {
		this.review_no = review_no;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_status() {
		return review_status;
	}
	public void setReview_status(String review_status) {
		this.review_status = review_status;
	}
	public String getReview_starrating() {
		return review_starrating;
	}
	public void setReview_starrating(String review_starrating) {
		this.review_starrating = review_starrating;
	}
	public String getReview_create_at() {
		return review_create_at;
	}
	public void setReview_create_at(String review_create_at) {
		this.review_create_at = review_create_at;
	}
	public String getReview_create_id() {
		return review_create_id;
	}
	public void setReview_create_id(String review_create_id) {
		this.review_create_id = review_create_id;
	}
	public String getReview_create_ip() {
		return review_create_ip;
	}
	public void setReview_create_ip(String review_create_ip) {
		this.review_create_ip = review_create_ip;
	}
	public String getReview_update_at() {
		return review_update_at;
	}
	public void setReview_update_at(String review_update_at) {
		this.review_update_at = review_update_at;
	}
	public String getReview_update_id() {
		return review_update_id;
	}
	public void setReview_update_id(String review_update_id) {
		this.review_update_id = review_update_id;
	}
	public String getReview_update_ip() {
		return review_update_ip;
	}
	public void setReview_update_ip(String review_update_ip) {
		this.review_update_ip = review_update_ip;
	}
	
	
}
