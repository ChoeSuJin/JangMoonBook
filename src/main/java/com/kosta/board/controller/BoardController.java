package com.kosta.board.controller;

import java.util.ArrayList;
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
import com.kosta.board.model.ReplyVO;
import com.kosta.board.service.BoardServiceImpl;
import com.kosta.board.service.Pager;
import com.kosta.board.service.ReplyServiceImpl;

@Controller
public class BoardController {

	@Inject
	BoardServiceImpl boardService;
	
	@Inject
	ReplyServiceImpl replyService;
	
	@RequestMapping("/boardList.do")
	public ModelAndView list(@RequestParam(defaultValue="1") int curPage,
							 @RequestParam(defaultValue="title") String searchOption, 
							 @RequestParam(defaultValue="") String keyword) throws Exception{
		
		// 게시물 수
		int count=boardService.countArticle(searchOption, keyword);
				
		//페이지 나누기 관련 처리
		Pager pager=new Pager(count,curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		
		List<BoardVO> list = boardService.listAll(start, end, searchOption, keyword);
		ModelAndView mav = new ModelAndView();
		Map<String,Object> map = new HashMap<String,Object>();
		
		int totSize = list.size();
		
		if (end > totSize)
			end = totSize;
		
		System.out.println("현재페이지 = " + curPage);
		System.out.println("start = " + start);
		System.out.println("end = " + end);
		List<BoardVO> list2 = new ArrayList<BoardVO>();
		
		for (int i = start - 1; i < end; i++) {
			list2.add(list.get(i));
		}
		
		map.put("list", list2);
		map.put("count", count);
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("pager", pager);
		mav.addObject("map", map);
		mav.setViewName("board/list");
		
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
	public ModelAndView view(@RequestParam int bno
							,@RequestParam int curPage
							,@RequestParam String searchOption
							,@RequestParam String keyword
							,HttpSession session) throws Exception{
		//조회수 증가처리
		boardService.increaseViewcnt(bno,session);
		ReplyVO reply = replyService.view(bno);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("dto", boardService.read(bno));
		mav.addObject("reply", reply);
		
		mav.addObject("curPage",curPage);
		mav.addObject("searchOption", searchOption);
		mav.addObject("keyword", keyword);
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
