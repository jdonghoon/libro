package pj.spring.service;

import java.util.Map;

public interface AdminService {

	public Map<String, Object> orderCount();
	public Map<String, Object> cancelCount();
	public Map<String, Object> contentCount();
	
}
