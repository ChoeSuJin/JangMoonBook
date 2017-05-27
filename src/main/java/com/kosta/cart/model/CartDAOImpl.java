package com.kosta.cart.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class CartDAOImpl implements CartDAO {

	@Inject
	SqlSession sqlSession;

	@Override
	public List<CartVO> listCart(String id) {
	
		return sqlSession.selectList("cart.listCart", id);
	}

	@Override
	public void insert(CartVO vo) {
		sqlSession.insert("cart.insert",vo);
	}
	@Override
	public void delete(String isbn) {
		sqlSession.delete("cart.delete", isbn);
	}

	@Override
	public void update(int cartno) {
	
		//sqlSession.update("cart.update", cartno);
	}

	@Override
	public int sumMoney(String id) {
		
		return sqlSession.selectOne("cart.sumMoney", id);
	}

	@Override
	public int countCart(String id, String isbn) {
		Map<String,Object> map=
				new HashMap<>();
		map.put("id", id);
		map.put("isbn", isbn);
		return sqlSession.selectOne("cart.countCart",map);
	}

	@Override
	public void updateCart(CartVO vo) {
		sqlSession.update("cart.update", vo);
		
	}

	@Override
	public void modifyCart(CartVO vo) {
		sqlSession.update("cart.modify", vo); 
	}

	

	
	
/*

	@Override
	public List<CartVO> cartMoney() {
		return sqlSession.selectList("cart.cart_money"); 
	}
*/
}
