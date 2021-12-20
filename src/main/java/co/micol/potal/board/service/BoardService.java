package co.micol.potal.board.service;

import java.util.List;

public interface BoardService {
	List<BoardVO> boardSelectList();
	BoardVO boardSelect(BoardVO vo);
	int boardInsert(BoardVO vo);
	int boardUpdate(BoardVO vo);
	int boardDelete(BoardVO vo);
	void boardHit(int n);
	List<BoardVO> boardSearchList(String key, String val);	// 검색
	void boardNoupdate(int n);	// 글 삭제 후 번호를 맞춤
}
