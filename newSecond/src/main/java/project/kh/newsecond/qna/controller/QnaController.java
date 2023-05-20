package project.kh.newsecond.qna.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.kh.newsecond.notice.model.dto.Notice;
import project.kh.newsecond.qna.model.dto.Qna;
import project.kh.newsecond.qna.model.service.QnaService;

@Controller
@RequestMapping("/qna")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
		@GetMapping("/qna")
		public String qna(){
			return "qna/qna";
		}
		
		@GetMapping("/qna_check")
		public String qna_check(
				Model model
				,Qna qna
				,RedirectAttributes ra){
			
			int qnaNo = qnaService.qnaInsert(qna);
			
			//삽입 성공 시
			String message = null;
			String path = "redirect:";
			if(qnaNo > 0) { //성공시
				
				message = "게시글이 등록 되었습니다.";
				path += "/qna/qna" + "/" + qnaNo;
				
			}else {
				message = "게시글이 등록 실패 되었습니다.";
				path += "qna";
			}

			model.addAttribute("Qna",qna);
			ra.addFlashAttribute("message",message);
			return path;
		
		}
	
	

	
}
