package co.micol.potal.board.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.micol.potal.board.service.BoardService;
import co.micol.potal.board.service.BoardVO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardDao;
	
	// Mapper 메소드 생성
	@RequestMapping("/noticeList.do")
	public String noticeList(Model model) {
		model.addAttribute("boards", boardDao.boardSelectList());
		return "board/noticeList";
	}
	
	@PostMapping("/boardRead.do")
	public String boardRead(BoardVO vo, Model model) {
		vo = boardDao.boardSelect(vo);
		if(vo != null) {
			model.addAttribute("board", vo);	//글을 담음
			boardDao.boardHit(vo.getNo());	// 조회수 증가
		} else {
			model.addAttribute("message", "게시글이 존재하지 않습니다.");
		}
		
		return "board/boardRead";
	}
	
	@PostMapping("/ajaxBoardSearch.do")
	@ResponseBody
	public List<BoardVO> ajaxBoardSearch(
			@RequestParam("key") String key, @RequestParam("val") String val){
		
		return boardDao.boardSearchList(key, val);
	}
	
	@RequestMapping("/boardForm.do")
	public String boardForm(BoardVO vo, Model model){
		return "board/boardForm";
	}
	
	@PostMapping("/boardInsert.do")
	public String boardInsert(BoardVO vo, HttpSession session) {
		vo.setWriter((String)session.getAttribute("id"));
		boardDao.boardInsert(vo);
		return "redirect:noticeList.do";
	}
	
	@PostMapping("/boardDelete.do")
	public String boardDelete(BoardVO vo) {
		int n = boardDao.boardDelete(vo);
		if(n != 0) {	// 삭제 후 no 변경
			boardDao.boardNoupdate(vo.getNo());
		}
		return "redirect:noticeList.do";
	}
	
	@PostMapping("/boardUpdate.do")
	public String boardUpdate(BoardVO vo, HttpSession session) {
		vo.setWriter((String)session.getAttribute("id"));
		boardDao.boardUpdate(vo);
		return "board/boardEdit";
	}
}
