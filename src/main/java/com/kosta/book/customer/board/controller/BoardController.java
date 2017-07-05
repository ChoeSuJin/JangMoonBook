package com.kosta.book.customer.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.book.customer.board.model.BoardVO;
import com.kosta.book.customer.board.service.BoardServiceImpl;

@Controller
public class BoardController {

	@Inject
	BoardServiceImpl boardService;
	
	@RequestMapping("/boardList.do")
	public ModelAndView list(@RequestParam(defaultValue="all") String searchOption, @RequestParam(defaultValue="") String keyword) throws Exception{
		// 게시�? ?��
		int count=boardService.countArticle(searchOption, keyword);
		
		List<BoardVO> list = boardService.listAll( searchOption, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("search_option", searchOption);
		map.put("keyword", keyword);
		mav.addObject("map", map);
		return mav;
	}
	
	@RequestMapping("/boardWrite.do")
	public String write(){
		return "board/write";
	}
	
	@RequestMapping("/boardInsert.do")
	public String insert(@ModelAttribute BoardVO vo) throws Exception{
		boardService.create(vo);		
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardView.do")
	public ModelAndView view(@RequestParam int bno) throws Exception{
		//議고?���닔 利앷�泥?��?��
		boardService.increaseViewcnt(bno);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("dto", boardService.read(bno));
		return mav;
	}
	
	@RequestMapping("/boardUpdate.do")
	public String update(@ModelAttribute BoardVO vo) throws Exception{
		boardService.update(vo);
		return "redirect:/boardList.do";
	}
	
	@RequestMapping("/boardDelete.do")
	public String delete(@RequestParam int bno) throws Exception{
		boardService.delete(bno);
		return "redirect:/boardList.do";
	}
}
