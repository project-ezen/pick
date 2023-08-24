package com.edu.board.service;

import java.util.List;

import com.edu.board.dto.boardDTO;
import com.edu.board.dto.pagingCriteria;

public interface boardService {
	public List<boardDTO> boardListPaging(pagingCriteria cri) throws Exception;
}
