package com.spring.triplan;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.AreaDetailVO;
import com.spring.model.AreaVO;
import com.spring.model.ChatVO;
import com.spring.model.MemberVO;
import com.spring.model.ScheduleVO;
import com.spring.model.TourInfoCommVO;
import com.spring.model.TourInfoTypeVO;
import com.spring.model.TourInfoVO;

@Repository
public class TriplanDAO {

	@Autowired
	private SqlSessionTemplate sql;

	public String getstatusmsg(String userid) {
	return sql.selectOne("triplandb.getstatusmsg",userid);
	}
	
	////////////////////////////////////////
	
	public List<HashMap<String, String>> getfirst(HashMap<String, String> map) {
	return sql.selectList("triplandb.getfirst", map);
}
	
	/* ---------------------------------- 위시리스트 ------------------------------------------ */
	
	public List<HashMap<String, String>> getwishlist(HashMap<String, String> map) {
		return sql.selectList("triplandb.getwishlist", map);
	}
	
	
	public int deletewishlist(HashMap<String, String[]> map) {
		return sql.delete("triplandb.deletewishlist", map);
	}
	
	public List<HashMap<String, String>> getWishRegion(HashMap<String, String> map) {
		return sql.selectList("triplandb.getWishRegion", map);
	}
	
	public List<HashMap<String, String>> getWishRegionSearch(HashMap<String, String> map) {
		return sql.selectList("triplandb.getWishRegionSearch", map);
	}
	
	/* ---------------------------------- 위시리스트 끝 ------------------------------------------ */
	
	/* ---------------------------------- 친구 ------------------------------------------ */
	
	public List<HashMap<String, String>> getFriendsList(HashMap<String, String> map) {
		return sql.selectList("triplandb.getFriendsList", map);
	}
	
	public void delFriend(HashMap<String, String> map) {

		sql.delete("triplandb.delFriend", map);
	}
	
	/*public List<HashMap<String, String>> findFriend(HashMap<String, String> map) {
	return sql.selectList("triplandb.findFriend", map);
	}*/
	
	/* ---------------------------------- 친구 끝 ------------------------------------------ */
	
	/* ---------------------------------- 스케쥴 ------------------------------------------ */
	
	public List<ScheduleVO> getMySchedule(HashMap<String, String> map) {
		return sql.selectList("triplandb.getMySchedule",map);
	}

	/* ---------------------------------- 스케쥴 끝 ------------------------------------------ */
	
	/* ---------------------------------- 관광지 ------------------------------------------ */
	
	public int addTComment(TourInfoCommVO ticvo)
	{
		int result = sql.insert("triplandb.addTComment", ticvo);
		
		return result;
	}


	public void editTCommentCount(String t_idx)
	{
		sql.update("triplandb.editTCommentCount", t_idx);
	}


	/*public List<TourInfoCommVO> ticommentList(String t_idx)
	{
		return sql.selectList("triplandb.ticommentList", t_idx);
	}*/
	
	public List<TourInfoCommVO> ticommentList(String t_idx,int start, int end)
	{
		

		List<TourInfoCommVO>  list = null;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		map.put("t_idx", t_idx);
	
		list = sql.selectList("triplandb.ticommentList",map);
		
		return  list ; 
	}

	public void insertRating(HashMap<String, String> map) {
		sql.insert("triplandb.insertRating", map);
		
	}
	
	public void updateRating(String t_idx)
	{
		sql.update("triplandb.updateRating", t_idx);
	}

	public int findRating(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sql.selectOne("triplandb.findRating", map);
	}
	
	public int updateStatus(HashMap<String, String> map) {
		return sql.update("triplandb.updateStatus",map);
	}



	public int delWish(HashMap<String, String> map) {
		return sql.delete("triplandb.delWish",map);
	}

	public int deleteWishList(HashMap<String, String[]> map) {
		return sql.delete("triplandb.deleteWishList",map);

	}



	public int updatewl(HashMap<String, String> map) {
		return sql.update("triplandb.updatewl",map);

	}



	public int selectwl(HashMap<String, String> map) {
		return sql.selectOne("triplandb.selectwl",map);

	}



	public int getTotalCount(String t_idx) {
		return sql.selectOne("triplandb.getTotalCount",t_idx);

	}
	
	/* ---------------------------------- 관광지 끝 ------------------------------------------ */
	
	/* ---------------------------------- 채팅 시작 ------------------------------------------ */
	
	public List<ChatVO> getChat(String roomNo) // 가현 추가 21일 -chat
	{
		return sql.selectList("triplandb.getChat", roomNo);
	}

	public List<ChatVO> getMyChat(HashMap<String, String> map) // 가현 추가 21일 -chat
	{
		return sql.selectList("triplandb.getMyChat", map);
	}
	
	/* ---------------------------------- 채팅 끝 ------------------------------------------ */
	
	public List<MemberVO> getfriendList(String userid) {
		
		return sql.selectList("triplandb.getfriendList",userid);
	}

	public List<MemberVO> myfriendfind(HashMap<String, String> map) {
		
		return sql.selectList("triplandb.myfriendfind",map);
	}

	public List<MemberVO> getmemberList(String curuserid) {
		
		return sql.selectList("triplandb.getmemberList",curuserid);
	}

	public List<MemberVO> memberfind(HashMap<String, String> map) {
		
		return sql.selectList("triplandb.memberfind",map);
	}

	public void friendAdd(HashMap<String, String> map) {
		sql.insert("triplandb.friendAdd",map);
	}
	
	public void friendAdd2(HashMap<String, String> map) {
		sql.insert("triplandb.friendAdd2",map);	
	}
	
	public void friendreq(HashMap<String, String> map) {
		sql.insert("triplandb.friendreq",map);
	}

	public List<HashMap<String, String>> yesorno(String curuserid) {
		
		return sql.selectList("triplandb.yesorno",curuserid);
	}

	public void friendOk(HashMap<String, String> map) {
		sql.update("triplandb.friendOk",map);
		
	}

	public void friendreqdel(HashMap<String, String> map) {
		sql.delete("triplandb.friendreqdel",map);
		
	}

	public List<HashMap<String, String>> realtimeSearch() {
		
		return sql.selectList("triplandb.realtimeSearch");
	}
	
	public List<TourInfoVO> admintr(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sql.selectList("triplandb.admintr",map);
	}
	
	public void deltour(HashMap<String, String> map) {
		
		sql.delete("triplandb.deltour", map);
	}

	public void addtour(TourInfoVO vo) {

		sql.insert("triplandb.addtour", vo);
	}

	public int trinst(HashMap<String, String> map) {
		
		sql.insert("triplandb.trinst", map);
		return sql.selectOne("triplandb.getTrinstIdx");
	}

	public void adminedittr(HashMap<String, String> map) {
		
		sql.update("triplandb.adminedittr", map);		
	}


	public TourInfoVO tourinfo(String t_idx) {	//	관광지 정보 호출
		return sql.selectOne("triplandb.tourinfo",t_idx);
	}

	public List<AreaVO> tacode() {
		// 다중행(List)가져오기
		// DB의 컬럼명과 VO 자바빈의 프로파티명이 다른경우
		return sql.selectList("triplandb.tacode");
	}

	public List<AreaDetailVO> tdacode(String area_code) {
		// TODO Auto-generated method stub
		return sql.selectList("triplandb.tdacode",area_code);
	}
	
	
	public void inchecked() {

		String ck = sql.selectOne("triplandb.ck_today");
		
		if(ck == null)
		{
			sql.insert("triplandb.kyu_insertvcount");
		}
		else
		{
			sql.update("triplandb.kyu_updatevcount");
		}
		
		
	}
	
	
	public int addSchedule(HashMap<String, String> sc_map)
	{
		sql.insert("triplandb.addSchedule", sc_map);
		sql.insert("triplandb.addScheduleJoin",sc_map);
		return sql.selectOne("triplandb.getNewScheduleIdx");
	}

////////////////////////////////0702 동규 //////////////////////////////////

	public List<HashMap<String, String>> getMainSchedule(HashMap<String, String> map) {
		return sql.selectList("triplandb.getMainSchedule",map);
	}
////////////////////////////////0702 동규 //////////////////////////////////


	public List<HashMap<String,String>> getSearchSchedule(HashMap<String, String> map) {
		return sql.selectList("triplandb.getSearchSchedule",map);
	}

	public void sendMsg(HashMap<String, String> map) {
		sql.insert("triplandb.sendMsg", map);
		
	}
	
	
	public List<TourInfoVO> tlist(String column, String search, int start, int end) {
		
		List<TourInfoVO> list = null;
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("start", String.valueOf(start));
		map.put("end", String.valueOf(end));
		
		if(column != null && search != null) {
			map.put("column", column);
			map.put("search",search);
			
			list = sql.selectList("triplandb.tsearch", map);
		}
		else {
			list = sql.selectList("triplandb.tlist", map);
		}
		 
		return list;
	}


	//	총 관광지수
	public int getTotalCountTour() {
		int totalCount = sql.selectOne("triplandb.getTotalCountTour");
		return totalCount;
	}
	
	//	관광지 검색
	public int getSearchCountTour(HashMap<String, String> map) {
		int total = sql.selectOne("triplandb.getSearchCountTour", map); 
		return total;
	}
	
	
	
	
	
	
	
	public TourInfoVO gettourcnginfo(String t_idx) {
		
		return sql.selectOne("triplandb.gettourcnginfo",t_idx);
	}

	
	public AreaDetailVO areadetail(String t_idx) {
		return sql.selectOne("triplandb.areadetail",t_idx);
	}

	
	
	public List<AreaDetailVO> getadinfo() {
		// TODO Auto-generated method stub
		return sql.selectList("triplandb.getadinfo");
	}
	
	public List<TourInfoTypeVO> getType() // 가현 29일 추가
	{
		return sql.selectList("triplandb.getType");
	}

	public boolean updateTourInfo(TourInfoVO tivo)
	{
		sql.update("triplandb.updateTourInfo",tivo);	
		return true;
	}

	public int ck_schedule(HashMap<String, String> map) {
		return sql.selectOne("triplandb.ck_schedule", map);
	}
	
	// 0629<동규>/////////////////////////////////
	
	public List<HashMap<String, String>> getLiked(HashMap<String, String> id) {
		
		return sql.selectList("triplandb.getLiked",id);
	}

	public void addviewCnt(String sc_idx) {
		sql.update("triplandb.addviewCnt",sc_idx);
	}

	public void deletelike(HashMap<String, String> id) {
		
		sql.update("triplandb.subtractlike",id);
		
		sql.delete("triplandb.deletelike",id);
		
	}

	public List<MemberVO> getreqmemlist(String curuserid) {
		
		return sql.selectList("triplandb.getreqmemlist",curuserid);
	}


	public void memberEditinfo(HashMap<String, String> map) {
		
		sql.update("triplandb.memberEditinfo",map);
	}

	public List<MemberVO> reqmemberfind(HashMap<String, String> map) {
		
		return sql.selectList("triplandb.reqmemberfind",map);
	}

	
	//////////////////////////////////////////////
	
	public List<ScheduleVO> getMySearchedSchedule(HashMap<String, String> map) {
		return sql.selectList("triplandb.getMySearchedSchedule",map);

	}
	
	public List<HashMap<String, String>> getSearchedLiked(HashMap<String, String> map) {
		return sql.selectList("triplandb.getSearchedLiked",map);

	}
	
////////////////////////////////////0702 동규 ///////////////////////////////////////////////////	/
	
	public MemberVO getmemberInfo(String userid) {
	
	return sql.selectOne("triplandb.getmemberInfo",userid);
	}
	
	public int deletelikechk(HashMap<String, String> id) {
	
	return sql.selectOne("triplandb.deletelikechk",id);
	}
	
	public void addlikedList(HashMap<String, String> map) {
	
	sql.insert("triplandb.addlikedList",map);
	}
	
	public void addlikecnt(HashMap<String, String> map) {
	
	sql.update("triplandb.addlikecnt",map);
	}
	
	public String addlikechk(HashMap<String, String> map) {
	
	return sql.selectOne("triplandb.addlikechk",map);
	}
	
	public List<HashMap<String, String>> k_getMainSchedule(HashMap<String, String> map) {
		
		return sql.selectList("triplandb.k_getMainSchedule",map);
	}
	

	public List<TourInfoVO> getReadScheduleTour(HashMap<String, String[]> map) {
		return sql.selectList("triplandb.getReadScheduleTour",map);
	}
	
	public List<HashMap<String, String>> getReadScheduleWish(HashMap<String, String> map) {
		return sql.selectList("triplandb.getReadScheduleWish", map);
	}

	/*paige*/
	public List<HashMap<String, String>> friendlistPaige(HashMap<String, String> map) {
		return sql.selectList("triplandb.friendlistPaige",map);
	}

	/*paige*/
	public int addInvite(HashMap<String, String> map) {
		return sql.insert("triplandb.addInvite",map);
	}

	/*paige*/
	public List<HashMap<String, String>> getRequestedInvite(HashMap<String, String> map) {
		return sql.selectList("triplandb.getRequestedInvite",map);
	}

	/*paige*/
	public int acceptRequest(HashMap<String, String> map) {
		return sql.delete("triplandb.acceptRequest",map);

	}

	/*paige*/
	public void insertjoin(HashMap<String, String> map) {
		sql.insert("triplandb.insertjoin",map);
		
	}

	/*paige*/
	public int checkinvite(HashMap<String, String> map) {
		return sql.selectOne("triplandb.checkinvite",map);
	}

	/*paige*/
	public int checkjoin(HashMap<String, String> map) {
		return sql.selectOne("triplandb.checkjoin",map);
	}
	
}
