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
import com.spring.model.TourInfoTypeVO;
import com.spring.model.TourInfoVO;

@Service
public class TriplanService {

	@Autowired
	private TriplanDAO Tdao;
	
	@Autowired
	private SearchDAO Sdao;
	
	@Autowired
	private AdminDAO Adao;
	
	public AreaDetailVO searchArea(String de_area_name)   // 지역검색
	{
		return Sdao.searchArea(de_area_name);
	}

	public List<TourInfoVO> searchTourInfo(HashMap<String, String> map)  // 지역정보
	{
		return Sdao.searchTourInfo(map);
	}
	
	public int adminchk(HashMap<String, String> map) {  // 관리자로그인
		return Adao.adminchk(map);
	}
	
	public String getstatusmsg(String userid) {	//상태메시지 가져오기
		return Tdao.getstatusmsg(userid);
	}
	
	public List<HashMap<String, String>> getwishlist(HashMap<String, String> map) { // 위시리스트 가져오기(검색포함)
		return Tdao.getwishlist(map);
	}
	
	
	public int deletewishlist(HashMap<String, String[]> map) {	// 위시리스트 지우기
		return Tdao.deletewishlist(map);
	}
	
	public List<HashMap<String, String>> getFriendsList(HashMap<String, String> map) { //친구리스트 가져오기(검색포함_
		return Tdao.getFriendsList(map);
	
	}

	public List<HashMap<String, String>> getWishRegion(HashMap<String, String> map) { // 위시리스트 지역별로 가져오기
		return Tdao.getWishRegion(map);
	}
	
	public List<HashMap<String, String>> getWishRegionSearch(HashMap<String, String> map) {
		return Tdao.getWishRegionSearch(map);

	}
	
	
	///////////////////////
	public List<HashMap<String, String>> getfirst(HashMap<String, String> map) {
		return Tdao.getfirst(map);
	}
	
	public ScheduleVO searchSchedule(String de_area_name) {
		
		return Sdao.searchSchedule(de_area_name);
	}

	public List<ScheduleVO> getMySchedule(HashMap<String, String> map) {
		
		return Tdao.getMySchedule(map);
	}

	
	public AdminVO goadmin(String id) { // 관리자

		return Adao.goadmin(id);
	}
	

	public void delFriend(HashMap<String, String> map) {

		Tdao.delFriend(map);
		
	}
	

	public TourInfoVO detailTourInfo(String t_idx) // 가현 추가 16일
	{
		return Sdao.detailTourInfo(t_idx);
	}

	public int addTComment(TourInfoCommVO ticvo) // 가현 추가 17일
	{
		int result = Tdao.addTComment(ticvo);
		
		return result;
	}

	public void editTCommentCount(String t_idx) // 가현 추가 17일
	{
		Tdao.editTCommentCount(t_idx);
	}

/*	public List<TourInfoCommVO> ticommentList(String t_idx)
	{
		return Tdao.ticommentList(t_idx);
	}*/
	
	public List<TourInfoCommVO> ticommentList(String t_idx,int start, int end)
	{
		return Tdao.ticommentList(t_idx,start,end);
	}

	public void insertRating(HashMap<String, String> map)
	{
		Tdao.insertRating(map);
	}
	
	public void updateRating(String t_idx)
	{
		Tdao.updateRating(t_idx);
	}

	public int findRating(HashMap<String, String> map) {
		return Tdao.findRating(map);
	}
	
	public List<ChatVO> getChat(String roomNo) // 가현 추가 21일
	{
		return Tdao.getChat(roomNo);
	}

	public List<ChatVO> getMyChat(HashMap<String, String> map) // 가현 추가 21일
	{
		return Tdao.getMyChat(map);
	}
	
	public List<MemberVO> getfriendList(String userid) {
		List<MemberVO> list = Tdao.getfriendList(userid);
		return list;
	}

	public List<MemberVO> myfriendfind(HashMap<String, String> map) {
		List<MemberVO> list = Tdao.myfriendfind(map);
		return list;
	}

	public List<MemberVO> getmemberList(String curuserid) {

		List<MemberVO> memberList = Tdao.getmemberList(curuserid);
		return memberList;
	}

	public List<MemberVO> memberfind(HashMap<String, String> map) {
		
		List<MemberVO> member = Tdao.memberfind(map);
		return member;
	}

	public void friendAdd(HashMap<String, String> map) {
		Tdao.friendAdd(map);
	}
	
	public void friendAdd2(HashMap<String, String> map) {
		Tdao.friendAdd2(map);	
	}

	public void friendreq(HashMap<String, String> map) {
		Tdao.friendreq(map);
		
	}

	public List<HashMap<String, String>> yesorno(String curuserid) {
		
		return Tdao.yesorno(curuserid);
	}

	public void friendOk(HashMap<String, String> map) {
		Tdao.friendOk(map);
		
	}

	public void friendreqdel(HashMap<String, String> map) {
		Tdao.friendreqdel(map);
		
	}

	public List<HashMap<String, String>> realtimeSearch() {
		
		List<HashMap<String, String>> list = Tdao.realtimeSearch();
		return list;
	}

	public List<TourInfoVO> admintr(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return Tdao.admintr(map);
	}
	public void deltour(HashMap<String, String> map) {

		Tdao.deltour(map);
	}
	
	public int updateStatus(HashMap<String, String> map) {
		return Tdao.updateStatus(map);
	}

	public int delWish(HashMap<String, String> map) {
		return Tdao.delWish(map);

	}

	public int deleteWishList(HashMap<String, String[]> map) {
		return Tdao.deleteWishList(map);
	}


	
	public int getTotalCount(String t_idx) {
		return Tdao.getTotalCount(t_idx);
	}

	public List<TourInfoVO> getTourInfo(HashMap<String, String> map) {
		return Sdao.getTourInfo(map);
	}

	
	
	
	public void add(StatusmsgVO vo) {
		// TODO Auto-generated method stub
		
	}

	public void add_withFile(StatusmsgVO vo) {
		// TODO Auto-generated method stub
		
	}

	public int checkWishList(HashMap<String, String> map) { //위시리스트에 추가 되어있는지 없는지 확인한다.
		return Sdao.checkWishList(map);

	}

	public void insertWL(HashMap<String, String> map) { //관광지 상세정보에서 위시리스트 추가하기
		Sdao.insertWL(map);

		
	}

	public void deleteWL(HashMap<String, String> map) { //관광지 상세정보에서 위시리스트 지우기
		Sdao.deleteWL(map);
		
	}

	public void insertSearchedWords(HashMap<String, String> map) { //검색한거 다 넣어버리는 테이블 만들기
		Sdao.insertSearchedWords(map);
	
	}
	

	public List<AreaVO> getAreaInfo() // 가현 22일 하던거
	{
		return Sdao.getAreaInfo();
	}

	public List<AreaDetailVO> getDeAreaInfo(String area_code) // 가현 22일 하던거
	{
		return Sdao.getDeAreaInfo(area_code);
	}

	public int addSchedule(HashMap<String, String> sc_map) // 가현 23일
	{
		return Tdao.addSchedule(sc_map);
	}

	public AreaDetailVO searchAreaCode(String de_area_code)
	{
		return Sdao.searchAreaCode(de_area_code);
	}

	public List<TourInfoVO> showTourInfo(HashMap<String, String> map) // 가현이 24일
	{
		return Sdao.showTourInfo(map);
	}
	
	public void addtour(TourInfoVO vo) {	//	관광지 추가
		Tdao.addtour(vo);		
	}

	public int trinst(HashMap<String, String> map) {
		return Tdao.trinst(map);
	}
	
	public void adminedittr(HashMap<String, String> map) {		// 관광지 변경
		Tdao.adminedittr(map);
		
	}

	public TourInfoVO tourinfo() {
		// TODO Auto-generated method stub
		return null;
	}

	public TourInfoVO tourinfo(String t_idx) {
		return Tdao.tourinfo(t_idx);
	}

	public List<AreaVO> tacode() {
		List<AreaVO> talist = Tdao.tacode();
		return talist;
	}

	public List<AreaDetailVO> tdacode(String area_code) {
		// TODO Auto-generated method stub
		return Tdao.tdacode(area_code);
	}




/*
	public TourInfoVO tourinfo(String t_idx) {
		return Tdao.tourinfo(t_idx);

	}*/

	public void inchecked() {
		Tdao.inchecked();
		
	}
	

	public List<HashMap<String,String>> getTourCommentRank() { // 관광지 댓글 순위 보여주기
		return Adao.getTourCommentRank();
	}

	public List<HashMap<String, String>> getRegionRank(HashMap<String, String> theMap) { // 관광지 검색 순위 보여주기
		return Adao.getRegionRank(theMap);

	}

	public List<HashMap<String, String>> getAdmin_ageStat() { // 연령대, 성별 가져오기 
		return Adao.getAdmin_ageStat();

	}

	public List<HashMap<String, String>> admin_regionRankDaily() { //오늘꺼 지역 검색 순위 가져오기
		return Adao.admin_regionRankDaily();

	}

	public List<HashMap<String, String>> admin_regionRankMonthly() {//달별 지역 검색 순위 가져오기
		return Adao.admin_regionRankMonthly();

	}

////////////////////////////////0702 동규 //////////////////////////////////

public List<HashMap<String, String>> getMainSchedule(HashMap<String, String> map) {
return Tdao.getMainSchedule(map);
}
////////////////////////////////0702 동규 //////////////////////////////////


	
	/*public List<HashMap<String, String>> findFriend(HashMap<String, String> map) { //친구 이이디로 검색해서 찾기
		return Tdao.findFriend(map);
	}*/
	
	//------------------------------------------------ 별점 ------ 
	public List<HashMap<String, String>> seoulTourRating(HashMap<String, String> map) { // 서울 지역 관광지 별점 보여주기 
		return Adao.seoulTourRating(map);
	}

	public List<HashMap<String, String>> seoulFoodRating(HashMap<String, String> map) { // 서울 지역 음식점 별점 보여주기 
		return Adao.seoulFoodRating(map);
	}

	public List<HashMap<String, String>> seoulHotelRating(HashMap<String, String> map) { // 서울 지역 숙박  별점 보여주기 
		return Adao.seoulHotelRating(map);
	}

	public List<HashMap<String, String>> seoulOtherRating(HashMap<String, String> map) { // 서울 지역 체험  별점 보여주기 
		return Adao.seoulOtherRating(map);

	}

	public List<HashMap<String, String>> getLikeRank() { //좋아요 순위 가져오기
		return Adao.getLikeRank();

	}

	public List<Integer> siteincnt() {
		
		return Adao.siteincnt();
	}
	
	public List<HashMap<String, String>> getviewRankSC() { //스케쥴 조회수 가져오기
		return Adao.getviewRankSC();
	}

	public List<HashMap<String,String>> getSearchSchedule(HashMap<String, String> map) {
		return Tdao.getSearchSchedule(map);
	}
	

	public List<AreaDetailVO> autoAllSearch() // 28일 가현이
	{
		return Sdao.autoAllSearch();
	}

	public void sendMsg(HashMap<String, String> map) {
		Tdao.sendMsg(map);
		
	}

	public List<TourInfoVO> tlist(String column, String search, int start, int end) {
		return Tdao.tlist(column,search,start,end);
	}

	public int getTotalCountTour() {
		return Tdao.getTotalCountTour();
	}

	public int getSearchCountTour(HashMap<String, String> map) {

		return Tdao.getSearchCountTour(map);
	}
		
	public List<AreaDetailVO> getadinfo() {
		// TODO Auto-generated method stub
		return Tdao.getadinfo();
	}
	
	public List<TourInfoTypeVO> getType() // 가현 29일 추가
	{
		return Tdao.getType();
	}

	public boolean updateTourInfo(TourInfoVO tivo)
	{
		return Tdao.updateTourInfo(tivo);
	}

	public int ck_schedule(HashMap<String, String> map) {
		return Tdao.ck_schedule(map);
	}

	
	// 0629<동규> //////////////////////////////////////////////////////
	public List<HashMap<String, String>> getLiked(HashMap<String, String> id) {
		
		return Tdao.getLiked(id);
	}

	public void addviewCnt(String sc_idx) {
		Tdao.addviewCnt(sc_idx);
	}

	public void deletelike(HashMap<String, String> id) {
		
		Tdao.deletelike(id);
	}

	public List<MemberVO> getreqmemlist(String curuserid) {
		
		return Tdao.getreqmemlist(curuserid);
	}

	

	public void memberEditinfo(HashMap<String, String> map) {
		
		Tdao.memberEditinfo(map);
	}

	public List<MemberVO> reqmemberfind(HashMap<String, String> map) {
		
		return Tdao.reqmemberfind(map);
	}

////////////////////////////////////////////////////////////////////////////
	
	// 스케줄 검색하기
			public List<ScheduleVO> getMySearchedSchedule(HashMap<String, String> map) {
				return Tdao.getMySearchedSchedule(map);
			}
			
	// 좋아요 검색
	public List<HashMap<String, String>> getSearchedLiked(HashMap<String, String> map) {
		return Tdao.getSearchedLiked(map);

	}
	//////////////////////////////////// 0702 동규 ///////////////////////////////////////////////////	/	
	
	public MemberVO getmemberInfo(String userid) {
		
		return Tdao.getmemberInfo(userid);
	}

	public int deletelikechk(HashMap<String, String> id) {
		
		return Tdao.deletelikechk(id);
	}

	public void addlikedList(HashMap<String, String> map) {
		Tdao.addlikedList(map);
	}

	public void addlikecnt(HashMap<String, String> map) {
		
		Tdao.addlikecnt(map);
	}

	public String addlikechk(HashMap<String, String> map) {
		
		return Tdao.addlikechk(map);
	}

	public List<HashMap<String, String>> k_getMainSchedule(HashMap<String, String> map) {
		
		return Tdao.k_getMainSchedule(map);
	}

	public List<TourInfoVO> getReadScheduleTour(HashMap<String, String[]> map) {
		return Tdao.getReadScheduleTour(map);
	}
		
	public List<HashMap<String, String>> getReadScheduleWish(HashMap<String, String> map) { // 위시리스트 지역별로 가져오기
		return Tdao.getReadScheduleWish(map);
	}

	/*paige*/
	public List<HashMap<String, String>> friendlistPaige(HashMap<String, String> map) {
		return Tdao.friendlistPaige(map);
		
	}

	/*paige*/
	public int addInvite(HashMap<String, String> map) {
		return Tdao.addInvite(map);
	}

	/*paige*/
	public List<HashMap<String, String>> getRequestedInvite(HashMap<String, String> map) {
		return Tdao.getRequestedInvite(map);
	}

	/*paige*/
	public int acceptRequest(HashMap<String, String> map) {
		return Tdao.acceptRequest(map);
	}

	/*paige*/
	public void insertjoin(HashMap<String, String> map) {
		Tdao.insertjoin(map);
		
	}

	/*paige*/
	public int checkinvite(HashMap<String, String> map) {
		return Tdao.checkinvite(map);
	}

	/*paige*/
	public int checkjoin(HashMap<String, String> map) {
		return Tdao.checkjoin(map);

	}
	

}
