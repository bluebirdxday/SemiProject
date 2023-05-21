package project.kh.newsecond.myPage.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.user.model.dto.User;

@Repository
public class MyPageDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// DB에 있는 회원의 비밀번호 조회(비밀번호 대조군)
	public String selectEncPw(int userNo) {
		return sqlSession.selectOne("myPageMapper.selectEncPw", userNo);
	}
	
	// 비밀번호 변경
	public int changePw(String newPw, int userNo) {
		
		User user = new User();
		
		user.setUserPassword(newPw);
		user.setUserNo(userNo);
		
		return sqlSession.update("myPageMapper.changePw", user);
		
	}
	
	// 회원 탈퇴
	public int secession(int userNo) {
		return sqlSession.update("myPageMapper.secession", userNo);
	}

	
	
}
