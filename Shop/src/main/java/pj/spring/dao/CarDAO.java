package pj.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarDAO {
	
	@Autowired
	public SqlSession sqlsession;
	
	private final String namespace = "pj.spring.mapper.carMapper";

}
