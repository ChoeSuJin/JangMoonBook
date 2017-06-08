package com.kosta.board.controller;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kosta.board.model.ReplyVO;
import com.kosta.board.service.ReplyService;
 
 
@Controller
@RequestMapping("/reply/*")
public class ReplyController {
    
    @Inject
    ReplyService replyService;
    
    // 댓글 입력
    @RequestMapping("insert.do")
    public String insert(@ModelAttribute ReplyVO vo, HttpSession session){
        String id = (String) session.getAttribute("id");
        vo.setReplytext(vo.getReplytext());
        vo.setReplyer(id);
        replyService.create(vo);
        return "board/view";
    }
  
    public ModelAndView view(@RequestParam int bno) throws Exception{
    	ModelAndView mav = new ModelAndView();
    	mav.setViewName("board/view");
    	mav.addObject("dto", replyService.view(bno));
    	
    	return mav;
    }
    
    @RequestMapping("delete.do")
    public String delete(@RequestParam int rno) throws Exception{
    	replyService.delete(rno);	
    	return "board/view";
    }
    
    @RequestMapping("update.do")
    public String update(@ModelAttribute ReplyVO vo) throws Exception{
    	replyService.update(vo);
    	return "board/view";
    }
    

}
 



