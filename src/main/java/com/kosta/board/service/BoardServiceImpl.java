package com.kosta.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosta.board.model.BoardDAOImpl;
import com.kosta.board.model.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAOImpl boardDAO;
	
	@Override
	public List<BoardVO> listAll(String searchOption,String keyword) throws Exception {
		return boardDAO.listAll( searchOption, keyword);
	}
	
	@Override
	public void create(BoardVO vo) throws Exception {
		boardDAO.create(vo);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		return boardDAO.read(bno);
	}

	@Override
	public void increaseViewcnt(int bno) throws Exception {
		boardDAO.increaseViewcnt(bno);
	}
	
	@Override
	public void update(BoardVO vo) throws Exception {
		boardDAO.update(vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		boardDAO.delete(bno);
		
	}

	@Override
	public int countArticle(String searchOption, String keyword) throws Exception {
		return boardDAO.countArticle(searchOption, keyword);
	}

	


}
