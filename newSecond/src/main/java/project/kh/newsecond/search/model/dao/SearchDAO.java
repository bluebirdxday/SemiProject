package project.kh.newsecond.search.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SearchDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

}
