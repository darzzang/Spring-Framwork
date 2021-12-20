package co.micol.potal.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.micol.potal.board.service.BoardMapper;
import co.micol.potal.board.service.BoardService;
import co.micol.potal.board.service.BoardVO;

@Repository("boardDao")
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardMapper map;
	
	@Override
	public List<BoardVO> boardSelectList() {
		return map.boardSelectList();
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		return map.boardSelect(vo);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return map.boardInsert(vo);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return map.boardUpdate(vo);
	}

	@Override
	public int boardDelete(BoardVO vo) {
		return map.boardDelete(vo);
	}

	@Override
	public List<BoardVO> boardSearchList(String key, String val) {
		return map.boardSearchList(key, val);
	}

	@Override
	public void boardHit(int n) {
		map.boardHit(n);
	}

	@Override
	public void boardNoupdate(int n) {
		map.boardNoupdate(n);
	}
}
