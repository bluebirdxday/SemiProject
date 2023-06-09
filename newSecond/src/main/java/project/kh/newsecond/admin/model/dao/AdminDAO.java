package project.kh.newsecond.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.admin.model.dto.Admin;
import project.kh.newsecond.admin.model.dto.Pagination;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.notice.model.dto.Notice;
import project.kh.newsecond.qna.model.dto.Qna;
import project.kh.newsecond.user.model.dto.User;

/**
 * @author bfyu0
 *
 */
@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**관리자 공지사항 게시글 리스트
	 * @param cp 
	 * @return
	 */
	public List<Notice> selectNoticeList(Pagination pagination) {
	
		int offset = (pagination.getCurrentPage() - 1)
				* pagination.getLimit();

		

		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());		
		
		
		return sqlSession.selectList("AdminMapper.selectNoticeList",null,rowBounds);
	}
	
	/**관리자 공지사항 페이지 수
	 * @param cp
	 * @return
	 */
	public int getListCount() {

		return  sqlSession.selectOne("AdminMapper.getListCount");
	}
	
	
	/**관리자 회원관리 페이지수
	 * @return
	 */
	public int userListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("AdminMapper.userListCount");
	}
	
	/**회원관리 조회 리스트
	 * @return
	 */
	public List<User> selectUserList(Pagination pagination) {

		int offset = (pagination.getCurrentPage() - 1)
				* pagination.getLimit();


		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());	
		
		return sqlSession.selectList("AdminMapper.selectUserList",null,rowBounds);
	}

	/**관리자 문의사항 게시글 리스트//페이지네이션
	 * @return
	 */
	public List<Qna> selectQnaList(Pagination pagination) {
		

		int offset = (pagination.getCurrentPage() - 1)
				* pagination.getLimit();


		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());	
		
		return sqlSession.selectList("AdminMapper.selectQnaList",null,rowBounds);
	}
	
	
	/**관리자 문의사항 페이지 수
	 * @param cp
	 * @return
	 */
	public int getqnaListCount() {

		return  sqlSession.selectOne("AdminMapper.getqnaListCount");
	}
	

	/**관리자 게시글 수 조회
	 * @return
	 */
	public int boardlistCount() {
		
		return sqlSession.selectOne("AdminMapper.boardlistCount");
	}

	
	/**관리자 게시글 리스트 조회
	 * @return
	 */
	public List<GoodsBoard> selectGoodsBoardList(Pagination pagination) {
	
		int offset = (pagination.getCurrentPage() - 1)
				* pagination.getLimit();


		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());	
		
		return sqlSession.selectList("AdminMapper.selectGoodsBoardList",null,rowBounds);
		
		
		
	}

	/**관리자 공지사항 게시글 읽기 조회
	 * @return
	 */
	public Notice selectNoticeOne(int noticeNo) {
		
		return sqlSession.selectOne("AdminMapper.selectNoticeOne",noticeNo);
	}

	/**문의사항 게시글 읽기 조회
	 * @param qnaNo
	 * @return
	 */
	public project.kh.newsecond.qna.model.dto.Qna selectqnaOne(int qnaNo) {
		
		return sqlSession.selectOne("AdminMapper.selectqnaOne",qnaNo);
	}

	/**공지사항 게시글 삽입
	 * @param notice
	 * @return
	 */
	public int noticeInsert(Notice notice) {
		
		int result = sqlSession.insert("AdminMapper.noticeInsert",notice);
		
		if(result>0) result = notice.getNoticeNo();
 		
		return result;
	}

	/**공지사항 게시글 수정
	 * @param notice
	 * @return
	 */
	public int noticeUpdate(Notice notice) {
	
		int result = sqlSession.update("AdminMapper.noticeUpdate",notice);
		
		if(result>0) result = notice.getNoticeNo();
		
		return result;
	}

	/**공지사항 게시글 삭제
	 * @param notice
	 * @return
	 */
	public int noticeDelete(Notice notice) {
		
		int result = sqlSession.delete("AdminMapper.noticeDelete",notice);
		
		if(result>0) result = notice.getNoticeNo();
		
		return result;
	}


	/**공지사항 게시글 삭제
	 * @param notice
	 * @param paramMap
	 * @return
	 */
	public int noticeDelete(Notice notice, Map<String, Object> paramMap) {
	int result = sqlSession.delete("AdminMapper.noticeDelete",notice);
		
		if(result>0)  result = notice.getNoticeNo();
		
		return result;
	}

	/**공지사항 게시글 선택 삭제
	 * @param noticeNo
	 * @return
	 */
	public int noticeListDelete(int noticeNo) {
		
		return sqlSession.update("AdminMapper.noticeListDelete",noticeNo);
	}


	 

	
	  /**회원 탈퇴
	 * @param noticeNoInt
	 * @return
	 */
	public int userSignOut(int userNo) {
	  
	  return sqlSession.update("AdminMapper.userSignOut",userNo); 
	  }

	public int deleteNoticeList(int noticeNo) {
	
		return sqlSession.update("AdminMapper.deleteNoticeList",noticeNo); 
	}

	/**공지사항 조회수 증가
	 * @param noticeNo
	 * @return
	 */
	public int updateReadCount(int noticeNo) {
		
		return sqlSession.update("AdminMapper.updateReadCount",noticeNo); 
	}

	/**문의사항 선택 삭제하기
	 * @param qna
	 * @return
	 */
	public int qnaDelete(Qna qna) {
		
		return sqlSession.update("AdminMapper.qnaDelete",qna); 
	}

	/**회원 블락
	 * @param userNo
	 * @return
	 */
	public int userBlock(int userNo) {
		
		return sqlSession.update("AdminMapper.userBlock",userNo); 
	}

	/**회원 블락 해제
	 * @param userNo
	 * @return
	 */
	public int userBlockH(int userNo) {
		
		return sqlSession.update("AdminMapper.userBlockH",userNo); 
	}
	
	/**상품 게시글 블라인드
	 * @param goodsNo
	 * @return
	 */
	public int boardBlind(int goodsNo) {
	
		return sqlSession.update("AdminMapper.boardBlind",goodsNo); 
	}

	/**상품 게시글 삭제
	 * @param goodsNo
	 * @return
	 */
	public int boardDelete(int goodsNo) {
	
		return sqlSession.update("AdminMapper.boardDelete",goodsNo); 
	}

	/**문의관리 raido 검색 (시도, 기능 구현 X)
	 * @param qnaCategory
	 * @return
	 */
	public List<Qna> radioTrade(String qnaCategory) {
		
		return sqlSession.selectList("AdminMapper.radioTrade",qnaCategory); 
	}

	/**회원 검색 기능(구현X)
	 * @param searchKeyword
	 * @return
	 */
	public List<User> userSelectList(String searchKeyword) {
		
		return sqlSession.selectList("AdminMapper.userSelectList",searchKeyword); 
	}









	
}

