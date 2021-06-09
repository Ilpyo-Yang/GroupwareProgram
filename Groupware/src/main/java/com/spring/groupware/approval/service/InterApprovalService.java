package com.spring.groupware.approval.service;

import java.util.*;
import com.spring.groupware.approval.model.ApprovalVO;
import com.spring.groupware.member.model.*;

public interface InterApprovalService {

	// 문서번호 가져오기
	String getFileNo();

	// 모달창에 입력될 전체 사원명 가져오기
	List<MemberVO> getMemberList();

	// 결재요청 정보 저장하기
	int submitApproval(ApprovalVO avo);

	// 첨부파일 있는 결재요청
	int submitAttachedApproval(Map<String, String> paraMap);



	




	
	
}
