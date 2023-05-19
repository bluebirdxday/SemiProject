package project.kh.newsecond.shop.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import project.kh.newsecond.common.utility.Util;
import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.dao.ShopDAO;
import project.kh.newsecond.shop.model.dto.Follow;
import project.kh.newsecond.shop.model.dto.Shop;
import project.kh.newsecond.user.model.dto.User;

@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopDAO dao;


	// 내 상점 정보 조회
	@Override
	public Shop selectShopInfo(int userNo) {
		return dao.selectShopInfo(userNo);
	}
	
	// 게시글 리스트 조회
	@Override
	public List<GoodsBoard> selectGoodsBoardList(int userNo) {
		return dao.selectGoodsBoardList(userNo);
	}

	// 상점 오픈일 조회
	@Override
	public int selectShopOpenDay(int userNo) {
		return dao.selectShopOpenDay(userNo);
	}

	
	// 팔로우 리스트 조회
	@Override
	public List<Follow> selectFollowList(Map<String, Integer> map) {
		return dao.selectFollowList(map);
	}

	// 팔로워 리스트 조회
	@Override
	public List<Follow> selectFollowerList(Map<String, Integer> map) {
		return dao.selectFollowerList(map);
	}

	// 팔로 유무 조회(로그인 유저->상점주인)
	@Override
	public int checkFollow(Map<String, Integer> map) {
		return dao.checkFollow(map);
	}


	
	// 상점 팔로우
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int follow(Follow follow) {
		return dao.follow(follow);
	}

	
	// 상점 언팔로우
	@Override
	@Transactional(rollbackFor=Exception.class)
	public int unFollow(Follow unfollow) {
		return dao.unFollow(unfollow);
	}

	// 상점 편집
//	@Override
//	public int updateShopInfo(MultipartFile shopProfile, String shopInfo, String shopTitle, String webPath, String filePath, User loginUser) {
//		
//		String oldUserImage = loginUser.getUserImage();
//		String rename = null;
//		
//		if(shopProfile.getSize()>0) {
//			rename = Util.fileRename(shopProfile.getOriginalFilename());
//			
//			loginUser.setUserImage(webPath + rename);
//			
//		}else {
//			loginUser.setUserImage(null);
//		}
//		
//		
//		int result = dao.updateShopInfo(loginUser, shopInfo, shopTitle);
//		
//		return 0;
//	}


}
