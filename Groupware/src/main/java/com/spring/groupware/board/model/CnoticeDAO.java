package com.spring.groupware.board.model;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
// import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

//=== #32. DAO 선언 ===
@Component
@Repository
public class CnoticeDAO implements InterCnoticeDAO {	
	
	@Resource
	private SqlSessionTemplate sqlsession; // 로컬 DB에 연결

	@Resource
	private SqlSessionTemplate sqlsession2; // 원격 DB에 연결
	
	@Resource
	private SqlSessionTemplate sqlsession3; // 로컬 DB에 hr로 연결

	// === #56. 글쓰기(파일첨부가 없는 글쓰기) === //
	@Override
	public int add(CnoticeVO cnoticevo) {
		int n = sqlsession.insert("board.comAdd", cnoticevo);
		return n;
	}

	// === 페이징 처리를 안한 검색어가 없는 전체 글목록 보여주기 == //
	@Override
	public List<CnoticeVO> boardListNoSearch() {
		List<CnoticeVO> boardList = sqlsession.selectList("board.comListNoSearch");
		return boardList;
	}

	// === 글 조회수 1 증가하기 === //
	@Override
	public void setAddReadCount(String cnotice_seq) {
		sqlsession.update("board.setComAddHit", cnotice_seq);
	}

	// === 글 1개 조회하기 === //
	@Override
	public CnoticeVO getView(String cnotice_seq) {
		CnoticeVO boardvo = sqlsession.selectOne("board.getComView", cnotice_seq);
		return boardvo;
	}

	// === 1개글 삭제하기 === //
	@Override
	public int del(Map<String, String> paraMap) {
		int n = sqlsession.delete("board.delCom",paraMap);		
		return n;
	}

	// === 1개글 수정하기 === //
	@Override
	public int edit(CnoticeVO cnoticevo) {
		int n = sqlsession.update("board.editCom",cnoticevo);		
		return n;
	}
}
