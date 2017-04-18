package com.spring.triplan;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public String idFind(HashMap<String, String> map) {    // 아이디찾기

		return sql.selectOne("triplandb.idFind", map);
		
	}
	
	public int pwFind(HashMap<String, String> map) {     // 비밀번호 찾기
		// TODO Auto-generated method stub
		return sql.selectOne("triplandb.pwFind", map);
	}

	public Object pwChange(HashMap<String, String> map) {  // 비밀번호 변경
		// TODO Auto-generated method stub
		return sql.update("triplandb.pwChange", map);
	}
	

	public void meminsert(MemberVO vo) {          // 회원가입
		sql.insert("triplandb.meminsert", vo);
		sql.insert("triplandb.stsmsg_insert", vo);
	}

	public int loginchk(HashMap<String, String> map) {    // 로그인	
		return sql.selectOne("triplandb.loginchk", map);	
	}
	

	public MemberVO getmemberInfo(String id) {            // 회원정보호출	
		return sql.selectOne("triplandb.getmemberInfo",id);
	}

	public int idcheck(String userid) {     // 아이디 중복확인
		
		return sql.selectOne("triplandb.idcheck",userid);
	}
	
	
	public void meminfochg(HashMap<String, String> map) {  // 회원정보수정
		
		sql.update("triplandb.meminfochg", map);
	}

	public void updatemember(HashMap<String,String> map) {
		sql.selectList("triplandb.updatemember", map);
		
	}
	
	
	public List<MemberVO> adminme(HashMap<String, String> map) {   // 회원검색
		// TODO Auto-generated method stub
		return sql.selectList("triplandb.adminme", map);
	}
	
	public int totalMember() {
		return sql.selectOne("triplandb.totalMember");
	}
	
}
