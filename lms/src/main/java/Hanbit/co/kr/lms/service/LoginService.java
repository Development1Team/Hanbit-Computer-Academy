package Hanbit.co.kr.lms.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Hanbit.co.kr.lms.mapper.LoginMapper;
import Hanbit.co.kr.lms.util.CF;
import Hanbit.co.kr.lms.vo.Member;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class LoginService {
	@Autowired LoginMapper loginMapper;
	
	public Map<String, Object> selectMemberId(Map<String, Object> map){
		String memberId = (String)(map.get("memberId"));
		String memberPw = (String)(map.get("memberPw"));
		String role = (String)(map.get("role"));
		// memberId + memberPw + role 디버깅
		log.debug(CF.SWB+"[LoginService selectMemberId memberId]"+ memberId+CF.RESET);
		log.debug(CF.SWB+"[LoginService selectMemberId memberPw]"+ memberPw+CF.RESET);
		log.debug(CF.SWB+"[LoginService selectMemberId role]"+ role+CF.RESET);
		
		// 변수 설정
		Member member = new Member();
		if("student".equals(role)) { // 사용자 선택이 학생이리면...
			String studentId = memberId;
			String studentPw = memberPw;
			member = loginMapper.selectStudent(studentId, studentPw);
			
		} else if("teacher".equals(role)) { // 사용자 선택이 강사라면...
			String teacherId = memberId;
			String teacherPw = memberPw;
			member = loginMapper.selectTeacher(teacherId, teacherPw);
		}else if("manager".equals(role)) { // 사용자 선택이 운영자라면...
			String managerId = memberId;
			String managerPw = memberPw;
			member = loginMapper.selectManager(managerId, managerPw);
		}		
		// member 디버깅
		log.debug(CF.SWB+"[LoginService selectMemberId member]"+ member+CF.RESET);	
		String error = null;
		// member아이디를 찾았다면 로그 업데이트
		Map<String, Object> returnMap = new HashMap<>();
		if(member != null) {
			// 비승인 상태면 에러메세지 보내기
			if(member.getMemberState() == 1) {
				error = "비승인 계정입니다. 담당자한테 문의해주세요";
			} else if(member.getMemberState() == 2) {
				loginMapper.updateLogDate(memberId);
				returnMap.put("member", member);
			}
		} else if(member == null){
			error = "아이디와 비밀번호를 확인해주세요";
		}
		returnMap.put("error", error);
		log.debug(CF.SWB+"[LoginService selectMemberId error]"+ error+CF.RESET);	
		
		return returnMap;
	}
}