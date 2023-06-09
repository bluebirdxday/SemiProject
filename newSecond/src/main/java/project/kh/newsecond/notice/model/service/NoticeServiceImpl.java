package project.kh.newsecond.notice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.kh.newsecond.notice.model.dao.NoticeDAO;
import project.kh.newsecond.notice.model.dto.Notice;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDAO noticeDao;

	/**
	 *공지사항 조회 리스트
	 */
	@Override
	public List<Notice> selectNoticeList() {
		
		return noticeDao.selectNoticeList();
	}

	/**
	 *공지사항 게시글 읽기 조회
	 */
	@Override
	public Notice selectNoticeOneList(int noticeNo) {
		return noticeDao.selectNoticeOneList(noticeNo);
	}


	
	


	
	

}
