package com.spring.triplan;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.AreaDetailVO;
import com.spring.model.AreaVO;
import com.spring.model.ScheduleVO;
import com.spring.model.TourInfoVO;

@Repository
public class SearchDAO {
	
	@Autowired
	private SqlSessionTemplate sql;

	public AreaDetailVO searchArea(String de_area_name)
	{
		return sql.selectOne("triplandb.searchArea", de_area_name);
	}

	public List<TourInfoVO> searchTourInfo(HashMap<String, String> map)
	{
		return sql.selectList("triplandb.searchTourInfo", map);
	}

	public ScheduleVO searchSchedule(String de_area_name) {
		// TODO Auto-generated method stub
		return sql.selectOne("triplandb.searchSchedule", de_area_name);
	}

	//16일추가 가현
	public TourInfoVO detailTourInfo(String t_idx)
	{
		return sql.selectOne("triplandb.detailTourInfo", t_idx);
	}
	
	
	public List<TourInfoVO> getTourInfo(HashMap<String, String> map) {
		return sql.selectList("triplandb.tourinfo", map);

	}
	
	public int checkWishList(HashMap<String, String> map) {
		return sql.selectOne("triplandb.checkWishList", map);

	}

	public void insertWL(HashMap<String, String> map) {
		sql.insert("triplandb.insertWL", map);

	}

	public void deleteWL(HashMap<String, String> map) {
		sql.delete("triplandb.deleteWL", map);

	}

	public void insertSearchedWords(HashMap<String, String> map) {
		sql.insert("triplandb.insertSearchedWords", map);
		
	}
	
	public List<AreaVO> getAreaInfo() // 가현 22일 하던거
	{
		return sql.selectList("triplandb.getAreaInfo");
	}

	public List<AreaDetailVO> getDeAreaInfo(String area_code) // 가현 22일 하던거
	{
		return sql.selectList("triplandb.getDeAreaInfo", area_code);
	}

	public AreaDetailVO searchAreaCode(String de_area_code) // 가현 23일
	{
		return sql.selectOne("triplandb.searchAreaCode", de_area_code);
	}

	public List<TourInfoVO> showTourInfo(HashMap<String, String> map) // 가현 24일
	{
		return sql.selectList("triplandb.showTourInfo", map);
	}

	public List<AreaDetailVO> autoAllSearch() // 28일 가현이
	{
		return sql.selectList("triplandb.autoAllSearch");
	}
	
}
