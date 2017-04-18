package com.spring.triplan;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.common.FileManager;
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

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

@Controller
public class TriplanController {
	
	@Autowired
	private TriplanService service;
	
	@Autowired
	FileManager fileManager;
	
	@RequestMapping(value = "/main.tp", method = RequestMethod.GET)          // 메인화면
	public String maintp(HttpServletRequest req, HttpServletResponse res) {

/*		String user = req.getSession().getServletContext().getRealPath("/User");
		String tourinfo = req.getSession().getServletContext().getRealPath("/TourInfo/images");
		String schedule = req.getSession().getServletContext().getRealPath("/Schedule");
		
		File userdir = new File(user);
		File tourinfodir = new File(tourinfo);
		File scheduledir = new File(schedule);
		
		if(!(userdir.exists()))
		{
			userdir.mkdir();
			tourinfodir.mkdirs();
			scheduledir.mkdir();
		}*/
		
		//////////////////////// 여기 ///////////////////////////////////
		 
		Cookie cookie=null;
		String cookie_key ="";
		
		boolean flag = false;
		
		Date now = new Date();							
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");		// 15:01:10
		String today = sdf.format(now);
		
		String t1 = today.substring(0,2);
		String t2 = today.substring(3,5);
		String t3 = today.substring(6);
		
		int su1=Integer.parseInt(t1)*60*60;
		int su2=Integer.parseInt(t2)*60; 
		int su3=Integer.parseInt(t3);						
																				
		int totalsec = su1+su2+su3;
		
		
		Cookie cookieArr[] = req.getCookies();		// 모든 쿠키 가져오기
		
			if(cookieArr != null){		//
			
				for( Cookie cobj :cookieArr )
				{
					cookie_key = cobj.getName();	// 쿠키의 키값을 알아오는 것!(쿠키의 이름)
				
					if(cookie_key.equals("visitchk"))		
					{
						flag=true;
						
						break;
					}				
				}// end of for loop
				
				if(!flag)
				{
					service.inchecked(); 
				
					cookie = new Cookie("visitchk", "on");
					
					cookie.setMaxAge(86400-(totalsec-1));	// 당일까지만 정보를 가지고 있을거다(파라미터는 초단위)
									 
					cookie.setPath("/");
					
					res.addCookie(cookie);
				}
			}
			else{
				service.inchecked();
				
				cookie = new Cookie("visitchk", "on");
				
				cookie.setMaxAge(86400-(totalsec-1));		// 하루동안 정보를 가지고 있을거다(파라미터는 초단위)
								 
				cookie.setPath("/");
				
				res.addCookie(cookie);
			}
		///////////////////////////////////////////////////////////
	
		return "main";
	}
	
	///////////////////////////////////////// 여기 ///////////////////////////////////////////////////////////////
	@RequestMapping(value = "/reset.tp", method = RequestMethod.GET)	// 쿠키 삭제를 위한 코드(실행 확인 위해)
	public void reset(HttpServletRequest req, HttpServletResponse res) {
		
		Cookie cookieArr[] = req.getCookies();
		String cookie_key=null;
		Cookie cookie=null;
		 
		for( Cookie cobj :cookieArr )
		{
			cookie_key = cobj.getName();	// 쿠키의 키값을 알아오는 것!(쿠키의 이름)
		
			if(cookie_key.equals("tourchk"))		
			{
			//	cookie_value = cobj.getValue();	// 쿠키의 키값에 해당하는 값을 가져오는 것
				cookie = new Cookie("tourchk", "on");
				cookie.setMaxAge(0);		// 하루동안 정보를 가지고 있을거다(파라미터는 초단위)
				 
				cookie.setPath("/");
				
				res.addCookie(cookie);
				break;
			}				
		}
	}
////////////////////////////////////////////////////////////////////////////////////////////////////////		
	
	
	@RequestMapping(value = "/searchSchedule.tp", method = RequestMethod.GET)
	public String searchSchedule(HttpServletRequest req) {
		
		
		String sc_tag = req.getParameter("sc_tag");
		    
		if(sc_tag == "#") {		
			
			ScheduleVO scvo = service.searchSchedule("sc_tag");
			
		}
		return "search/searchSchedule";
		
	
	}
	
	/* ----------------------------------------  가현  ---------------------------------------------- */
	
	@RequestMapping(value = "/schedule.tp", method={RequestMethod.GET, RequestMethod.POST})
	public String schedule(HttpServletRequest req, HttpServletResponse res, HttpSession ses)
	{
		
	   	MemberVO mem = (MemberVO) ses.getAttribute("member");
	   	
		if(mem == null)
		{
			req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			req.setAttribute("loc", "/triplan/main.tp");
			
			return "msg";
		}
		
		String userid = mem.getUserid();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		String sc_name = req.getParameter("sc_name");
		String sc_start_date = req.getParameter("sc_start_date");
		String sc_end_date = req.getParameter("sc_end_date");
		
		String[] de_area_code = req.getParameterValues("de_area_code");
		if(de_area_code != null)
		{
			AreaDetailVO[] advo = new AreaDetailVO[de_area_code.length];
			
			for(int i = 0; i < de_area_code.length; i++)
			{
				
				if(de_area_code[i] != null)
				{
					advo[i] = service.searchAreaCode(de_area_code[i]);
					map.put("de_area_code" + i, de_area_code[i]);
					req.setAttribute("advo"+i, advo[i]);
				}
			}
		}
		
		HashMap<String, String> sc_map = new HashMap<String, String>();
	
		sc_map.put("sc_name", sc_name);
		sc_map.put("sc_start_date", sc_start_date);
		sc_map.put("sc_end_date", sc_end_date);
		sc_map.put("userid", userid);
		
		int sc_idx = service.addSchedule(sc_map);
		
		String schedule = req.getSession().getServletContext().getRealPath("/Schedule/");
		
		File scheduledir = new File(schedule+sc_idx);
		
		if(!(scheduledir.exists()))
		{
			scheduledir.mkdir();
		}
		
		
		ScheduleExcel sm = new ScheduleExcel();
		
		try {
			
			String[] days = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			
			Calendar start_cal = Calendar.getInstance();
			Calendar end_cal = Calendar.getInstance();
			
			start_cal.setTime(format.parse(sc_start_date));
			end_cal.setTime(format.parse(sc_end_date));
						
			Map<String,Object> save_sc_map = new HashMap<String,Object>();
			List<String> sc_list = new ArrayList<String>();
			
			int sc_days = (int)((end_cal.getTimeInMillis()-start_cal.getTimeInMillis())/(24*60*60*1000))+2;
			String str_sc_days = String.valueOf(sc_days);
			
			for(int i = 0; i<sc_days; i++)
			{
				String day = "";
				if(i > 0)
				{
					day = start_cal.get(Calendar.YEAR)+"-";
					
					if(start_cal.get(Calendar.MONTH)+1 < 10)
						day += "0"+(start_cal.get(Calendar.MONTH)+1)+"-";
					else
						day += (start_cal.get(Calendar.MONTH)+1)+"-";
					
					if(start_cal.get(Calendar.DATE) < 10)
						day += "0"+start_cal.get(Calendar.DATE)+" ";
				    else
				    	day += start_cal.get(Calendar.DATE)+" ";
					
				    day += days[start_cal.get(Calendar.DAY_OF_WEEK)-1];
				    
					start_cal.setTimeInMillis(start_cal.getTimeInMillis()+(24*60*60*1000));
				}
				else
				{
					day = "일정표";
				}
						
				sc_list.add(day);
			}
			
			
			for(int i = 0; i<24; i++)
			{
				for(int j=0; j<sc_days; j++)
				{
					String time = "";
					
					if(j == 0)
					{
						if(i < 10) time += "0";
						time += i+":00";
					}
							
					sc_list.add(time);
				}
			}
			
			save_sc_map.put("sc_idx", sc_idx);
			save_sc_map.put("sc_list", sc_list);
			save_sc_map.put("sc_days", str_sc_days);
			
			sm.write(save_sc_map, req, res);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		File default_title = new File(schedule+"title.jpg");
		
		try {
			
			BufferedImage img_title = ImageIO.read(default_title);
			
			if(scheduledir.exists())
			{
				ImageIO.write(img_title, "jpg", new File(schedule+sc_idx+"/title.jpg"));
			}
			
		} catch (IOException e) {
			System.out.println("이미지 불러오기 실패");
			e.printStackTrace();
		} 
		
		List<TourInfoVO> tourinfoList = service.showTourInfo(map);
		
		req.setAttribute("tourinfoList", tourinfoList);
		req.setAttribute("sc_name", sc_name);
		req.setAttribute("sc_start_date", sc_start_date);
		req.setAttribute("sc_end_date", sc_end_date);
		
		req.setAttribute("sc_idx", sc_idx);
		
		return "schedule/editSchedule";
	}
	
	@RequestMapping(value = "/searchArea.tp", method={RequestMethod.GET, RequestMethod.POST})
    public String searchArea(HttpServletRequest req, HttpSession ses)
    {
      
		 HashMap<String, String> map = new HashMap<String, String>();
			
		 // 로그인 되어있는지 아닌지 확인한다.
		 MemberVO mvo = (MemberVO)ses.getAttribute("member");
		 String userid = null;
		 if(mvo != null)
		 {
		    userid = mvo.getUserid();
		 }
		  
		 String de_area_name = req.getParameter("de_area_name");
		 
			if(de_area_name.charAt(0) == '#') {		
				
				req.setAttribute("searchWord", de_area_name);
				
				return "search/searchSchedule";
				
			}
		 
		 AreaDetailVO advo = service.searchArea(de_area_name);
		  
		 map.put("userid", userid);
		 map.put("area1", de_area_name);
		 map.put("area2", null);
		 map.put("area3", null);
		  
		 List<TourInfoVO> tourinfoList = service.searchTourInfo(map);
		  
		 // 검색한거 다 넣어버리는 메소드 만들기 ! 
		 service.insertSearchedWords(map);
		  
		 req.setAttribute("advo", advo);
		 req.setAttribute("tourinfoList", tourinfoList);
		  
		 return "search/searchArea";

    }
	
	// 검색 자동완성 기능
	@RequestMapping(value = "/autoSearch.tp", method={RequestMethod.GET, RequestMethod.POST})
	public String autoSearch (HttpServletRequest req)
	{
	
		String is_ajax = req.getParameter("is_ajax");
		
		
		if(Integer.parseInt(is_ajax) == 1004)
		{
			
			String de_area_name = req.getParameter("de_area_name");
			
			List<AreaDetailVO> allList = service.autoAllSearch(); // 전체 내용을 불러온다
			
			if(de_area_name != null && !de_area_name.trim().isEmpty()) // 유저가 입력한 검색어가 공백이 아니라면
			{
				List<String> resultList = new ArrayList<String>(); // 결과리스트 생성
				
				for(AreaDetailVO advo : allList) // 모든 전체 내용중에서
				{
					String searchWord = advo.getDe_area_name();
					if(searchWord.contains(de_area_name))
					{
						resultList.add(searchWord);
					}
				}
				
				req.setAttribute("resultList", resultList);
			}
		}
		
		return "search/autoSearch";
	}
	
	// 검색했을때 관광지 정보 다 보여주기 ! AJAX 임
	@RequestMapping(value = "/getTourinfo.tp", method={RequestMethod.GET, RequestMethod.POST})
	public String getAllTourInfo(HttpServletRequest req)
	{
	
		String de_area_name = req.getParameter("area");
		String t_type = req.getParameter("t_type");
		AreaDetailVO advo = service.searchArea(de_area_name);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("area1", de_area_name);
		map.put("area2", null);
		map.put("area3", null);
		
		map.put("t_type",t_type);
		
		List<TourInfoVO> tList = service.getTourInfo(map);
		
		req.setAttribute("advo", advo);
		req.setAttribute("tList", tList);
		
		return "admin/tourinfo";

	}
	
	
	// 16일추가 -- 팝업
	@RequestMapping(value = "/detailTourInfo.tp", method={RequestMethod.GET, RequestMethod.POST})
	public String detailTourInfo(HttpServletRequest req, HttpSession ses)
	{
		
		
		MemberVO mvo = (MemberVO)ses.getAttribute("member");
		
		
		String t_idx = req.getParameter("t_idx");
		
		
		
/* =================================페이징 처리하고 추가한 부분================================================== */
		String pageNo = req.getParameter("pageNo");
		int totalCount = 0 ;  			// 총 게시물 건수
		int sizePerPage = 5 ; 			// 한 페이지당 보여줄 게시글 건수 ! 글 5개씩 보여준다 .
		int currentShowPageNo = 1; 		//현재 보여주는 페이지 번호로서 초기치로 1페이지로 설정함
		int totalPage = 0 ; 			// 총 페이지수(웹 브라우저상에 보여줄 총 페이지 객수)
		
		int start = 0;					// 시작 행번호
		int end = 0 ;  					// 끝 행번호
		int startPageNo = 0 ; 			// 페이지바 에서 시작될 페이지 번호
										// 페이지바란 ? 
										// 이전5페이지 [1][2][3][4][5] 다음5페이지
										// 이전5페이지 [6][7][8][9][19] 다음5페이지
										// 이 위에 한줄씩을 페이지바라고 부른다 ! 
		int loop = 0 ; 					// startPageNo 값이 증가할때 마다 1씩 증가하는 중가치 용도
		int blockSize = 5;				// 페이지바에 보여줄 페이지의 갯수
		
		
	
		if(pageNo == null){
			
			currentShowPageNo = 1;  
			
		}else{
			
			
			currentShowPageNo = Integer.parseInt(pageNo);
		}
		
		
		start = ((currentShowPageNo - 1 ) * sizePerPage ) + 1 ;
		end  = start + sizePerPage -1;
	

		List<TourInfoCommVO> ticlist = service.ticommentList(t_idx,start,end);
		

		totalCount = service.getTotalCount(t_idx);
		
		totalPage =(int) Math.ceil((double)totalCount/sizePerPage);
		
		String pagebar ="";
		
		 pagebar += "<ul>";
		 
		 loop = 1;
		 
		
		 startPageNo = ((currentShowPageNo - 1 )/blockSize) * blockSize + 1 ;
		 if(startPageNo==1){
			 pagebar += String.format("[이전%d페이지]",blockSize);
		 }else{
			 
			 pagebar += String.format(" <a href='/triplan/detailTourInfo.tp?t_idx="+t_idx+"&pageNo=%d'>[이전%d페이지]</a> ",startPageNo-1,blockSize);	 

		 }
		 
		 
		 while( !(loop > blockSize || startPageNo > totalPage)) {
			 
			 if(currentShowPageNo == startPageNo){
				 pagebar += String.format("<span style='color:red;font-weight:bold;text-decoration:underline;'>%d</span>",startPageNo);

			 }
			 else{
				 pagebar += String.format(" <a href='/triplan/detailTourInfo.tp?t_idx="+t_idx+"&pageNo=%d'>%d</a> ",startPageNo,startPageNo); 
			 }
			 
			 loop++;
			 startPageNo++;
			 
		 }
		 
		 if(startPageNo > totalPage){
	         // 마지막 페이지바에 도달한 경우
			 pagebar += String.format("[다음%d페이지]",blockSize);
			 }else{	 
		     // 마지막 페이지바가 아닌 페이지바에 도달한 경우
			 pagebar += String.format(" <a href='/triplan/detailTourInfo.tp?t_idx="+t_idx+"&pageNo=%d'>[다음%d페이지]</a> ",startPageNo,blockSize);	 
			  
			 }
			 
			 pagebar += "</ul>";
			 
			 req.setAttribute("pagebar", pagebar);
			 
/* ==========================     페이징 처리 끝       ================================== */			 
			
			 if(t_idx != null && mvo != null) 
			{
			 	HashMap<String, String> map = new HashMap<String, String>();
				
				String userid = mvo.getUserid();
				map.put("userid", userid);
				map.put("t_idx", t_idx);
				
				int rw = service.findRating(map); // 별점을 추가했는지 아닌지 여부
				
				int wl = service.checkWishList(map); // 위시리스트에 추가 되어있는지 없는지 확인한다. 추가 되어있으면  1을 반환하고 없다면 0 을 반환한다. -1은 로그인 안할때
			 
				TourInfoVO tvo = service.detailTourInfo(t_idx);
				
				req.setAttribute("tvo", tvo);
				req.setAttribute("userid", userid);
				req.setAttribute("ticlist", ticlist);	
				req.setAttribute("rw", rw);
				req.setAttribute("wl", wl);
		    }
			 
			 else if(t_idx != null && mvo == null) 
			{
				int rw = -1; // 별점을 추가했는지 아닌지 여부. -1은 로그인 안할때
					
				int wl = -1; // 위시리스트에 추가 되어있는지 없는지 확인한다. -1은 로그인 안할때
				 
				TourInfoVO tvo = service.detailTourInfo(t_idx);
				
				req.setAttribute("tvo", tvo);
				req.setAttribute("userid", "-9");
				req.setAttribute("ticlist", ticlist);	
				req.setAttribute("rw", rw);
				req.setAttribute("wl", wl);
		    }
				
		return "tourinfo/detailTourInfo";
	}
	
	// 17일추가 -- 관광지댓글 추가
	@RequestMapping(value = "/addTComment.tp", method={RequestMethod.POST})
	public String addTComment(HttpServletRequest req, TourInfoCommVO ticvo)
	{
		String userid = req.getParameter("userid");
		
		ticvo.setUserid(userid);

		int result = service.addTComment(ticvo);
		
		if(result != 0) // 댓글쓰기가 성공했다라면
		{
			service.editTCommentCount(ticvo.getT_idx());
		}
		
		req.setAttribute("ticvo", ticvo);
		
		return "tourinfo/addTCommentEnd";
	}
	
	@RequestMapping(value = "/addTRating.tp", method={RequestMethod.POST})
	public String addTRating(HttpServletRequest req)
	{
		String t_idx = req.getParameter("t_idx");
		String userid = req.getParameter("userid");
		String rating = req.getParameter("rating");

		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("t_idx", t_idx);
		map.put("userid", userid);
		map.put("rating", rating);
		
		service.insertRating(map);
		service.updateRating(t_idx);
		
		req.setAttribute("t_idx", t_idx);
		
		return "tourinfo/addTRatingEnd";
	}
	
	@RequestMapping(value = "/callChatroom.tp", method={RequestMethod.GET,RequestMethod.POST})
	public String callChat(HttpServletRequest req, HttpSession ses)
	{
		MemberVO memberVO = (MemberVO)ses.getAttribute("member"); 
		
		if(memberVO == null)
		{
			req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			req.setAttribute("loc", "/triplan/main.tp");
			
			return "msg";
		}
		String userid = memberVO.getUserid();
		
		String roomNo = req.getParameter("roomNo");
		
		List<JSONObject> jsonObjList = new ArrayList<JSONObject>();
		
		List<ChatVO> chatList = service.getChat(roomNo);
			
		for(ChatVO chvo : chatList) {
			
			JSONObject jsonObj = new JSONObject();
			// DB에서 select 해온 결과값인 vo를 JSON 형태로 저장하기 위해서 JSONObject 타입의 객체를 생성함
			
			// 다음으로 vo의 각 property 밸류 값을 key값으로 매핑하여 JSONObject 타입의 객체에 저장시킨다.
			jsonObj.put("roomNo", chvo.getRoomNo());              
			jsonObj.put("userid", chvo.getUserid());
			jsonObj.put("chatMsg", chvo.getChatMsg());
			jsonObj.put("regDate", chvo.getRegDate());
			
			// List<JSONObject> 타입을 되어진 List에 차례로 저장시킨다. 
			jsonObjList.add(jsonObj);
			
		}// end of for--------------------------------------
		
		req.setAttribute("jsonObjList", jsonObjList);
		
		return "schedule/callChat";
	}
	
	@RequestMapping(value = "/chat.tp", method={RequestMethod.GET, RequestMethod.POST})
	public String chat(HttpServletRequest req, HttpSession ses, ChatVO chvo)
	{
		MemberVO memberVO = (MemberVO)ses.getAttribute("member"); 
		
		String userid = memberVO.getUserid();
		String roomNo = "1"; // req.getParameter("roomNo");
		
		req.setAttribute("userid", userid);
		req.setAttribute("regDate", chvo.getRegDate());
		
		return "schedule/chat";
	}
	
	@RequestMapping(value = "/getAreaInfo.tp", method={RequestMethod.GET, RequestMethod.POST})
	public String getAreaInfo(HttpServletRequest req)
	{
		List<JSONObject> areajsonObjList = new ArrayList<JSONObject>();
		
		List<AreaVO> areaList = service.getAreaInfo();
		
		for(AreaVO avo : areaList) {
			
			JSONObject jsonObj = new JSONObject();
	           
			jsonObj.put("area_code", avo.getArea_code());
			jsonObj.put("area_name", avo.getArea_name());   
			
			areajsonObjList.add(jsonObj);
			
		}// end of for--------------------------------------
		
		req.setAttribute("areajsonObjList", areajsonObjList);
		
		return "popup/getArea";
	}
	
	@RequestMapping(value = "/getDeAreaInfo.tp", method={RequestMethod.GET, RequestMethod.POST})
	public String getDeAreaInfo(HttpServletRequest req)
	{
		List<JSONObject> deareajsonObjList = new ArrayList<JSONObject>();
		
		String area_code = req.getParameter("area_code");
		
		List<AreaDetailVO>  deareaList = service.getDeAreaInfo(area_code);
		
		if(deareaList.size() > 0)
		{
			for(AreaDetailVO advo : deareaList) {
				
				JSONObject jsonObj = new JSONObject();
		           
				jsonObj.put("area_code", advo.getArea_code());
				jsonObj.put("de_area_code", advo.getDe_area_code()); 
				jsonObj.put("de_area_name", advo.getDe_area_name());
				
				deareajsonObjList.add(jsonObj);
				
			}// end of for--------------------------------------
		}
		req.setAttribute("deareajsonObjList", deareajsonObjList);
		
		return "popup/getDeArea";
	}
	
	   // 가현 29일 추가(관광지 정보 업데이트 팝업)
	   @RequestMapping(value = "/tourinfochange.tp",  method={RequestMethod.GET, RequestMethod.POST})
	   public String admin_tourinfochange(HttpServletRequest req)
	   {
		   
		   String t_idx = req.getParameter("t_idx");
		   
		   TourInfoVO tvo = service.detailTourInfo(t_idx);
		   
		   List<AreaDetailVO> adlist = service.getadinfo();
		   List<TourInfoTypeVO> typelist = service.getType();
			
		   req.setAttribute("tvo", tvo);
		   req.setAttribute("adlist", adlist);
		   req.setAttribute("typelist", typelist);
		   
		   return "admin/yj_tourinfochange";
	   }
	   
	   // 가현 29일 추가(관광지 정보 업데이트)
	   @RequestMapping(value = "/tourinfochangeEnd.tp",  method={RequestMethod.GET, RequestMethod.POST})
	   public String tourinfochangeEnd(StatusmsgVO vo, HttpServletRequest req, TourInfoVO tivo)
	   {
		   
		   String t_idx = req.getParameter("t_idx");
		   String t_type = req.getParameter("t_type");
		   String t_name = req.getParameter("t_name");
		   String de_area_code = req.getParameter("de_area_code");
		   String t_detail = req.getParameter("t_detail");
		   String t_addr = req.getParameter("t_addr");
		   String tx = req.getParameter("tx");
		   String ty = req.getParameter("ty");
		   
		   boolean result = false;
		   
		   tivo.setT_idx(t_idx);
		   tivo.setT_type(t_type);
		   tivo.setT_name(t_name);
		   tivo.setDe_area_code(de_area_code);
		   tivo.setT_detail(t_detail);
		   tivo.setT_addr(t_addr);
		   tivo.setTx(tx);
		   tivo.setTy(ty);
		   
		   result = service.updateTourInfo(tivo);
		   
		   if(!vo.getAttach().isEmpty()){
				
				String tourinfo = req.getSession().getServletContext().getRealPath("/TourInfo/images/");
				String path = tourinfo+t_idx;
				
				File tourinfodir = new File(path);
				
				try{
					
					BufferedImage img_tourinfo = ImageIO.read(vo.getAttach().getInputStream());
					
					ImageIO.write(img_tourinfo, "jpg", new File(path+"/title.jpg"));			
					
				}catch(Exception e){
					req.setAttribute("msg", "사진 변경을 실패하였습니다.");
					req.setAttribute("loc", "javascript:history.back()");
					
					return "msg";
				}
				
			} 
		   
		   if(result == true)
		   {
			   req.setAttribute("t_idx", t_idx);
			   req.setAttribute("result", result);
		   }
		   
		   return "admin/tourinfochangeEnd";
	   }
	
	
	/* -------------------------------------------------------------------------------------------- */
	
	
	/* --------------------------------------  동규  ------------------------------------------------ */
	
		@RequestMapping(value = "/frienddel.tp", method = RequestMethod.GET)
		public String frienddel(HttpServletRequest req, HttpSession ses) {
		    
			String deluserid =  req.getParameter("requserid");	// 삭제할 ID
			MemberVO mem = (MemberVO)ses.getAttribute("member");
			
			if(mem == null)
			{
				req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
				req.setAttribute("loc", "/triplan/main.tp");
				
				return "msg";
			}
			else{
			String curID = mem.getUserid();			// 현재 ID
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("curID", curID);
			
			if(deluserid!=null)
			{								
					map.put("deluserid", deluserid);
					service.delFriend(map);
			}
			List<MemberVO> friendList =  service.getfriendList(curID);
			
			req.setAttribute("friendList", friendList);
			
			return "myplan/cd_friendlist";
			}
		}
		
		
		@RequestMapping(value = "/kyu_friendlist.tp", method = RequestMethod.GET)
		public String friendlist(HttpSession ses, HttpServletRequest req) {
		    
			MemberVO mem = (MemberVO)ses.getAttribute("member"); 
			ses.setAttribute("chk", 1);
			
			String userid = mem.getUserid();
			
			List<MemberVO> friendList =  service.getfriendList(userid);
			
			req.setAttribute("friendList", friendList);
			
			return "myplan/cd_friendlist";
		}	// end of friendlist
		
		///////////////////////////////////////////////////////////////////////////////
		@RequestMapping(value = "/kyu_friendmemadd.tp", method = RequestMethod.GET)
		public String friendmemadd(HttpSession ses, HttpServletRequest req) {
		   
			ses.setAttribute("chk", 2);
			MemberVO mem = (MemberVO)ses.getAttribute("member"); 
			String curuserid = mem.getUserid();
			
			List<MemberVO> memberList = service.getmemberList(curuserid);
					
			req.setAttribute("memberList", memberList);
			
			/*
			 	List<MemberVO> reqmemlist = service.getreqmemlist(curuserid);
				req.setAttribute("reqmemlist", reqmemlist);
			*/
			return "myplan/kyu_memberList2";
		}
		
		////////////////////////// 지금 하고 있는 부분 0630 /////////////////////////////
		@RequestMapping(value = "/kyu_findFriend.tp", method = RequestMethod.GET)
		public String findFriend(HttpSession ses, HttpServletRequest req) {
		   
			String searchID = req.getParameter("searchID");
			int check = (Integer)ses.getAttribute("chk");
			MemberVO mem = (MemberVO)ses.getAttribute("member"); 
			String userid =null;
			
			HashMap<String, String> map = new HashMap<String, String>();
			/*List<MemberVO> memberList=new ArrayList<MemberVO>();
			List<MemberVO> reqmemlist=new ArrayList<MemberVO>(); */
			
			if(mem != null)
			{
				userid = mem.getUserid();
			}
			map.put("searchID", searchID);		
			map.put("userid", userid);
			
			if(check==1)
			{
				List<MemberVO> friendList = service.myfriendfind(map);
				req.setAttribute("friendList", friendList);
				
				return "myplan/cd_friendlist";
			}
			else{
				
				List<MemberVO> memberList = service.memberfind(map);	// 나 자신, 지금 현재 친구, 현재 친구 요청건 사람을 제외한 ID찾기
				
				List<MemberVO> reqmemlist = service.reqmemberfind(map); // 나 자신, 지금 현재 친구를 제외   / 친구 요청 건 사람
				
				req.setAttribute("memberList", memberList);
				req.setAttribute("reqmemlist", reqmemlist);
					
				return "myplan/kyu_memberList2";
			}
			
			
		}
	//////////////////////////지금 하고 있는 부분 /////////////////////////////
		
		/*
		@RequestMapping(value = "/friendadd.tp", method = RequestMethod.GET)
		public String friendadd(HttpSession ses, HttpServletRequest req) {
		   
			String addchkArr[] = req.getParameterValues("addchk"); // 추가할 ID들이 들어감
			
			MemberVO mem = (MemberVO)ses.getAttribute("member"); 
			String curuserid = mem.getUserid();
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("curuserid", curuserid);
			
			for(String friendid : addchkArr )
			{
				map.put("friendid", friendid);
				service.friendAdd(map);
			}
			
			req.setAttribute("msg", "선택하신 친구가 등록되었습니다.");
			req.setAttribute("loc", "/triplan/cd_myplan.tp");
			
			return "msg";
		}
		*/
		
		// 친구 등록				 
		@RequestMapping(value = "/friendadd.tp", method = RequestMethod.GET)		
		public String friendadd(HttpSession ses, HttpServletRequest req) {
		
			String requserid = req.getParameter("requserid");		// 추가할 ID
			MemberVO mem = (MemberVO)ses.getAttribute("member"); 
			String curuserid = mem.getUserid();	// 현재 ID
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("curuserid", curuserid);
			map.put("requserid", requserid);
			
			service.friendAdd(map);
			service.friendAdd2(map);
			service.friendOk(map);
			
			List<HashMap<String,String>> list = service.yesorno(curuserid);
			
			req.setAttribute("list", list);
			
			return "myplan/kyu_yesornoList";
			
		}
		
		///////////// 요청 거절
		@RequestMapping(value = "/friendreqdel.tp", method = RequestMethod.GET)
		public String friendreqdel(HttpSession ses, HttpServletRequest req) {
		
			String requserid = req.getParameter("requserid");		// 거절할 ID
			MemberVO mem = (MemberVO)ses.getAttribute("member"); 
			String curuserid = mem.getUserid();	// 현재 ID
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("curuserid", curuserid);
			map.put("requserid", requserid);
			
			service.friendreqdel(map);
			
			List<HashMap<String,String>> list = service.yesorno(curuserid);
			
			req.setAttribute("list", list);
			
			return "myplan/kyu_yesornoList";
			
		}
		
		
		
		////////
		// 친구 수락 요청			 
		@RequestMapping(value = "/friendreq.tp", method = RequestMethod.GET)
		public String friendreq(HttpSession ses, HttpServletRequest req) {
		
			ses.setAttribute("chk", 2);
			
			String adduserid = req.getParameter("requserid");		// 추가 요청 ID
			MemberVO mem = (MemberVO)ses.getAttribute("member"); 
			String curuserid = mem.getUserid();	// 현재 로그인(요청할) ID
			
			HashMap<String,String> map = new HashMap<String, String>();
			map.put("curuserid", curuserid);	// 요청할 ID
			map.put("adduserid", adduserid);	// 요청 받을 ID
			
			service.friendreq(map);
			
			List<MemberVO> memberList = service.getmemberList(curuserid);
					
			req.setAttribute("memberList", memberList);
			
			List<MemberVO> reqmemlist = service.getreqmemlist(curuserid);
			req.setAttribute("reqmemlist", reqmemlist);
		
			return "myplan/kyu_memberList2";
		}
		
		@RequestMapping(value = "/kyu_yesorno.tp", method = RequestMethod.GET)			
		public String yesorno(HttpSession ses, HttpServletRequest req) {
		
			MemberVO mem = (MemberVO)ses.getAttribute("member"); 
			String curuserid = mem.getUserid();	// 현재 로그인(요청할) ID
			
			List<HashMap<String,String>> list = service.yesorno(curuserid);
			
			req.setAttribute("list", list);
			
			return "myplan/kyu_yesornoList";
			
		}
		
		
		@RequestMapping(value = "/realtimeSearch.tp", method = RequestMethod.GET)
		public String realtimeSearch(HttpServletRequest req, HttpSession ses) {
		
			List<HashMap<String,String>> list = service.realtimeSearch();
			
			if(list!=null){
				req.setAttribute("list", list);
			}
			
			return "main/kyu_0622_realtimeSearch";
		}
		
								  
		@RequestMapping(value = "/mainrealtimeSearch.tp", method = RequestMethod.GET)
		public String mainrealtimeSearch(HttpServletRequest req, HttpSession ses) {
		
			List<HashMap<String,String>> list = service.realtimeSearch();
			
			if(list!=null){
				req.setAttribute("rlist", list);
				ses.setAttribute("zlist", list);
			}
				
			return "main/kyu_0623_realtimeSearch";
		}
		
		
		// 0628 <동규>//
		@RequestMapping(value = "/kyu_getLiked.tp", method = RequestMethod.GET)
		public String getLiked(HttpServletRequest req, HttpSession ses) {
		
			MemberVO mem = (MemberVO)ses.getAttribute("member");
			String userid = mem.getUserid();
			
			HashMap<String, String> id = new HashMap<String, String>();
			id.put("userid", userid);

			List<HashMap<String, String>> likelist = service.getLiked(id);
			
			req.setAttribute("likelist", likelist);
			
			return "myplan/getMylikedList";
		}
		
		@RequestMapping(value = "/kyu_deletelike.tp", method = RequestMethod.GET)
		public String deletelike(HttpServletRequest req, HttpSession ses) {
		
			MemberVO mem = (MemberVO)ses.getAttribute("member");
			String userid = mem.getUserid();
			String idx = req.getParameter("idxdata");
			
			HashMap<String, String> id = new HashMap<String, String>();
			id.put("userid", userid);
			
			////////////////////////////////0702 동규 ////////////////////////////////// xml까지 수정함
			id.put("idx", idx);
			int n = service.deletelikechk(id);
			
			
			if(n<1)
			{
				req.setAttribute("loc", "/triplan/cd_myplan.tp");
				req.setAttribute("msg", "더 이상의 likecount는 감소될수 없습니다!");
				
				return "msg";
			}
			
			service.deletelike(id);
			
			///////////////////////////////////////////////////////////////////////// 여기

			
			List<HashMap<String, String>> likelist = service.getLiked(id);
			
			req.setAttribute("likelist", likelist);
			
			return "myplan/getMylikedList";
		}
		
		
		@RequestMapping(value = "/editinfo.tp", method = RequestMethod.POST)
		public String editinfo(MemberVO mem, HttpSession ses, HttpServletRequest req) {
		
			MemberVO member = (MemberVO)ses.getAttribute("member");
			
			HashMap<String, String> map = new HashMap<String, String>();
			// 000 0000 0000
			// 010 356 0000
			String mob = mem.getMobile();
			String m1=null;
			String m2=null;
			String m3=null;
			
			if(mob.length()==11)
			{
				m1 = mob.substring(0,3);
				m2 = mob.substring(3,7);
				m3 = mob.substring(7);
			}
			else if(mob.length()==10)
			{
				m1 = mob.substring(0,3);
				m2 = mob.substring(3,6);
				m3 = mob.substring(6);
			}
			mob = m1+"-"+m2+"-"+m3;
			
			map.put("userid", member.getUserid());
			map.put("name", mem.getName());			// 이름 비밀번호 email 폰번호
			map.put("pw", mem.getPassword());
			map.put("email", mem.getEmail());
			map.put("pnum", mob);
			
			service.memberEditinfo(map);
			
			//////////////////////////////// 0702 동규 //////////////////////////////////
			member = service.getmemberInfo(member.getUserid());		
			
			ses.setAttribute("member", member);
			//////////////////////////////////////////////////////////////////////////
			
			
			req.setAttribute("loc", "/triplan/cd_myplan.tp");
			req.setAttribute("msg", "회원정보가 수정되었습니다!");
			
			return "msg";
		}
		
								 
		@RequestMapping(value = "/requestList.tp", method = RequestMethod.GET)
		public String requestList(HttpSession ses, HttpServletRequest req) {
			
			MemberVO mem = (MemberVO)ses.getAttribute("member"); 
			String curuserid = mem.getUserid();
		
		 	List<MemberVO> reqmemlist = service.getreqmemlist(curuserid);
			req.setAttribute("reqmemlist", reqmemlist);
		
			return "myplan/kyu_memberList3";
		}
		
		////////////////////////////////0702 동규 //////////////////////////////////
		@RequestMapping(value = "/kyu_addlike.tp", method = RequestMethod.GET)
		public String addlike(HttpSession ses, HttpServletRequest req) {
		
		MemberVO mem = (MemberVO)ses.getAttribute("member"); 
		String curuserid = mem.getUserid();				// 현재 ID
		String idx = req.getParameter("idxdata");		// 받아온 IDX
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("curuserid", curuserid);
		map.put("idx", idx);
		map.put("userid", curuserid);
		
		String ck = service.addlikechk(map);
		
		if(ck==null){
		
		service.addlikedList(map);
		service.addlikecnt(map);
		
		}else {	// 이미 있을때
		
		int n = service.deletelikechk(map);
		
		if(n<1)
		{
		req.setAttribute("loc", "/triplan/cd_myplan.tp");
		req.setAttribute("msg", "더 이상의 likecount는 감소될수 없습니다!");
		
		return "msg";
		}
		
		service.deletelike(map);
		
		}
		
		List<HashMap<String, String>> sc_list =  service.getMainSchedule(map);
		
		req.setAttribute("sc_list", sc_list);
		
		return "schedule/getMainSchedule";
		
		}
		
		@RequestMapping(value = "/kyu_getMainSchedule.tp", method = RequestMethod.GET)
		public String getMainSchedule(HttpSession ses, HttpServletRequest req) {
			
			MemberVO mem = (MemberVO)ses.getAttribute("member");
		    String userid ="";
		    if(mem != null){
			    userid = mem.getUserid();
		    }
		    String pageNo = req.getParameter("pageNo");
		    
			HashMap<String, String> map = new HashMap<String, String>();
		    map.put("userid", userid);
		    map.put("pageNo", pageNo);
			
		    /*System.out.println("테스트!!!!!!!!!!!!!!!!!!!!!!! -------  "+userid+"----------------------");*/
		    
			List<HashMap<String, String>> list = service.k_getMainSchedule(map);
			
			req.setAttribute("list", list);
			
			return "schedule/k_getMainSchedule";
		}


////////////////////////////////0702 동규 //////////////////////////////////	
	
	/* -------------------------------------------------------------------------------------------- */
	
	
	/* --------------------------------------  영주  ------------------------------------------------ */
	 
		@RequestMapping(value = "/adminpg.tp", method = RequestMethod.GET)  // 관리자 로그인 화면
		public String adminpg() {
			
			return "admin/adminpg";
		}
	   
	   @RequestMapping(value = "/adminlogin.tp", method = RequestMethod.POST)
		public String adminlogin(HttpServletRequest req, HttpSession ses, HttpServletResponse res) {
			
			int result=0;
			
			String adminid = req.getParameter("adminid");
			String password = req.getParameter("password");
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("id", adminid);
			map.put("pw", password);
			
			result = service.adminchk(map);
			
			if(result != 1){
				req.setAttribute("msg", "접근할수 없습니다.");
				req.setAttribute("loc", "/triplan/main.tp");
				
				return "msg";
			}
			else{
				
				AdminVO admin = service.goadmin(adminid);
				ses.setAttribute("admin", admin);
				return "admin/adminlogin";
				
			}
			
		}
	   
	   @RequestMapping(value = "/adminmain.tp", method = RequestMethod.GET)
		public String adminmain(HttpServletRequest req, HttpSession ses, HttpServletResponse res) {
			
		     AdminVO admin = (AdminVO) ses.getAttribute("admin");
		     
		     if(admin == null)
		     {
		    	 req.setAttribute("msg", "접근할수 없습니다.");
				 req.setAttribute("loc", "/triplan/adminpg.tp");
					
				 return "msg";
		     }
		   
		     return "admin/adminmain";
			
		}
	   
	   
	   @RequestMapping(value = "/admintotal.tp", method = RequestMethod.GET)  // 관리자 통계 화면
		public String admintotal() {
			
			return "admin/total/yj_total";
		}
	   
	   @RequestMapping(value = "/admintour.tp", method = RequestMethod.GET)  // 관리자 관광지 화면
		public String admintour(HttpServletRequest req) {
		   
		   	 	int start = 1;
		   	 	int end = 10;
		   	 	int totalCount = 0;
		   	 	String column = req.getParameter("column");
				String search = req.getParameter("search");
				if(search != null) {
					search = search.trim();	
				}
				
			  
			  List<TourInfoVO> list = service.tlist(column, search, start, end);
 
			  if(column==null || search==null) {
					// 총 페이지수 계산은 검색조건이 없을 때
					totalCount = service.getTotalCountTour(); // 검색조건이 없는 총 게시글 건수 알아오기
				}
				else {
					// 총 페이지수 계산은 검색조건이 있을 때
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("column", column);
					map.put("search", search);
					
					
					totalCount = service.getSearchCountTour(map); // 검색조건이 있는 총 게시글 건수 알아오기
				}
						
				
				// #20. DAO로 부터 받은 글목록을 request 영역에 저장시킨다.
				req.setAttribute("list", list);
				req.setAttribute("total", totalCount);
				// #59. 글목록을 볼때 검색에 따른 조회이라면
				//      아래의 view 단 페이지인 list.jsp 파일에
				//      검색컬럼 및 검색어가 그대로 유지되게끔 해주어야 한다.
				if(column != null && search != null) {
					req.setAttribute("column", column);
					req.setAttribute("search", search);
				}
				
				req.setAttribute("start", start);
				req.setAttribute("end", end);
				return "admin/yj_touredit";
				// Board/src/main/webapp/WEB-INF/views/list.jsp 파일을 생성한다.
			  
			  

		}
	   
	   //$
	   @RequestMapping(value = "/toureditpaging.tp", method = RequestMethod.GET)  // 관리자 관광지 화면
		public String toureditpaging(HttpServletRequest req) {
		   
		   	 int start = Integer.parseInt(req.getParameter("start"));
		   	 int end =  Integer.parseInt(req.getParameter("end"));
		   	 int totalCount = 0;
		   	 
			 String column = req.getParameter("column");
			 String search = req.getParameter("search");
				
			 if(search != null) {
					search = search.trim();	
				}
		 
			 List<TourInfoVO> list = service.tlist(column, search, start, end);
 
			  if(column==null || search==null) {
					// 총 페이지수 계산은 검색조건이 없을 때
					totalCount = service.getTotalCountTour(); // 검색조건이 없는 총 게시글 건수 알아오기
				}
				else {
					// 총 페이지수 계산은 검색조건이 있을 때
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("column", column);
					map.put("search", search);
					
					totalCount = service.getSearchCountTour(map); // 검색조건이 있는 총 게시글 건수 알아오기
				}
			  
			  
			  	req.setAttribute("start", start);
				req.setAttribute("end", end);		
				// #20. DAO로 부터 받은 글목록을 request 영역에 저장시킨다.
				req.setAttribute("list", list);
				req.setAttribute("total", totalCount);
				// #59. 글목록을 볼때 검색에 따른 조회이라면
				//      아래의 view 단 페이지인 list.jsp 파일에
				//      검색컬럼 및 검색어가 그대로 유지되게끔 해주어야 한다.
				if(column != null && search != null) {
					req.setAttribute("column", column);
					req.setAttribute("search", search);
				}
				
				
				return "admin/toureditpaging";
			  
			  

		}
	   
	   // 관광지 추가 - 가현이 30일 최종
	   @RequestMapping(value = "/adminaddtr.tp", method = RequestMethod.GET)  // 관리자 회원 화면
		public String adminaddtr(HttpServletRequest req) {
		   
		    List<AreaDetailVO> adlist = service.getadinfo();
		    List<TourInfoTypeVO> typelist = service.getType();
			
		    req.setAttribute("adlist", adlist);
		    req.setAttribute("typelist", typelist);
		   
			return "admin/yj_addtr"; 
	   }
	   
	   @RequestMapping(value = "/admintrinst.tp", method = RequestMethod.POST)  // 관리자 관광지 추가 화면
		public String admintrinst(StatusmsgVO vo, MultipartHttpServletRequest req) {
		   
		   
		    String de_area_code = req.getParameter("de_area_code");
		    
		    if(de_area_code == null)
		    {
		    	int area_code = Integer.parseInt(req.getParameter("area_code"));
		    	de_area_code = String.valueOf((area_code+100));
		    }
		   
			String t_name = req.getParameter("t_name");
			String t_addr = req.getParameter("t_addr");
			String t_type = req.getParameter("t_type");
			String t_start_date = req.getParameter("t_start_date");
			String t_end_date = req.getParameter("t_end_date");
			String t_detail = req.getParameter("t_detail");
			String tx = req.getParameter("tx");
			String ty = req.getParameter("ty");
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("de_area_code", de_area_code);
			map.put("t_name", t_name);
			map.put("t_addr", t_addr);
			map.put("t_type", t_type);
			map.put("t_start_date", t_start_date);
			map.put("t_end_date", t_end_date);
			map.put("t_detail", t_detail);
			map.put("tx", tx);
			map.put("ty", ty);
		    
			int t_idx = service.trinst(map);
			
			if(!vo.getAttach().isEmpty()){
				
				String tourinfo = req.getSession().getServletContext().getRealPath("/TourInfo/images/");
				String path = tourinfo+t_idx;
				
				File tourinfodir = new File(path);
				
				try{
					
					BufferedImage img_tourinfo = ImageIO.read(vo.getAttach().getInputStream());
					
					tourinfodir.mkdir();
					ImageIO.write(img_tourinfo, "jpg", new File(path+"/title.jpg"));			
					
				}catch(Exception e){
					req.setAttribute("msg", "사진 변경을 실패하였습니다.");
					req.setAttribute("loc", "javascript:history.back()");
					
					return "msg";
				}
				
			} 
			
		   req.setAttribute("msg", "관광지 추가 완료");
		   req.setAttribute("loc", "/triplan/adminmain.tp");
			
		   return "msg";
		      
	   }
	   
					// 관광지 지역번호
		@RequestMapping(value = "/tdacode.tp", method = RequestMethod.POST)  
		public String tacode(HttpServletRequest req) {

			
			String area_code = req.getParameter("area_code");
						
			List<AreaDetailVO> tdalist = service.tdacode(area_code);
			
			req.setAttribute("tdalist", tdalist);
		 	
			return "admin/yj_area_code";
		}
	   
	   
	   						// 관광지 삭제 
	   @RequestMapping(value = "/deltour.tp", method = RequestMethod.GET)  
		public void deltour(HttpServletRequest req) {
		   
			String t_idx = req.getParameter("t_idx");

			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("t_idx", t_idx);
		   
			service.deltour(map);
	   }
	   
	   
	   //				관광지 변경
	   @RequestMapping(value = "/adminedittr.tp", method = RequestMethod.POST)
		public String adminedittr(TourInfoVO tvo, HttpServletRequest req, HttpSession ses) {
			    
		    String t_idx = req.getParameter("t_idx");
		    String de_area_code = req.getParameter("de_area_code");
			String t_name = req.getParameter("t_name");
			String t_addr = req.getParameter("t_addr");
			String t_type = req.getParameter("t_type");
			String t_start_date = req.getParameter("t_start_date");
			String t_end_date = req.getParameter("t_end_date");
			String t_image1 = req.getParameter("t_image1");
			String t_image2 = req.getParameter("t_image2 = req");
			String t_detail = req.getParameter("t_detail");
			String tx = req.getParameter("tx");
			String ty = req.getParameter("ty");
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("t_idx", t_idx);
			map.put("de_area_code", de_area_code);
			map.put("t_name", t_name);
			map.put("t_addr", t_addr);
			map.put("t_type", t_type);
			map.put("t_start_date", t_start_date);
			map.put("t_end_date", t_end_date);
			map.put("t_image1", t_image1);
			map.put("t_image2", t_image2);
			map.put("t_detail", t_detail);
			map.put("tx", tx);
			map.put("ty", ty);
			
			
			///////////////////////////////////////
			
			service.adminedittr(map);

			
			TourInfoVO vo  = service.tourinfo(t_idx);
			
			ses.setAttribute("vo",vo);
			
			return "tourchange";
		
			
		}
	 
	 /* -------------------------------------------------------------------------------------------- */
	 
	 
	 /* --------------------------------------  대은  ------------------------------------------------ */
		
	   @RequestMapping(value = "/cd_myplanmain.tp", method = RequestMethod.GET)
		public String cd_myplanmain(HttpServletRequest req, HttpSession ses) {
	  
		   	MemberVO mem = (MemberVO) ses.getAttribute("member");
		   	
			if(mem == null)
			{
				req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
				req.setAttribute("loc", "/triplan/main.tp");
				
				return "msg";
			}
			
			String userid = mem.getUserid();
			
			// HashMap선언
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("userid", userid);
			
			req.setAttribute("userid", userid);
		   
			return "cd_myplanmain";
					
	   }
	   
	   @RequestMapping(value = "/cd_likedmain.tp", method = RequestMethod.GET)
		public String cd_likedmain(HttpServletRequest req, HttpSession ses) {
	  
		   	MemberVO mem = (MemberVO) ses.getAttribute("member");
		   	
			if(mem == null)
			{
				req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
				req.setAttribute("loc", "/triplan/main.tp");
				
				return "msg";
			}
		   	
			String userid = mem.getUserid();
			
			// HashMap선언
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("userid", userid);
		   
			return "cd_likedmain";
					
	   }
	   
	   @RequestMapping(value = "/cd_wishlistmain.tp", method = RequestMethod.GET)
	 		public String cd_wishlistmain(HttpServletRequest req, HttpSession ses) {

	 		   	MemberVO mem = (MemberVO) ses.getAttribute("member");
	 		   	
				if(mem == null)
				{
					req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
					req.setAttribute("loc", "/triplan/main.tp");
					
					return "msg";
				}
				
	 			String userid = mem.getUserid();
	 			
	 			// HashMap선언
	 			HashMap<String,String> map = new HashMap<String,String>();
	 			map.put("userid", userid);
				List<HashMap<String,String>> wlist = service.getwishlist(map);
				req.setAttribute("wlist", wlist);
	 			return "myplan/cd_wishlistmain";
	 					
	 	   }
	   
	   
	   @RequestMapping(value = "/cd_friendsmain.tp", method = RequestMethod.GET)
		public String cd_friendsmain(HttpServletRequest req, HttpSession ses) {
		   
		   	MemberVO mem = (MemberVO) ses.getAttribute("member");
		   	
			if(mem == null)
			{
				req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
				req.setAttribute("loc", "/triplan/main.tp");
				
				return "msg";
			}
		   	
			String userid = mem.getUserid();
			
			// HashMap선언
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("userid", userid);
		   
			return "cd_friendsmain";
					
	   }
////////////////////////////////////////////////////////////////////////////////////////////////////////
	   
	   
// ================== *** myPlans 메인 화면 *** =============== //
		@RequestMapping(value = "/cd_myplan.tp", method = RequestMethod.GET)
		public String cd_myplan(HttpServletRequest req, HttpSession ses) {
			
			// session 에 있는 (로그인되어있는) userid 가져오기
			MemberVO mem = (MemberVO) ses.getAttribute("member");
			
			if(mem == null)
			{
				req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
				req.setAttribute("loc", "/triplan/main.tp");
				
				return "msg";
			}
			
			String userid = mem.getUserid();
			
			// HashMap선언
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("userid", userid);
			
			// 위시리스트 가져오기
			//List<HashMap<String,String>> wlist = service.getwishlist(map);
			//List<HashMap<String,String>> flist = service.getFriendsList(map);
			
			
			String msg = service.getstatusmsg(userid);
		    // String statusmsg = req.getParameter("statusmsg");
			// 상태메시지는 회원가입을 하는 순간 
			//int n  = dao.updatestatusmsg(statusmsg);
			
			req.setAttribute("userid", userid);
			//req.setAttribute("wlist", wlist);
			//req.setAttribute("flist", flist);
			req.setAttribute("msg",msg);
			
			
			
			
		return "myplan/cd_myplan";
}
		
	
// ============ *** wishlist 에서 지역별로 가져오기 *** ============ //
	@RequestMapping(value = "/cd_getWishRegion.tp", method = RequestMethod.GET)
	public String cd_getWishRegion(HttpServletRequest req, HttpSession ses) {
	
		MemberVO mem = (MemberVO) ses.getAttribute("member");
		
		if(mem == null)
		{
			req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			req.setAttribute("loc", "/triplan/main.tp");
			
			return "msg";
		}
		
		String userid = mem.getUserid();
		HashMap<String, String> map = new HashMap<String, String>();
		//HashMap<String, String[]> map2 = new HashMap<String, String[]>();

		String areano = req.getParameter("areano");

		if(areano.equals("100"))
		{
			map.put("areano", "0");
			map.put("userid", userid);
			List<HashMap<String,String>> sc_wishlist = service.getReadScheduleWish(map);
			req.setAttribute("sc_wishlist", sc_wishlist);
			
			return "schedule/getScheduleWish";
		}
		else
		{
			
			map.put("areano", areano);
			map.put("userid", userid);
			List<HashMap<String,String>> wishregionlist = service.getWishRegion(map);
			req.setAttribute("wishregionlist", wishregionlist);
			
			return "myplan/getWishRegionEnd";
		}
		
		
		
	/*	String[] userid1 = new String[1];
		userid1[0] = mem.getUserid();		
		String[] list  = req.getParameterValues("chkbox");
		
		
		map2.put("userid",userid1);
		map2.put("list", list);
		
		
		service.deletewishlist(map2);
		*/
	}
		
		
	
// ============ *** wishlist 에서 지역별로 가져오기 (검색포함)  *** =========== //
		@RequestMapping(value = "/cd_getWishRegionSearch.tp", method = RequestMethod.GET)
		public String cd_getWishRegionSearch(HttpServletRequest req, HttpSession ses) {
		
			MemberVO mem = (MemberVO) ses.getAttribute("member");
			
			if(mem == null)
			{
				req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
				req.setAttribute("loc", "/triplan/main.tp");
				
				return "msg";
			}
			
			String userid = mem.getUserid();
			HashMap<String, String> map = new HashMap<String, String>();
			String areano = req.getParameter("areano");
			String searchword = req.getParameter("searchword");
			
			map.put("areano", areano);
			map.put("searchword", searchword);
			map.put("userid", userid);
			List<HashMap<String,String>> wishsearchlist = service.getWishRegionSearch(map);
			
			req.setAttribute("wishsearchlist", wishsearchlist);
			
			return "myplan/getWishRegionSearchEnd";
		}
	
				
				
// =========== *** wishlist에서 하나만  지운다. *** =========== //
	@RequestMapping(value = "/cd_deleteOneWishList1.tp", method = RequestMethod.GET)
	public String cd_deleteOneWishList1(HttpServletRequest req, HttpSession ses) {
	
	
		MemberVO mem = (MemberVO) ses.getAttribute("member");
		
		if(mem == null)
		{
			req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			req.setAttribute("loc", "/triplan/main.tp");
			
			return "msg";
		}
	
		
		HashMap<String,String> map = new HashMap<String,String>();
	
		String userid = mem.getUserid();
		String t_idx = req.getParameter("t_idx");
		map.put("userid",userid);
		map.put("t_idx", t_idx);
		String areano = "0";
		int n = service.delWish(map);
		
		if(n > 0 ) {
			
			map.put("areano", areano);
			List<HashMap<String,String>> wishregionlist = service.getWishRegion(map);
			req.setAttribute("wishregionlist", wishregionlist);
			return "myplan/getWishRegionEnd";
		
		}else{
			
			return "dd";
		}
		
	}

	
	
// ============= *** wishlist에서 여러개를 지운다 *** ============ //
		@RequestMapping(value = "/cd_deleteWishList.tp", method = RequestMethod.GET)
		public String cd_deleteWishList(HttpServletRequest req, HttpSession ses) {
		
			MemberVO mem = (MemberVO) ses.getAttribute("member");
			if(mem == null)
			{
				req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
				req.setAttribute("loc", "/triplan/main.tp");
				
				return "msg";
			}
			
			String areano = "0";
			String[] userid = new String[1];
			userid[0] = mem.getUserid();
			String userid2 = mem.getUserid();
	
			
			String[] chkbox = req.getParameterValues("chkboxchecked[]");
			
			HashMap<String,String[]> map = new HashMap<String,String[]>();
			HashMap<String,String> map2 = new HashMap<String,String>();

			map.put("chkbox", chkbox); 
			map.put("userid", userid);
			

			int n = service.deleteWishList(map);
			
			if(n > 0 ){
				map2.put("userid",userid2);
				map2.put("areano", areano);
				List<HashMap<String,String>> wishregionlist = service.getWishRegion(map2);
				req.setAttribute("wishregionlist", wishregionlist);
				return "myplan/getWishRegionEnd";
				
			}else{
				
				return "dd";
						
			}
			
		}
	

// ================ *** wishlist를 추가하려고 하면 일어나는 일 *** ============ //
		@RequestMapping(value = "/cd_addwishlistend.tp", method = RequestMethod.GET)
		public String cd_addwishlistend(HttpServletRequest req,HttpSession ses){

			MemberVO mem = (MemberVO) ses.getAttribute("member");
			if(mem == null)
			{
				req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
				req.setAttribute("loc", "/triplan/main.tp");
				
				return "msg";
			}
			HashMap<String,String> map = new HashMap<String,String>();

			String userid = mem.getUserid();
			String t_idx = req.getParameter("t_idx");
			String no = req.getParameter("no");
			
			map.put("userid", userid);
			map.put("t_idx",t_idx);
			map.put("no", no);
			
			if("0".equals(no)){ //insert 해야함
		
				service.insertWL(map);
				
			}else if("1".equals(no)){ // 벌써위시리스트에 존재하니깐 지워버린다.
				
				service.deleteWL(map);
			}
			
			
			int wl = service.checkWishList(map);

			req.setAttribute("wl", wl);
			req.setAttribute("t_idx", t_idx);

		return "tourinfo/hmm";
			
			
		}
			
		

		
			
// ============ *** 상태 메시지 바꾸기 !! *** ============== //		
		@RequestMapping(value = "/cd_setStatusMsg.tp", method = RequestMethod.GET)
		public String cd_setStatusMsg(HttpSession ses,HttpServletRequest req) {
			
			HashMap<String,String> map = new HashMap<String,String>();
			
			MemberVO mem = (MemberVO) ses.getAttribute("member");
			
			if(mem == null)
			{
				req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
				req.setAttribute("loc", "/triplan/main.tp");
				
				return "msg";
			}
			
			String userid = mem.getUserid();
			String statusmsg = req.getParameter("statusmsg");
				
			map.put("statusmsg",statusmsg);
			map.put("userid", userid);
			
			
			service.updateStatus(map);
			
			String msg = service.getstatusmsg(userid);
			req.setAttribute("msg", msg);
			
			return"myplan/getProfileMsg";
		}
		 
			
			
// =============== *** 배경화면 바꾸기(파일 업로드) *** ==================== //
		@RequestMapping(value = "/cd_uploadBGimg.tp", method = RequestMethod.POST)
		public String cd_uploadBGimg(StatusmsgVO vo, MultipartHttpServletRequest req, HttpSession session) {
			
			MemberVO mem = (MemberVO) session.getAttribute("member");
			
			if(mem == null)
			{
				req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
				req.setAttribute("loc", "/triplan/main.tp");
				
				return "msg";
			}
			
			String userid = mem.getUserid();
			
			if(!vo.getAttach().isEmpty()){
				
				String user = req.getSession().getServletContext().getRealPath("/User/");
				String path = user+userid;
				
				File useriddir = new File(path);
				
				try{
					
					BufferedImage img_profile = ImageIO.read(vo.getAttach().getInputStream());
					
					if(useriddir.exists())
					{
						ImageIO.write(img_profile, "jpg", new File(path+"/background.jpg"));
					}				
					
				}catch(Exception e){
					req.setAttribute("msg", "사진 변경을 실패하였습니다.");
					req.setAttribute("loc", "/triplan/cd_myplan.tp");
					
					return "msg";
				}
				
			} 
			
			HashMap<String,String> map = new HashMap<String,String>();
			map.put("userid", userid);
			
			String msg = service.getstatusmsg(userid);
			
			req.setAttribute("userid", userid);
			req.setAttribute("msg",msg);
			
			return "myplan/cd_myplan";
		}
		
		
// =============== *** 프로필 사진 바꾸기(파일 업로드) *** ==================== //
		@RequestMapping(value = "/cd_uploadPRimg.tp", method = RequestMethod.POST)
		public String cd_uploadPRimg(StatusmsgVO vo, MultipartHttpServletRequest req, HttpSession session) {
			
			
			MemberVO mem = (MemberVO) session.getAttribute("member");
			
			if(mem == null)
			{
				req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
				req.setAttribute("loc", "/triplan/main.tp");
				
				return "msg";
			}
			
			String userid = mem.getUserid();
			
			if(!vo.getAttach().isEmpty()){
				
				String user = req.getSession().getServletContext().getRealPath("/User/");
				String path = user+userid;
				
				File useriddir = new File(path);
				
				try{
					
					BufferedImage img_profile = ImageIO.read(vo.getAttach().getInputStream());
					
					ImageIO.write(img_profile, "jpg", new File(path+"/profile.jpg"));
					Thread.sleep(1000);
					
					HashMap<String,String> map = new HashMap<String,String>();
					map.put("userid", userid);
					
					String msg = service.getstatusmsg(userid);
					
					req.setAttribute("userid", userid);
					req.setAttribute("msg",msg);
					
					return "myplan/cd_myplan";
					
				}catch(Exception e){
					req.setAttribute("msg", "사진 변경을 실패하였습니다.");
					req.setAttribute("loc", "/triplan/cd_myplan.tp");
					
					return "msg";
				}
				
			} 
			else return "myplan/cd_myplan";
			
			
		}	

		// ※	※	※	※	※	※	※	※	※	※	대은 어드민 부분	※	※	※	※	※	※	※	※	※	※	※	※	※
		// =============== *** 통계 1번째 (오늘의 통계) *** ==================== //
				
				// 통계부분 메인페이지
				@RequestMapping(value ="/admin_statisticsMain.tp", method = RequestMethod.GET)
				public String admin_statisticsMain(HttpServletRequest req, HttpSession ses) {
					
					// 사이트 조회
					List<Integer> list = service.siteincnt();
					req.setAttribute("inCnt", list);
					
					return "admin/total/admin_netView";
				}
			
				
				// ====== [통계] 2.순방문자수  ====== // 
				@RequestMapping(value = "/admin_netView.tp", method = RequestMethod.GET)
				public String admin_netView(HttpServletRequest req, HttpSession ses) {
					
					
					// 사이트 조회
					List<Integer> list = service.siteincnt();
					req.setAttribute("inCnt", list);
					
					return "admin/total/admin_netView";
				}
				
				
				// ====== [통계] 3.조회수 순위  ====== // 
				@RequestMapping(value = "/admin_viewRank.tp", method = RequestMethod.GET)
				public String admin_viewRank(HttpServletRequest req, HttpSession ses) {
					
					//주말
					List<HashMap<String, String>> list = service.getviewRankSC();
					req.setAttribute("list",list);

					
					return "admin/total/admin_viewRank";
				}
				
				// ====== [통계] 4.좋아요 순위  ====== // 
				@RequestMapping(value = "/admin_likeRank.tp", method = RequestMethod.GET)
				public String admin_likeRank(HttpServletRequest req, HttpSession ses) {
					
		
					//주말
					List<HashMap<String, String>> list =  service.getLikeRank();
					req.setAttribute("list", list);
					
					return "admin/total/admin_likeRank";
				}
				
				// ====== [통계] 5.댓글수 순위  ====== // 
				@RequestMapping(value = "/admin_commentRank.tp", method = RequestMethod.GET)
				public String admin_commentRank(HttpServletRequest req, HttpSession ses) {
					
					
					
					// 관광지 댓글 순위 보여주기
					List<HashMap<String,String>> list =  service.getTourCommentRank();
					req.setAttribute("list", list);
					
					
					
					return "admin/total/admin_commentRank";
				}
				
				// ====== [통계] 6.별점 순위  ====== // 
				@RequestMapping(value = "/admin_ratingRank.tp", method = RequestMethod.GET)
				public String admin_ratingRank(HttpServletRequest req, HttpSession ses) {
					
					String no = "100";
					HashMap<String, String> map = new HashMap<String, String>();
					map.put("no", no);
					
					// 서울 관광지 별점 순위 보여주기 !!
					List<HashMap<String,String>> tourRating =  service.seoulTourRating(map);
					
					// 서울 음식점 별점 순위 보여주기 !!
					List<HashMap<String,String>> foodRating =  service.seoulFoodRating(map);
					
					// 서울 숙박 별점 순위 보여주기 !!
					List<HashMap<String,String>> hotelRating =  service.seoulHotelRating(map);
					
					// 서울 체험 별점 순위 보여주기 !!
					List<HashMap<String,String>> otherRating =  service.seoulOtherRating(map);

					req.setAttribute("tourRating", tourRating);
					req.setAttribute("foodRating", foodRating);
					req.setAttribute("hotelRating", hotelRating);
					req.setAttribute("otherRating", otherRating);

					return "admin/total/admin_ratingRank";
				}
				
				// ====== [통계] 7-1.(일별)지역검색 순위  ====== // 
				@RequestMapping(value = "/admin_regionRankDaily.tp", method = RequestMethod.GET)
				public String admin_regionRankDaily(HttpServletRequest req, HttpSession ses) {
					
					
					List<HashMap<String,String>> list =  service.admin_regionRankDaily();
					req.setAttribute("list", list);
					return "admin/total/admin_regionRankDaily";
				}
				
				// ====== [통계] 7-2.(일별)지역검색 순위  ====== // 
				@RequestMapping(value = "/admin_regionRankMonthly.tp", method = RequestMethod.GET)
				public String admin_regionRankMonthly(HttpServletRequest req, HttpSession ses) {
					
					List<HashMap<String,String>> list =  service.admin_regionRankMonthly();
					req.setAttribute("list", list);
					
					return "admin/total/admin_regionRankMonthly";
				}
				
				// ====== [통계] 7-2.(일별)지역검색 순위  ====== // 
				@RequestMapping(value = "/admin_regionRankYearly.tp", method = RequestMethod.GET)
				public String admin_regionRankYearly(HttpServletRequest req, HttpSession ses) {
					
				
					
					return "admin/total/admin_regionRankYearly";
				}
				
				
				
				
				// ====== [통계] 8.성별,연령별 분포  ====== // 
				@RequestMapping(value = "/admin_ageStat.tp", method = RequestMethod.GET)
				public String admin_ageStat(HttpServletRequest req, HttpSession ses) {
					
					List<HashMap<String, String>> map = service.getAdmin_ageStat();
					
					
					
					req.setAttribute("map", map);
					return "admin/total/admin_ageStat";
				}
				
				
				// test
				@RequestMapping(value = "/admin_getRegionRank.tp", method = RequestMethod.GET)
				public String admin_getRegionRank(HttpServletRequest req, HttpSession ses) {
					
			
					List<JSONObject> jsonobjectlist = new ArrayList<JSONObject>();
					
					String dateReq = req.getParameter("dateReq");
					// 관광지 댓글 순위 보여주기
					
					String month = req.getParameter("month");

					HashMap<String, String> theMap = new HashMap<String, String>();
					theMap.put("month",month);
					theMap.put("dateReq", dateReq);

					List<HashMap<String,String>> list =  service.getRegionRank(theMap);
					
					for(HashMap<String, String> map :list){
						
						JSONObject jsonobj = new JSONObject();
						
						jsonobj.put("rank", map.get("RANK"));
						jsonobj.put("searchedWord", map.get("searchedWord"));
						jsonobj.put("count", map.get("COUNT"));
						
						jsonobjectlist.add(jsonobj);
						
						
					}
						
					req.setAttribute("jsonobjectlist", jsonobjectlist);
					req.setAttribute("list", list);
					
					
					
					return "admin/total/admin_getRegionRank";
				}
				
		
				// ====== [통계] Ajax 로  별점 가져오기  ====== // 
				@RequestMapping(value = "/admin_getRatingAjax.tp", method = RequestMethod.GET)
				public String admin_getRatingAjax(HttpServletRequest req, HttpSession ses) {
					
					HashMap<String, String> map = new HashMap<String, String>();
					String no = req.getParameter("no");
					
					map.put("no", no);
					// 서울 관광지 별점 순위 보여주기 !!
					List<HashMap<String,String>> tourRating =  service.seoulTourRating(map);
					
					// 서울 음식점 별점 순위 보여주기 !!
					List<HashMap<String,String>> foodRating =  service.seoulFoodRating(map);
					
					// 서울 숙박 별점 순위 보여주기 !!
					List<HashMap<String,String>> hotelRating =  service.seoulHotelRating(map);
					
					// 서울 체험 별점 순위 보여주기 !!
					List<HashMap<String,String>> otherRating =  service.seoulOtherRating(map);

					req.setAttribute("tourRating", tourRating);
					req.setAttribute("foodRating", foodRating);
					req.setAttribute("hotelRating", hotelRating);
					req.setAttribute("otherRating", otherRating);
					
					
					
					return "admin/total/admin_getRatingAjax";
				}
				
				// 오늘 
				@RequestMapping(value = "/getMySearchedSchedule.tp", method = RequestMethod.GET)
				public String getMySearchedSchedule(HttpServletRequest req, HttpSession ses) {
				
				String userid = req.getParameter("userid");
				String search = req.getParameter("search");
					
				HashMap<String, String> map = new HashMap<String, String>();
				
				map.put("userid", userid);
				map.put("search", search);
				
				List<ScheduleVO> sc_list =  service.getMySearchedSchedule(map);
					   
				req.setAttribute("sc_list", sc_list);
			
					
				return "schedule/getMySearchedSchedule";
				
				
				}
				
				// 좋아요검색 7월4일
				@RequestMapping(value = "/getSearchedLiked.tp", method = RequestMethod.GET)
				public String getSearchedLiked(HttpServletRequest req, HttpSession ses) {
				
				
				String searched = req.getParameter("searched");
				String userid = req.getParameter("userid");	
				
				HashMap<String, String> map = new HashMap<String, String>();
				
				map.put("userid",userid);
				map.put("searched", searched);
				
				List<HashMap<String, String>> list =  service.getSearchedLiked(map);
					   
				req.setAttribute("list", list);
				
					
				return "myplan/getSearchedLiked";
				
				
				}
				
				
				//paige 친구받아온다...스케줄 초대하게...
				@RequestMapping(value = "/inviteSchedule.tp", method = RequestMethod.GET)
				public String inviteSchedule(HttpServletRequest req,HttpSession ses) {
					

					
			   	MemberVO mem = (MemberVO) ses.getAttribute("member");
			   	
				if(mem == null)
				{
					req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
					req.setAttribute("loc", "/triplan/main.tp");
					
					return "msg";
				}
				
				String userid = mem.getUserid();
				String sc_idx = req.getParameter("sc_idx");
				HashMap<String,String> map = new HashMap<String,String>();
				map.put("userid", userid);
				
				//친구 리스트를 받아온다.
				List<HashMap<String, String>> list = service.friendlistPaige(map);
				
				req.setAttribute("list", list);
				req.setAttribute("sc_idx", sc_idx);
				
					return "schedule/inviteSchedule";
				}
				
				
				//paige 이제 초대 테이블에 인서트 한다.
				@RequestMapping(value = "/addInviteSchedule.tp", method = RequestMethod.GET)
				public String addInviteSchedule(HttpServletRequest req,HttpSession ses) {
					

					MemberVO mem = (MemberVO) ses.getAttribute("member");
				   	
					if(mem == null)
					{
						req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
						req.setAttribute("loc", "/triplan/main.tp");
						
						return "msg";
					}
					
					String userid = mem.getUserid();
					String sc_idx = req.getParameter("sc_idx");
					String friendid = req.getParameter("friendid");
				
					HashMap<String,String> map = new HashMap<String,String>();
					map.put("sc_idx", sc_idx);
					map.put("friendid", friendid);
					map.put("userid",userid );
					
					//tbl_invite 테이블에 먼저 들어가 있는 tbl_join 테이블에 있는지 확인한다.
					int n = service.checkinvite(map);
					if(n == 0){// tbl_invite 에 없읍
						
					}else if(n == 1){// tbl_invite 에 있다는 뜻. 즉, 벌써 요청하고 있는 중이다.
						
						req.setAttribute("msg", "이미 요청중에 있는 친구입니다.");
				
						req.setAttribute("loc", "/triplan/inviteSchedule.tp?sc_idx="+sc_idx);
						
						return "msg";
					}
					
					int m = service.checkjoin(map);
					if(m == 0){// invite 테이블에도 없고 joIn 테이블에도 없다면 , invite 테이블에 인서트 한다.
						
						
					}else if(m == 1){//invite테이블에는 없지만 벌써 join 테이블에 있다는 뜻이다. 
						
						req.setAttribute("msg", "이미 스케줄에 참여하고 있는 멤버입니다.");
					
						req.setAttribute("loc", "/triplan/inviteSchedule.tp?sc_idx="+sc_idx);
						
						return "msg";
					}
					
					// 초대테이블에 넣는당.
					 int i  = service.addInvite(map);
					 req.setAttribute("sc_idx", sc_idx);
					 req.setAttribute("i", i);	
					 return "schedule/addInviteSchedule";
					
					
					
					
					
				}
				
				
				
				//paige 요청받은 초대 받아온다.. 마이프랜에서 보여줄껏!
				@RequestMapping(value = "/getRequestedInvite.tp", method = RequestMethod.GET)
				public String getRequestedInvite(HttpServletRequest req,HttpSession ses) {

					
				System.out.println("여기까진 오냐");
			   	MemberVO mem = (MemberVO) ses.getAttribute("member");
			   	
				if(mem == null)
				{
					req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
					req.setAttribute("loc", "/triplan/main.tp");
					
					return "msg";
				}
				
				String userid = mem.getUserid();
		
				HashMap<String,String> map = new HashMap<String,String>();
				map.put("userid", userid);
				
				//요청받은 스케줄을 받아온다...
				List<HashMap<String, String>> list = service.getRequestedInvite(map);
				
				
				for(HashMap<String, String> val :list){
					
					System.out.println("idx = " + val.get("IDX"));
					System.out.println("name = " + val.get("NAME"));
					
					
				}
				
				
				
				req.setAttribute("list", list);
			
				return "schedule/getRequestedInvite";
				}
				
				
				//paige 스케쥴요청 수락을 하면 지운다 ㅋㅋㅋㅋㅋ 
				@RequestMapping(value = "/acceptRequest.tp", method = RequestMethod.GET)
				public String acceptRequest(HttpServletRequest req,HttpSession ses) {

					
				String sc_idx = req.getParameter("sc_idx");	
				String userid = req.getParameter("userid");
				
		
				HashMap<String,String> map = new HashMap<String,String>();
				map.put("userid", userid);
				map.put("sc_idx", sc_idx);
				
				
				//tbl_invite 테이블에서 지운다.
				int n  = service.acceptRequest(map);
				if(n > 0 ){
					//tbl_join 테이블에  insert 해야한다.
					service.insertjoin(map);	
					
				}
	
				return "schedule/acceptRequest";
				}
				
				
				//paige 스케쥴요청 거절을 하면 지운다 ㅋㅋㅋㅋㅋ 걍 지우면 됨..
				@RequestMapping(value = "/declineRequest.tp", method = RequestMethod.GET)
				public String declineRequest(HttpServletRequest req,HttpSession ses) {

					
				String sc_idx = req.getParameter("sc_idx");	
				String userid = req.getParameter("userid");
				
		
				HashMap<String,String> map = new HashMap<String,String>();
				map.put("userid", userid);
				map.put("sc_idx", sc_idx);
				
				
				//tbl_invite 테이블에서 지운다.
				int n  = service.acceptRequest(map);
				
				return "schedule/declineRequest";
				}
				
				
	 /* -------------------------------------------------------------------------------------------- */
		
	@RequestMapping(value = "/new_schedule.tp", method = RequestMethod.GET)
	public String jh_scheduletest(HttpServletRequest req) {
		
	
		return "schedule/scheduletest";
	}
	
	@RequestMapping(value = "/view_schedule.tp", method = RequestMethod.GET)
	public String jh_view_schedule(HttpServletRequest req, HttpSession ses) {
		
		String sc_idx = req.getParameter("sc_idx");
		req.setAttribute("sc_idx", sc_idx);
		
////////////////////////////////0702 동규 //////////////////////////////////
		service.addviewCnt(sc_idx);				
////////////////////////////////0702 동규 //////////////////////////////////
		
		MemberVO member = (MemberVO) ses.getAttribute("member");
		if(member != null){
			String userid = member.getUserid();
			HashMap<String, String> map = new HashMap<String,String>();
			map.put("sc_idx", sc_idx);
			map.put("userid", userid);
			
			int ck_sc = service.ck_schedule(map);
			req.setAttribute("ck_sc", ck_sc);
		}
	
		return "schedule/viewSchedule";
	}
	
	@RequestMapping(value = "/edit_schedule.tp", method = RequestMethod.GET)
	public String jh_edit_schedule(HttpServletRequest req,HttpSession ses) {
		
		MemberVO member = (MemberVO)ses.getAttribute("member");
		if(member != null)
		{
			String userid = member.getUserid();
			req.setAttribute("userid", userid);
		}
		else
		{
			req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			req.setAttribute("loc", "/triplan/main.tp");
			
			return "msg";
		}
		
		String sc_idx = req.getParameter("sc_idx");
		req.setAttribute("sc_idx", sc_idx);
		
		return "schedule/editSchedule";
	}
	
	
   @RequestMapping(value="/schedule_Save.tp", method=RequestMethod.POST)
    public void schedule_Save (Map<String, Object> map, HttpServletRequest req, HttpServletResponse res) {

        ScheduleExcel sm = new ScheduleExcel();
		
        String sc_idx = req.getParameter("sc_idx");
        String td = req.getParameter("td");
        String sc_days = req.getParameter("sc_days");
        
        List<String> sc_list =  JSONArray.fromObject(td);
        
        map.put("sc_idx", sc_idx);
        map.put("sc_list", sc_list);
        map.put("sc_days", sc_days);
        
        
		try {
			
			sm.write(map, req, res);
			
		} catch (Exception e) {

			e.printStackTrace();
		}
		
    }

	    
   @RequestMapping(value="/schedule_Load.tp", method=RequestMethod.POST)
   public String schedule_Load (Map<String, Object> map, HttpServletRequest req, HttpServletResponse res) {

       ScheduleExcel sm = new ScheduleExcel();   
       
       String sc_idx = req.getParameter("sc_idx");
       
       HashMap<String,Object> hashmap = new HashMap<String, Object>();
       map.put("sc_idx", sc_idx);
       
       try {
    	   
		hashmap = sm.read(map, req, res);
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
       req.setAttribute("StringArr", (String[])hashmap.get("StringArr"));
       req.setAttribute("collen", (Integer)hashmap.get("collen"));
       
       String edit = req.getParameter("edit");
       
       if(edit == null)
       {
    	   return "schedule/schedule_Load";
       }
       else
       {
    	   return "schedule/schedule_EditLoad";
       }
	   
		

   }
   
   @RequestMapping(value="/jh_getSchedule.tp", method=RequestMethod.POST)
   public String jh_getSchedule (HttpServletRequest req, HttpServletResponse res, HttpSession ses) {

	   MemberVO mem = (MemberVO)ses.getAttribute("member");
	   
	   if(mem == null)
		{
			req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			req.setAttribute("loc", "/triplan/main.tp");
			
			return "msg";
		}
	   
	   String userid = mem.getUserid();
	   
	   HashMap<String, String> map = new HashMap<String,String>();
	   map.put("userid", userid);
	   
	   List<ScheduleVO> sc_list =  service.getMySchedule(map);
	   
	   req.setAttribute("sc_list", sc_list);
	   
	   return "schedule/getMySchedule";

   }
	
   @RequestMapping(value="/jh_getMainSchedule.tp", method=RequestMethod.POST)
   public String jh_getMainSchedule (HttpServletRequest req, HttpServletResponse res, HttpSession ses) {
	   
////////////////////////////////0702 동규 //////////////////////////////////
		MemberVO mem = (MemberVO)ses.getAttribute("member");
		String userid ="";
		if(mem != null){
		userid = mem.getUserid();
		}
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		
		List<HashMap<String, String>> sc_list =  service.getMainSchedule(map);
		
		req.setAttribute("sc_list", sc_list);
		
		return "schedule/getMainSchedule";
////////////////////////////////0702 동규 //////////////////////////////////

   }
   
   @RequestMapping(value="/jh_getSearchSchedule.tp", method=RequestMethod.POST)
   public String jh_getSearchSchedule (HttpServletRequest req, HttpServletResponse res, HttpSession ses) {
	   
	   HashMap<String, String> map = new HashMap<String,String>();
	   String sc_searchWord = req.getParameter("sc_searchWord").substring(1);

	   map.put("sc_searchWord", sc_searchWord);
	   
	   List<HashMap<String,String>> sc_list =  service.getSearchSchedule(map);
	   
	   req.setAttribute("sc_list", sc_list);
	   
	   return "schedule/getMySearchedSchedule";

   }
   
   @RequestMapping(value="/sendMsg.tp", method=RequestMethod.POST)
   public void jh_sendMsg (HttpServletRequest req, HttpServletResponse res, HttpSession ses) {
	   
	   HashMap<String, String> map = new HashMap<String,String>();
	   MemberVO memberVO = (MemberVO)ses.getAttribute("member"); 
		
	   String userid = memberVO.getUserid();
	   String roomNo = req.getParameter("roomNo");
	   String chatMsg = req.getParameter("chatMsg");
	   
	   map.put("userid", userid);
	   map.put("roomNo", roomNo);
	   map.put("chatMsg", chatMsg);
	   
	   service.sendMsg(map);
	   

   }
	
   @RequestMapping(value="/appendDate.tp", method=RequestMethod.POST)
   public String jh_appendDate (HttpServletRequest req, HttpServletResponse res, HttpSession ses) {
	   
	   	String end_date = req.getParameter("end_date");
	   
	   	String[] days = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar end_cal = Calendar.getInstance();
		
		try {
			end_cal.setTime(format.parse(end_date));

			Map<String,Object> save_sc_map = new HashMap<String,Object>();
			List<String> sc_list = new ArrayList<String>();
			
			end_cal.setTimeInMillis(end_cal.getTimeInMillis()+(24*60*60*1000));
			
			String day = "";
			
			day = end_cal.get(Calendar.YEAR)+"-";
			
			if(end_cal.get(Calendar.MONTH)+1 < 10)
				day += "0"+(end_cal.get(Calendar.MONTH)+1)+"-";
			else
				day += (end_cal.get(Calendar.MONTH)+1)+"-";
			
			if(end_cal.get(Calendar.DATE) < 10)
				day += "0"+end_cal.get(Calendar.DATE)+" ";
		    else
		    	day += end_cal.get(Calendar.DATE)+" ";

			
		    
		    day += days[end_cal.get(Calendar.DAY_OF_WEEK)-1];
		    
		    req.setAttribute("day", day);
		    
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    
		return "schedule/date";

   }
   
	@RequestMapping(value = "/sc_getTourinfo.tp", method={RequestMethod.GET, RequestMethod.POST})
	public String sc_getAllTourInfo(HttpServletRequest req)
	{
	
		String de_area_name = req.getParameter("area");
		String t_type = req.getParameter("t_type");
		AreaDetailVO advo = service.searchArea(de_area_name);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("area1", de_area_name);
		map.put("t_type",t_type);
		
		List<TourInfoVO> tList = service.getTourInfo(map);
		
		req.setAttribute("advo", advo);
		req.setAttribute("tList", tList);
		
		return "schedule/getScheduleTourInfo";

	}
	
	@RequestMapping(value = "/getReadScheduleTour.tp", method={RequestMethod.GET, RequestMethod.POST})
	public String getReadScheduleTour(HttpServletRequest req)
	{
		String t_idx = req.getParameter("t_idx");
		String p_t_type = req.getParameter("t_type");

		List<String> t_idx_list =  JSONArray.fromObject(t_idx);
		String[] t_idxarr = new String[t_idx_list.size()];
		for(int i = 0 ; i < t_idx_list.size(); i++)
		{
			t_idxarr[i] = t_idx_list.get(i);
		}
		
		String[] t_type =  new String[1];
		t_type[0] = p_t_type;
		
		HashMap<String, String[]> map = new HashMap<String, String[]>();
		map.put("t_idxarr", t_idxarr);
		map.put("t_type", t_type);
		
		List<TourInfoVO> tlist = service.getReadScheduleTour(map);
		
		req.setAttribute("tList", tlist);
		
		return "schedule/getScheduleTourInfo";

	}
	
	@RequestMapping(value = "/kyu_getsearch_Schedule.tp", method = RequestMethod.GET)
	public String getsearch_Schedule(HttpSession ses, HttpServletRequest req) {
		
		String pageNum = req.getParameter("pageNum");	
		String sc_searchWord = req.getParameter("sc_searchWord").substring(1);
		MemberVO member = (MemberVO)ses.getAttribute("member");
		String userid ="";
	    if(member != null){
	    	userid = member.getUserid();
	    }
	      
		HashMap<String, String> map = new HashMap<String,String>();
		   
		   map.put("sc_searchWord", sc_searchWord);
		   map.put("pageNum", pageNum);
		   map.put("userid", userid);
		   
		   List<HashMap<String,String>> sc_list =  service.getSearchSchedule(map);
		   
		   req.setAttribute("sc_list", sc_list);
		   
		   return "schedule/getMySearchedSchedule";
		
	}///////////////////////// 이거
	

}
