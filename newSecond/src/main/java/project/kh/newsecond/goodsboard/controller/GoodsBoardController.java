package project.kh.newsecond.goodsboard.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.goodsboard.model.service.GoodsBoardService;
import project.kh.newsecond.shop.model.dto.Shop;
import project.kh.newsecond.user.model.dto.User;

@Controller
@RequestMapping("/goods")
@SessionAttributes({"loginUser"})
public class GoodsBoardController {
	
	@Autowired
	private GoodsBoardService service;
	
	// 지영
	// 상품 게시글 목록 조회(검색)
	@GetMapping("/search/goodsList")
	public String selectSearchGoodsList(@RequestParam(value="query", required=false)String searchName, Model model) {
		
		Map<String, Object> map = service.selectSearchGoodsList(searchName);
		
		// 조회 결과
		model.addAttribute("map", map);
		
		return "goods/searchGoodsList";
	}
	
	// 상품 게시글 추가 조회 (더보기)
	@PostMapping("/searchMore")
	@ResponseBody
	public List<GoodsBoard> searchMoreGoodsList(@RequestBody Map<String, Object> numAndSearchName){

		return service.moreGoods(numAndSearchName);
	}
	
	// 상품 게시글 상세 조회
	@GetMapping("/{goodsNo}")
	public String goodsDetail(
			@PathVariable("goodsNo") int goodsNo,
			Model model,
			@SessionAttribute(value="loginUser", required=false) User loginUser,
			HttpServletRequest req, // 조회수
			HttpServletResponse resp
			) throws ParseException {
		
		GoodsBoard goodsBoard = service.goodsDetail(goodsNo);
		
		String path = null;
		
		// 기존 찜 조회
		Map<String, Object> map = new HashMap<>();
		map.put("goodsNo", goodsNo);
		
		if(goodsBoard != null) {
			if(loginUser != null) {
				map.put("userNo", loginUser.getUserNo());
				int result = service.goodsLikeChecked(map);
				if(result>0) model.addAttribute("likeChecked","like");
			}
			// 조회수
			if(loginUser==null || loginUser.getUserNo()!=goodsBoard.getUserNo()) {
				Cookie c = null;
				Cookie[] cookies = req.getCookies();
				if(cookies!=null) {
					for(Cookie cookie : cookies) {
						if(cookie.getName().equals("readGoodsNo")) {
							c = cookie;
							break;
						}
					}
				}
				int result = 0;
				if(c==null) {
					c = new Cookie("readGoodsNo","|"+goodsNo+"|");
					result = service.updateViewCount(goodsNo);
				}else {
					if(c.getValue().indexOf("|"+goodsNo+"|")==-1) {
						c.setValue(c.getValue()+"|"+goodsNo+"|");
						result = service.updateViewCount(goodsNo);
					}
				}
				if(result>0) { // 조회 수 증가 성공하면 쿠키 적용 경로, 수명 지
					goodsBoard.setViewCount(goodsBoard.getViewCount()+1);
					c.setPath("/"); // /이하 경로 요청 시 쿠키 서버로 전달
					Calendar cal = Calendar.getInstance();
					cal.add(cal.DATE, 1);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date a = new Date();
					Date temp = new Date(cal.getTimeInMillis());
					Date b = sdf.parse(sdf.format(temp));
					long diff = (b.getTime()-a.getTime())/1000;
					c.setMaxAge((int)diff);
					resp.addCookie(c);
				}
			}
		}
		model.addAttribute("goodsBoard", goodsBoard);
		model.addAttribute("loginUser", loginUser);
		// 상점 정보
		Shop shop = service.shopInfo(goodsNo);
		model.addAttribute("shop",shop);
		
		return "/goods/goodsDetail";
	}
	
	// 찜(좋아요) 증가 
	@PostMapping("/like")
	@ResponseBody
	public int like(@RequestBody Map<String, Integer> likeMap) {
		System.out.println(likeMap);
		return service.like(likeMap);
	}
	
	// 게시글 상세 조회에서 판매자 상정 바로가기
	@GetMapping("/goodsDetail/moveShop")
	public String moveShop() {
		return "/shop/shop";
	}
	
	
	

}
