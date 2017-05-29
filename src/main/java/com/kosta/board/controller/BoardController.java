package com.kosta.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.board.model.BoardVO;
import com.kosta.board.service.BoardServiceImpl;
import com.kosta.board.service.Pager;

@Controller
public class BoardController {

	@Inject
	BoardServiceImpl boardService;

	@RequestMapping("/board/list.do")
	public ModelAndView list(@RequestParam(defaultValue="1") int curPage,
			@RequestParam(defaultValue="title") String searchOption, 
			@RequestParam(defaultValue="") String keyword) 
					throws Exception{
		// 게시물 수
		int count=boardService.countArticle(searchOption, keyword);
		
		//페이지 나누기 관련 처리
		Pager pager=new Pager(count,curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<BoardVO> list = boardService.listAll(start, end, searchOption, keyword);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/list");
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.addObject("map", map);
		return mav;
	}
	
	
	@RequestMapping("/board/write.do")
	public String write(){
		return "board/write";
	}
	
	@RequestMapping("/board/insert.do")
	public String insert(@ModelAttribute BoardVO vo, HttpSession session) throws Exception{
		String id= (String)session.getAttribute("id");
		vo.setWriter(id);
		boardService.create(vo);		
		return "redirect:/board/list.do";
	}
	
	@RequestMapping("/board/view.do")
	public ModelAndView view(@RequestParam int bno
			,@RequestParam int curPage
			,@RequestParam String searchOption
			,@RequestParam String keyword
			,HttpSession session) throws Exception{
		//조회수 증가처리
		boardService.increaseViewcnt(bno,session);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("dto", boardService.read(bno));
		
		mav.addObject("curPage",curPage);
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
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
