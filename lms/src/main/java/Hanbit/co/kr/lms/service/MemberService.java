package Hanbit.co.kr.lms.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RestController;

import Hanbit.co.kr.lms.mapper.MemberMapper;
import Hanbit.co.kr.lms.util.CF;
import Hanbit.co.kr.lms.vo.AddMember;
import Hanbit.co.kr.lms.vo.Manager;
import Hanbit.co.kr.lms.vo.Member;
import Hanbit.co.kr.lms.vo.PasswordUpdateDate;
import Hanbit.co.kr.lms.vo.Student;
import Hanbit.co.kr.lms.vo.Teacher;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Transactional
@Service
public class MemberService {
	@Autowired
	MemberMapper memberMapper;
	
	private Member m;
	private PasswordUpdateDate PUD;
	private Student st;
	private Teacher tch;
	private Manager mng;
	
	//ID유효성 
	public List<Member> getMember() {								
		
		List<Member> memberList = memberMapper.selectMember();
		log.debug(CF.LKL+"MemberService.getMember :"+ CF.RESET +memberList);
		return memberList;
	}
	//학생회원가입
	public int addStudent(AddMember aM) {
		//
		log.debug(CF.LKL+"memberMapper.addStudent.aM : " + CF.RESET+ aM );
		
		//member vo로 데이터 가공
		m= new Member();
		m.setMemberId(aM.getId());
		m.setMemberLevel(aM.getLevel());
//		m.setMemberState(0);	
		st = new Student();
		st.setStudentId(aM.getId());
		st.setStudentPw(aM.getPw());
		st.setStudentName(aM.getName());
		st.setStudentAddr1(aM.getAddr1());
		st.setStudentAddr2(aM.getAddr2());
		st.setStudentBirth(aM.getPid1());
		st.setStudentEmail(aM.getEmail());
		st.setStudentPhone(aM.getPhone());
		if(aM.getPid2()==1 ||aM.getPid2()==3) {
			st.setStudentGender("남자");
		} else {
			st.setStudentGender("여자");
		}
		st.setFinalEducation(aM.getFinalEdu());
		
		//PUD vo로 데이터 가공
		PUD = new PasswordUpdateDate();
		PUD.setMemberId(aM.getId());
		PUD.setMemberPw(aM.getPw());
		
		//addMember -> member,student,PUD 가공 디버깅
		log.debug(CF.LKL+"memberMapper.addStudent.m : " + CF.RESET+ m );
		log.debug(CF.LKL+"memberMapper.addStudent.st : " + CF.RESET+ st );
		log.debug(CF.LKL+"memberMapper.addStudent.PUD : " + CF.RESET+ PUD );
		
		
		memberMapper.insertMember(m);
		memberMapper.insertDefaultPhoto(m);
		memberMapper.insertPUD(PUD);
		int row=memberMapper.insertStudent(st);
		return row;
	}
	//강사회원가입
	public int addTeacher(AddMember aM) {
		
		log.debug(CF.LKL+"memberMapper.addManager.aM : " + CF.RESET+ aM );
		//member vo로 데이터 가공
		m= new Member();
		m.setMemberId(aM.getId());
		m.setMemberLevel(aM.getLevel());

		
		//PUD vo로 데이터 가공
		PUD = new PasswordUpdateDate();
		PUD.setMemberId(aM.getId());
		PUD.setMemberPw(aM.getPw());
		
		//Teacher vo로 데이터 가공
		tch = new Teacher();
		tch.setTeacherId(aM.getId());
		tch.setTeacherPw(aM.getPw());
		tch.setTeacherName(aM.getName());
		tch.setTeacherBirth(aM.getPid1());
		tch.setTeacherEmail(aM.getEmail());
		tch.setTeacherPhone(aM.getPhone());
		tch.setTeacherAddr1(aM.getAddr1());
		tch.setTeacherAddr2(aM.getAddr2());
		tch.setFinalEducation(aM.getFinalEdu());
		if(aM.getPid2()==1 ||aM.getPid2()==3) {
			tch.setTeacherGender("남자");
		}else {
			tch.setTeacherGender("여자");
		}
		
		//addMember -> member,teacher,PUD 가공 디버깅
		log.debug(CF.LKL+"memberMapper.addTeacher.m : " + CF.RESET+ m );
		log.debug(CF.LKL+"memberMapper.addTeacher.tch : " + CF.RESET+ tch );
		log.debug(CF.LKL+"memberMapper.addTeacher.PUD : " + CF.RESET+ PUD );
		
		memberMapper.insertMember(m);
		memberMapper.insertDefaultPhoto(m);
		memberMapper.insertPUD(PUD);
		int row=memberMapper.insertTeacher(tch);
		return row;
	}
	//운영자회원가입
	public int addManager(AddMember aM) {
		
		log.debug(CF.LKL+"memberMapper.addManager.aM : " + CF.RESET+ aM );
		
		//member vo로 데이터 가공
		m= new Member();
		m.setMemberId(aM.getId());
		m.setMemberLevel(aM.getLevel());
//		m.setMemberState(0);
		//manager vo로 데이터 가공
		mng= new Manager();
		mng.setManagerId(aM.getId());
		mng.setManagerName(aM.getName());
		mng.setManagerPw(aM.getPw());
		mng.setManagerPhone(aM.getPhone());
		mng.setManagerAddr1(aM.getAddr1());
		mng.setManagerAddr2(aM.getAddr2());
		mng.setManagerBirth(aM.getPid1());		// 나이 인가? 주번인가?
		mng.setManagerEmail(aM.getEmail());
		if(aM.getPid2()==1 ||aM.getPid2()==3) {
			mng.setManagerGender("남자");
		}else {
			mng.setManagerGender("여자");
		}
		//PUD vo로 데이터 가공
		PUD = new PasswordUpdateDate();
		PUD.setMemberId(aM.getId());
		PUD.setMemberPw(aM.getPw());
		
		//addMember -> member,manager,PUD 가공 디버깅
		log.debug(CF.LKL+"memberMapper.addManager.m : " + CF.RESET+ m );
		log.debug(CF.LKL+"memberMapper.addManager.mng : " + CF.RESET+ mng );
		log.debug(CF.LKL+"memberMapper.addManager.PUD : " + CF.RESET+ PUD );
		
		memberMapper.insertMember(m);
		memberMapper.insertDefaultPhoto(m);
		memberMapper.insertPUD(PUD);
		
		int row=memberMapper.insertManager(mng);
		
		return row;
	}
	
	//member 비승인 리스트 출력
	public List<Map<String,Object>> authorizeMember() {

		List<Map<String,Object>> waitingList = memberMapper.selectMemberListByState();
		
		return waitingList;
	}
	//운영자 - Member상태 승인
	public void approveMember(String memberId) {
		
		 memberMapper.approveMember(memberId);

	}
	public int sleepMember() {
		
		int row = memberMapper.inactivityMember();
		
		return row;
	}
	
	public int awakeStudent(PasswordUpdateDate passwordUpdateDate) {
		
		log.debug(CF.LKL+"MemberService.awakeStudent.passwordUpdateDate" + CF.RESET + passwordUpdateDate );
		
		memberMapper.updateActivePasswordUpdateDate(passwordUpdateDate);
		memberMapper.updageActiveMember(passwordUpdateDate);
		int row =memberMapper.updateActiveStudent(passwordUpdateDate);
		
		return row;
		
	}
	public int awakeTeacher(PasswordUpdateDate passwordUpdateDate) {
		
		log.debug(CF.LKL+"MemberService.awakeTeacher.passwordUpdateDate" + CF.RESET + passwordUpdateDate );
		
		memberMapper.updateActivePasswordUpdateDate(passwordUpdateDate);
		memberMapper.updageActiveMember(passwordUpdateDate);
		int row =memberMapper.updateActiveTeacher(passwordUpdateDate);
		
		return row;
		
	}
	public int awakeManager(PasswordUpdateDate passwordUpdateDate) {
		
		log.debug(CF.LKL+"MemberService.awakeManager.passwordUpdateDate" + CF.RESET + passwordUpdateDate );
		
		memberMapper.updateActivePasswordUpdateDate(passwordUpdateDate);
		memberMapper.updageActiveMember(passwordUpdateDate);
		int row =memberMapper.updateActiveManager(passwordUpdateDate);
		
		return row;
		
	}
	
	public int changePwbyactivity(PasswordUpdateDate passwordUpdateDate) {
		
		log.debug(CF.LKL+"MemberService.changePwbyactivity.passwordUpdateDate" + CF.RESET + passwordUpdateDate );
		
		int row= memberMapper.changePwbyactivity(passwordUpdateDate);
		
		return row;
	}
	public int removeMemberCk(String pw) {
			
		int row= memberMapper.deleteMemberCk(pw);
		
		return row;
	}
}
