package com.spring.triplan;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.AdminVO;


@Repository
public class AdminDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public int adminchk(HashMap<String, String> map) {    // 로그인	
		return sql.selectOne("triplandb.adminchk", map);	
	}
	
	public AdminVO goadmin(String id) {
		
		return sql.selectOne("triplandb.goadmin",id);
		
	}
	

	public List<HashMap<String,String>> getTourCommentRank() { //관광지 댓글 순위
		return sql.selectList("triplandb.getTourCommentRank");

	}

	public List<HashMap<String, String>> getRegionRank(HashMap<String, String> theMap) { //관광지 검색 순위 보여주기
		return sql.selectList("triplandb.getRegionRank",theMap);

	}

	public List<HashMap<String, String>> getAdmin_ageStat() { // 연령대, 성별 가져오기 
		return sql.selectList("triplandb.getAdmin_ageStat");

	}

	public List<HashMap<String, String>> admin_regionRankDaily() {//오늘꺼 지역 검색 순위 가져오기
		return sql.selectList("triplandb.admin_regionRankDaily");

	}

	public List<HashMap<String, String>> admin_regionRankMonthly() {//이번달  지역 검색 순위 가져오기
		return sql.selectList("triplandb.admin_regionRankMonthly");

	}

	// ----------------------------- 별점 ----------------
	public List<HashMap<String, String>> seoulTourRating(HashMap<String, String> map) { //서울 지역 관광지 별점 가져오기
		return sql.selectList("triplandb.seoulTourRating",map);
	}
	public List<HashMap<String, String>> seoulFoodRating(HashMap<String, String> map) { //서울 지역 음식점 별점 가져오기
		return sql.selectList("triplandb.seoulFoodRating",map);
	}

	public List<HashMap<String, String>> seoulHotelRating(HashMap<String, String> map) { //서울 지역 숙박 별점 가져오기
		return sql.selectList("triplandb.seoulHotelRating",map);

	}

	public List<HashMap<String, String>> seoulOtherRating(HashMap<String, String> map) { //서울 지역 체험 별점 가져오기
		return sql.selectList("triplandb.seoulOtherRating",map);

	}

	public List<HashMap<String, String>> getLikeRank() { // 좋아요 순위 가져오기
		return sql.selectList("triplandb.getLikeRank");

	}

	public List<HashMap<String, String>> getviewRankSC() {
		return sql.selectList("triplandb.getviewRankSC");
	}
	
	public List<Integer> siteincnt() {
		
		List<Integer> cntlist = new ArrayList<Integer>();
		
		String cnt=null;
		
		for(int i=0; i<6; i++){
			cnt= sql.selectOne("triplandb.siteincnt",i);
			if(cnt==null){
				cntlist.add(0);
			}
			else{
				cntlist.add(Integer.parseInt(cnt));
			}
		}
		
		return cntlist;
	}

	
}
