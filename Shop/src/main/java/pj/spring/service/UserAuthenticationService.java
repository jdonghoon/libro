package pj.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import pj.spring.vo.UserSecurityVO;
import pj.spring.vo.UserVO;

public class UserAuthenticationService implements UserDetailsService{

	SqlSession sqlSession;
	
	public UserAuthenticationService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		System.out.println("username : " + username);
		
		UserVO user = sqlSession.selectOne("pj.spring.mapper.userMapper.selectOneById", username);

		System.out.println("userID : " + user.getUser_id());
		 
		String user_id = (String)user.getUser_id();
		String user_password = (String)user.getUser_password();
		String user_status = (String)user.getUser_status();
		
		boolean enabled;
		if(user_status.equals("E")) {
			enabled = true;
		}else {
			enabled = false;
		}
		
		System.out.println(user_id);
		System.out.println(user_password);
		System.out.println(user_status);
		
		List<GrantedAuthority> autorities = new ArrayList<>();
		autorities.add(new SimpleGrantedAuthority((String)user.getUser_type()));
		
		UserSecurityVO vo = new UserSecurityVO(user_id, user_password, enabled
								, true, true, true
								, autorities
								, (String)user.getUser_type());
		return vo;
	}

}
