package com.kosta.book.customer.board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<BoardVO> listAll(String searchOption,String keyword) throws Exception {
		Map<String,Object> map=
				new HashMap<String,Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		
		return sqlSession.selectList("board.listAll",map);
	}
	
	@Override
	public void create(BoardVO vo) throws Exception {
		sqlSession.insert("board.insert", vo);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		return sqlSession.selectOne("board.viewBoard", bno);
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		sqlSession.update("board.viewCount", bno);
	}
	
	@Override
	public void update(BoardVO vo) throws Exception {
		sqlSession.update("board.update", vo);	
	}

	@Override
	public void delete(int bno) throws Exception {
		sqlSession.delete("board.delete", bno);
	}

	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		Map<String,String> map=
				new HashMap<String,String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return sqlSession.selectOne(
				"board.countArticle", map);
	}

	


}
