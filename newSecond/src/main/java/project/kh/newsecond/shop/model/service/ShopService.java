package project.kh.newsecond.shop.model.service;

import java.util.List;
import java.util.Map;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.shop.model.dto.Follow;
import project.kh.newsecond.shop.model.dto.Shop;


public interface ShopService {

	/** 내상점 정보 조회
	 * @param userNo
	 * @return shop
	 */
	Shop selectShopInfo(int userNo);
	

	/** 게시글 리스트 조회
	 * @param userNo
	 * @return board
	 */
	List<GoodsBoard> selectGoodsBoardList(int userNo);


	/** 상점 오픈일 조회
	 * @param userNo
	 * @return openDays
	 */
	int selectShopOpenDay(int userNo);


	/** 팔로우 리스트 조회
	 * @param map
	 * @return followList
	 */
	List<Map<String, Object>> selectFollowList(Map<String, Integer> map);


	/** 팔로워 리스트 조회
	 * @param map
	 * @return followerList
	 */
	List<Map<String, Object>> selectFollowerList(Map<String, Integer> map);


	/** 팔로 유무 조회(로그인 유저->상점주인)
	 * @param map
	 * @return checkFollow
	 */
	int checkFollow(Map<String, Integer> map);


	/** 상점 팔로우
	 * @param follow
	 * @return result
	 */
	int follow(Follow follow);

	
	/** 상점 언팔로우
	 * @param unfollow
	 * @return result
	 */
	int unFollow(Follow unfollow);

}
