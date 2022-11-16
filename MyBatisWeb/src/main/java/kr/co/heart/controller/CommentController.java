package kr.co.heart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.heart.domain.CommentDto;
import kr.co.heart.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService service;
	
	//지정된 댓글을 삭제하는 메서드
	@DeleteMapping("/comments/{cno}")
	public ResponseEntity<String> remove(@PathVariable Integer cno, Integer bno, HttpSession session){
		String commenter = "ezen";
		try {
			int rowCnt = service.remove(cno, bno, commenter);
			if(rowCnt != 1)
				throw new Exception("Del Failed");
			
			return new ResponseEntity<>("Del_OK", HttpStatus.OK);
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>("Del_ERR", HttpStatus.BAD_REQUEST);
		}
	}
	
	//지정된 게시물의 모든 댓글을 가져오는 메서드
	@GetMapping("/comments")
	@ResponseBody
	public ResponseEntity<List<CommentDto>> list(Integer bno){
		List<CommentDto> list = null;
		
		try {
			list = service.getList(bno);
			System.out.println("list = " + list);
			return new ResponseEntity<List<CommentDto>>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<List<CommentDto>>(list, HttpStatus.BAD_REQUEST);
		}
		
//		return list;	//data를 리턴.
	}

}
