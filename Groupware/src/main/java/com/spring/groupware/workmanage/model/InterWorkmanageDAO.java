package com.spring.groupware.workmanage.model;

import java.util.List;
import java.util.Map;

import com.spring.groupware.member.model.MemberVO;

public interface InterWorkmanageDAO {
	
	// 업무 등록 페이지에서 나의 할일 등록하기 
	int workAddTodoEnd(TodoVO tdvo);

	// 나의 할일 리스트 페이지 보여주기 (전체) 
	List<TodoVO> todoList(String fk_mbr_seq);

	// 선택한 나의 할일 상세 보기 
	TodoVO showDetailTodo(Map<String, String> paraMap);

	// 업무(요청,보고) 등록하기   
	int workAddEnd(WorkVO workvo);

	// 업무(요청,보고) 리스트 조회하기
	List<WorkVO> workList(Map<String, String> paraMap);

	// 참조 업무 리스트(요청,보고) 보여주기 
	List<WorkVO> workListForRefer(Map<String, String> paraMap);

	// 페이징 처리 - 총 게시물 건수 가져오기
	int getTotalCount(Map<String, String> paraMap);

	// 선택한 업무(요청,보고) 상세 보기 
	WorkVO showDetailWork(Map<String, String> paraMap);

	// 담당자, 참조자 지정하기 위한 우선멤버 가져오기
	List<MemberVO> memberSearchShow(Map<String, String> paraMap);

}