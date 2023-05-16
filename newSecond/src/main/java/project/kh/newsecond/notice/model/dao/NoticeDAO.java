package project.kh.newsecond.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.notice.model.dto.Notice;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**공지사항 리스트 조회
	 * @return
	 */
	public List<Notice> selectNoticeList() {
		
		return sqlSession.selectList("NoticeMapper.selectNoticeList");
	}

	public List<Notice> selectNoticeOneList(int noticeNo) {
		
		return sqlSession.selectList("NoticeMapper.selectNoticeOneList",noticeNo);
	}




	
}
