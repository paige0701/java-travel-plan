package com.spring.triplan;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.model.AdminVO;
import com.spring.model.AreaDetailVO;
import com.spring.model.AreaVO;
import com.spring.model.ChatVO;
import com.spring.model.MemberVO;
import com.spring.model.ScheduleVO;
import com.spring.model.StatusmsgVO;
import com.spring.model.TourInfoCommVO;
import com.spring.model.TourInfoVO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO Mdao;

	public String idFind(HashMap<String,String> map) {   // 아이디찾기

		return Mdao.idFind(map);
		
	}
	
	public int pwFind(HashMap<String, String> map) {   // 비밀번호찾기
		// TODO Auto-generated method stub
		return Mdao.pwFind(map);
	}
	
	public Object pwChange(HashMap<String, String> map) {  // 비밀번호 변경
		// TODO Auto-generated method stub
		return Mdao.pwChange(map);
	}
	
	public void meminsert(MemberVO vo) {    // 회원가입
		Mdao.meminsert(vo);
		
	}

	public int loginchk(HashMap<String, String> map) {  // 로그인
		return Mdao.loginchk(map);
	}
	
	public MemberVO getmemberInfo(String id) {   // 회원정보호출
		return Mdao.getmemberInfo(id);
	}

	public int idcheck(String userid) {   // id 중복확인
		return Mdao.idcheck(userid);
	}
	
	public void meminfochg(HashMap<String, String> map) {
		Mdao.meminfochg(map);
		
	}
	
	public void updatemember(HashMap<String,String> map) {
		Mdao.updatemember(map);
	}

	public List<MemberVO> adminme(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return Mdao.adminme(map);
	}
	
	public int totalMember() {
		return Mdao.totalMember();
	}
}
