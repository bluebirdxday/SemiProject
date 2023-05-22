package project.kh.newsecond.priceView.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.kh.newsecond.priceView.model.dto.PriceViewKeyword;

@Repository
public class PriceViewResultDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int goodsPriceSelect(PriceViewKeyword keywords) {
		return sqlSession.selectOne("priceViewMapper.goodsPriceSelect", keywords);
	}

//	public int goodsPriceSelect2(PriceViewKeyword keywords) {
//		return sqlSession.selectOne("priceViewMapper.goodsPriceSelect2", keywords);
//	}
//
//	public int goodsPriceSelect3(PriceViewKeyword keywords) {
//		return sqlSession.selectOne("priceViewMapper.goodsPriceSelect3", keywords);
//	}
}
