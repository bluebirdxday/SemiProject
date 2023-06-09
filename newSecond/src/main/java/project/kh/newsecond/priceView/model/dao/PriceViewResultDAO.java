package project.kh.newsecond.priceView.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.goodsboard.model.dto.GoodsBoard;
import project.kh.newsecond.priceView.model.dto.PriceViewKeyword;

@Repository
public class PriceViewResultDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 1달 내
	public int goodsPriceSelect(PriceViewKeyword keywords) {
		return sqlSession.selectOne("priceViewMapper.goodsPriceSelect", keywords);
	}

	// 1달~2달 내
	public int goodsPriceSelect2(PriceViewKeyword keywords) {
		return sqlSession.selectOne("priceViewMapper.goodsPriceSelect2", keywords);
	}

	// 2달~3달 내
	public int goodsPriceSelect3(PriceViewKeyword keywords) {
		return sqlSession.selectOne("priceViewMapper.goodsPriceSelect3", keywords);
	}

	// 키워드로 최근상품 15개 조회
	public List<GoodsBoard> selectSearchKeyword(GoodsBoard goodsBoard) {
		return sqlSession.selectList("priceViewMapper.selectSearchKeyword", goodsBoard);
	}
}
