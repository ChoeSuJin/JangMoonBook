package com.kosta.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.board.model.BoardVO;
import com.kosta.board.service.BoardServiceImpl;

@Controller
public class BoardController {

	@Inject
	BoardServiceImpl boardService;
	
	@RequestMapping("/board/list.do")
	public ModelAndView list(@RequestParam(defaultValue="all") String searchOption, @RequestParam(defaultValue="") String keyword) throws Exception{
		// 게시물 수
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
	
	@RequestMapping("/board/write.do")
	public String write(){
		return "board/write";
	}
	
	@RequestMapping("/board/insert.do")
	public String insert(@ModelAttribute BoardVO vo) throws Exception{
		boardService.create(vo);		
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("/board/view.do")
	public ModelAndView view(@RequestParam int bno) throws Exception{
		//議고쉶�닔 利앷�泥섎━
		boardService.increaseViewcnt(bno);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("dto", boardService.read(bno));
		return mav;
	}
	
	@RequestMapping("/board/update.do")
	public String update(@ModelAttribute BoardVO vo) throws Exception{
		boardService.update(vo);
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("/board/delete.do")
	public String delete(@RequestParam int bno) throws Exception{
		boardService.delete(bno);
		return "redirect:/board/list.do";
	}
}
