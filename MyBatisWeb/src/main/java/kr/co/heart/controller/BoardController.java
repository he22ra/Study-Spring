package kr.co.heart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.heart.domain.BoardDto;
import kr.co.heart.domain.PageResolver;
import kr.co.heart.domain.SearchItem;
import kr.co.heart.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@PostMapping("/modify")
	public String modify(BoardDto boardDto, Integer page, Integer pageSize,
						RedirectAttributes rattr, Model m, HttpSession session) {
		String writer = (String) session.getAttribute("id");
		boardDto.setWriter(writer);
		
		try {
			if(boardService.modify(boardDto) != 1)
				throw new Exception("Modify failed");
			
			rattr.addAttribute("page", page);
			rattr.addAttribute("pageSize", pageSize);
			rattr.addAttribute("msg", "MOD_OK");
			return "redirect:/board/list";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute(boardDto);
			m.addAttribute("page", page);
			m.addAttribute("pageSize", pageSize);
			m.addAttribute("msg", "MOD_ERR");
			return "board";							// 수정등록하려던 내용을 보여줌
		}	
	}
	
	@PostMapping("/write")
	public String write(BoardDto boardDto, RedirectAttributes rattr, Model m, HttpSession session) {
		String writer = (String) session.getAttribute("id");
		boardDto.setWriter(writer);
		
		try {
			if(boardService.write(boardDto) != 1)
				throw new Exception("Write failed");
			rattr.addFlashAttribute("msg", "WRT_OK");
			return "redirect:/board/list";
		} catch (Exception e) {
			e.printStackTrace();
			m.addAttribute("mode", "new");
			m.addAttribute("boardDto", boardDto);
			m.addAttribute("msg","WRT_ERR");
			return "board";
		}
	}
	
	@GetMapping("/write")
	public String write(Model m) {
		m.addAttribute("mode", "new");
		
		return "board";					// board.jsp 읽기와 쓰기에 사용. 쓰기에 사용할 때는 mode=new
		
	}
	
	@PostMapping("/remove")
	public String remove(Integer bno, Integer page, Integer pageSize, RedirectAttributes rattr, HttpSession session){
		System.out.println("삭제");
		String writer = (String) session.getAttribute("id");
		String msg = "DEL_OK";
		
		try {
			if(boardService.remove(bno, writer) != 91)
				throw new Exception("Delete failed.");
		} catch (Exception e) {
			e.printStackTrace();
			msg = "DEL_ERR";
		}
		// 삭제 후 메세지가 한 번만 나와야 함. Model이 아닌 RedirectAttributes에 저장하면 메세지가 한 번만 나옴.
		// addFlashAttribute() : 한 번 저장하고 없어지는 것. 세션에 잠깐 저장했다가 한 번 쓰고 지워버림. 세션에도 부담없음.
		rattr.addAttribute("page", page);
		rattr.addAttribute("pageSize", pageSize);
		rattr.addFlashAttribute("msg",msg);
		return "redirect:/board/list";
	}
	
	@GetMapping("/read")
	public String read(Integer bno, SearchItem sc, Model m) {
		try {
			BoardDto boardDto =	boardService.read(bno);
//			m.addAttribute("boardDto", boardDto);		// 아래 문장과 동일
			m.addAttribute(boardDto);
//			m.addAttribute("page", page);
//			m.addAttribute("pageSize", pageSize);
		
		} catch (Exception e) {
			e.printStackTrace();
//			예외발생 -> 목록으로 돌아가기
			return "redirect:/board/list";
		}
		return "board";
	}
	
	@GetMapping("/list")
	public String list(SearchItem sc,
					   Model m,
					   HttpServletRequest request) {
		
		if(!loginCheck(request))
			return "redirect:/login/login?toURL="+request.getRequestURL();
		try {
			
//			if(page == null) page = 1;
//			if(pageSize == null) pageSize=10;
			
			int totalCnt = boardService.getSearchResultCnt(sc);
			m.addAttribute("totalCnt", totalCnt);
			
			PageResolver pageResolver = new PageResolver(totalCnt, sc);
//			if(page < 0 || page > pageResolver.getTotalCnt())
//				page = 1;
//			if(pageSize < 0 || page > 50)
//				pageSize = 10;
			
//			Map map = new HashMap();
//			map.put("offset", (page-1)*pageSize);
//			map.put("pageSize", pageSize);
			
			List<BoardDto> list = boardService.getSearchResultPage(sc);
			m.addAttribute("list", list);
			m.addAttribute("pr", pageResolver);
			
//			m.addAttribute("page", page);
//			m.addAttribute("pageSize", pageSize);	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "boardList";							// 로그인 한 상태, 게시판 목록 화면으로 이동
	}

	private boolean loginCheck(HttpServletRequest request) {
		// 1. 세션을 얻어서
		HttpSession session = request.getSession(false);					// false는 session이 없어도 새로 생성하지 않음. 반환값 : null.
		// 2. 세션에 id가 있는지 확인, 있으면 true를 반환함
		return session != null && session.getAttribute("id") != null;
		
	}
	
	
}
