package project.kh.newsecond.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.admin.model.dao.AdminDAO;
import project.kh.newsecond.admin.model.dto.Admin;
import project.kh.newsecond.admin.model.dto.Pagination;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.notice.model.dto.Notice;
import project.kh.newsecond.qna.model.dto.Qna;
import project.kh.newsecond.user.model.dto.User;
import project.kh.newsecond.common.utility.*;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDao;
	
	/**
	 *관리자 공지사항 게시글 리스트
	 */
	@Override
	public Map<String, Object> selectNoticeList(int cp) {
		
		int listCount = adminDao.getListCount();
		
		Pagination pagination = new Pagination(listCount, cp);
		
		List<Notice> noticeList = adminDao.selectNoticeList(pagination);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination",pagination);
		map.put("noticeList",noticeList);
		
		return  map;
	}

	/**
	 *관리자 회원 리스트 조회
	 */
	@Override
	public Map<String, Object> selectUserList(int cp) {
	
		int userlistCount = adminDao.userListCount();
		
		Pagination pagination = new Pagination(userlistCount, cp);
		
		
		List<User> userList = adminDao.selectUserList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination",pagination);
		map.put("userList",userList);
		
		
		
		return map;
	}

	
	/**
	 *관리자 문의사항 리스트 조회 //페이지네이션
	 */
	@Override
	public Map<String, Object> selectQnaList(int cp) {

		int qnalistCount = adminDao.getqnaListCount();
		
		Pagination pagination = new Pagination(qnalistCount, cp);
		
		List<Qna> qnaList = adminDao.selectQnaList(pagination);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination",pagination);
		map.put("qnaList",qnaList);
		
		return  map;
	}

	/**
	 *관리자 게시글 리스트 조회
	 */
	@Override
	public Map<String, Object> selectGoodsBoardList(int cp) {
	
		int boardlistCount = adminDao.boardlistCount();
		
		Pagination pagination = new Pagination(boardlistCount, cp);
		
		
		List<GoodsBoard> boardList = adminDao.selectGoodsBoardList(pagination);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pagination",pagination);
		map.put("boardList",boardList);
		
		
		
		return map;
	}

	/**
	 *관리자 공지사항 게시글 읽기 조회
	 */
	@Override
	public Notice selectNoticeOne(int noticeNo) {
		
		return adminDao.selectNoticeOne(noticeNo);
	}

	/**
	 *문의사항 게시글 조회
	 */
	@Override
	public Qna selectqnaOne(int qnaNo) {
		
		return adminDao.selectqnaOne(qnaNo);
	}

	/**
	 *공지사항 게시글 삽입
	 */
	@Transactional(rollbackFor =  Exception.class)
	@Override
	public int noticeInsert(Notice notice) {
		
		
		 notice.setNoticeContent(Util.XXSHandling(notice.getNoticeContent()));
		 notice.setNoticeTitle(Util.XXSHandling(notice.getNoticeTitle()));
	
		int result = adminDao.noticeInsert(notice);
		
		return result;
	}

	/**
	 *공지사항 게시글 수정
	 */
	@Override
	public int noticeUpdate(Notice notice) {

		int result = adminDao.noticeUpdate(notice);
		
		return result;
	}

	/**
	 *공지사항 게시글 삭제
	 */
	@Override
	public int noticeDelete(Notice notice) {
	
		int result = adminDao.noticeDelete(notice);
		
		return result;
	}

	/**
	 *공지사항 게시글 선택 삭제
	 */
	@Override
	public int noticeListDelete(int noticeNo) {
		
		int result = adminDao.noticeListDelete(noticeNo);
		
		return result;
	}



	
	  /**
	 *회원탈퇴 기능
	 */
	@Override public int userSignOut(int userNo) {
	  
	  return adminDao.userSignOut(userNo); 
	  }
	
	
	

	/**
	 *공지사항 선택 삭제
	 */
	@Override
	public int deleteNoticeList(int noticeNo) {

		return adminDao.deleteNoticeList(noticeNo);
	}

	/**
	 *공지사항 조회수 증가
	 */
	@Override
	public int updateReadCount(int noticeNo) {
	
		return adminDao.updateReadCount(noticeNo);
	}

	/**
	 *문의사항 선택 삭제하기
	 */
	@Override
	public int qnaDelete(Qna qna) {
		
		return adminDao.qnaDelete(qna);
	}

	/**
	 *회원 블락
	 */
	@Override
	public int userBlock(int userNo) {
	
		return adminDao.userBlock(userNo);
	}
	
	/**
	 *회원 블락 해제
	 */
	@Override
	public int userBlockH(int userNo) {

		return adminDao.userBlockH(userNo);
	}

	/**
	 *관리자 게시글 블락
	 */
	@Override
	public int boardBlind(int goodsNo) {
		
		return adminDao.boardBlind(goodsNo);
	}

	/**
	 *관리자 게시글 삭제
	 */
	@Override
	public int boardDelete(int goodsNo) {
	
		return adminDao.boardDelete(goodsNo);
	}

	/**
	 *관리자 문의사항 radio 거래신고
	 */
	@Override
	public List<Qna> radioTrade(String qnaCategory) {
		
		return adminDao.radioTrade(qnaCategory);
	}

	/**
	 *관리자 회원 검색 기능
	 */
	@Override
	public Map<String, Object> userSelectList(String searchKeyword) {
		
		
		
		List<User> userSelectList = adminDao.userSelectList(searchKeyword);
		 
		 Map<String, Object> map = new HashMap<>();
		 
		 map.put("userSelectList", userSelectList);
	
		
		
		return map;
	}

	
}

	
	 



