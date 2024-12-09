package pj.spring.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

/*
	해당 VO 객체는 security에서 로그인 또는 권한 인증시에만 사용하는 객체 타입으로서
	별도의 기능을 목적으로는 사용할 수 없다.
	필요시 타 VO를 추가하여 사용할 것을 권장한다.
*/
public class UserSecurityVO extends User{

	private String user_id;
	private String user_type;
	private boolean user_status;
	
	public UserSecurityVO(String username, String password, boolean enabled, boolean accountNonExpired,
			boolean credentialsNonExpired, boolean accountNonLocked,
			Collection<? extends GrantedAuthority> authorities,
			String authority) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
		
		this.user_id = username;
		this.user_type = authority;
		this.user_status = enabled;
		
	}

	// 생성자에서 셋팅 했기 때문에 getter만 있어도 됨
	public String getUserid()    { return user_id;     }
	public String getAuthority() { return user_type;   }
	public boolean isEnabled()   { return user_status; }

}
