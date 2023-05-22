package project.kh.newsecond.goodsboard.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import project.kh.newsecond.goodsboard.model.dao.GoodsBoardDAO;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;

@Service
public class GoodsBoardServiceImpl implements GoodsBoardService{
	
	@Autowired
	private GoodsBoardDAO dao;
	
	
	// 지영
	// 상품 게시글 목록 조회(검색)
	 @Override
	public Map<String, Object> selectSearchGoodsList(String searchName) {
		 
		 // 검색 조건 일치하는 삭제x 특정 상품게시글 count
		 int searchGoodsCount = dao.searchGoodsCount(searchName);
		 
		 // 검색 상품 목록 조회 
		 List<GoodsBoard> searchGoodsList = dao.selectSearchGoodsList(searchName);
		 
		 Map<String, Object> map = new HashMap<>();
		 
		 map.put("searchGoodsCount", searchGoodsCount);
		 map.put("searchGoodsList", searchGoodsList);
		 
		return map;
	}
	 
	 // 상품 더보기
	 @Override
	public List<GoodsBoard> moreGoods(Map<String, Object> numAndSearchName) {
		return dao.moreGoods(numAndSearchName);
	}
	 
	 
	 // 상품 게시글 상세 조회
	 @Override
	public GoodsBoard goodsDetail(int goodsNo) {
		return dao.goodsDetail(goodsNo);
	}
	 
	// 기존 찜 여부 확인
	@Override
	public int goodsLikeChecked(Map<String, Object> map) {
		return dao.goodsLikeChecked(map);
	}
	
	// 찜 처리 
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int like(Map<String, Integer> likeMap) {
		int result = 0;
		if(likeMap.get("check")==0) {
			result = dao.insertLike(likeMap);
		}else {
			result = dao.deleteLike(likeMap);
		}
		
		if(result==0) return -1;
		
		int count = dao.countLike(likeMap.get("goodsNo"));
		return count;
	}
	 
	 
	 
	 
	 
	 

}
