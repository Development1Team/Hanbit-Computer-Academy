package Hanbit.co.kr.lms.vo;

import lombok.Data;

@Data
public class Member {
	private String memberId; // 아이디
	private int memberLevel; // 레벨- 3=관리자, 2=강사, 1=학생
	private int memberState; // 상태- 0=비휴먼, 1=활성화. 2=탈퇴
	private String logDate; // 접속날짜
	private String createDate; // 생성날짜
	private String updatedate; // 업데이트날짜
}
