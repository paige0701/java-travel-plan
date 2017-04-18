package com.spring.triplan;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.imageio.stream.FileImageInputStream;
import javax.imageio.stream.FileImageOutputStream;
import javax.mail.Session;
import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spring.common.FileManager;
import com.spring.model.AdminVO;
import com.spring.model.AreaDetailVO;
import com.spring.model.AreaVO;
import com.spring.model.ChatVO;
import com.spring.model.MemberVO;
import com.spring.model.ScheduleVO;
import com.spring.model.StatusmsgVO;
import com.spring.model.TourInfoCommVO;
import com.spring.model.TourInfoDetaliVO;
import com.spring.model.TourInfoVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@Autowired
	FileManager fileManager;

	@RequestMapping(value = "/agree.tp", method = RequestMethod.GET)
	public String agree() {

		return "member/agree";
	}
	
	
	@RequestMapping(value = "/insertMember.tp", method = RequestMethod.POST)
	public String insertMember(MemberVO vo, HttpServletRequest req) {

		String mobile = vo.getMobile();
		String m1="";
		String m2="";
		String m3="";
		
		if(vo!=null){
			if(mobile.length()==10){
				
				m1 = mobile.substring(0,3);		// 000 000 0000
				m2 = mobile.substring(3,6);	
				m3 = mobile.substring(6);
				
				mobile = m1+"-"+m2+"-"+m3;
				
			}else{
				m1 = mobile.substring(0,3);		// 000 0000 0000
				m2 = mobile.substring(3,7);
				m3 = mobile.substring(7);
				
				mobile = m1+"-"+m2+"-"+m3;
			}
		}
		vo.setMobile(mobile);
		
		service.meminsert(vo);
		
		String userid = vo.getUserid();
		
		String user = req.getSession().getServletContext().getRealPath("/User/");
		
		File default_profile = new File(user+"profile.jpg");
		File default_background = new File(user+"background.jpg");
		File useriddir = new File(user+userid);
		
		if(!(useriddir.exists()))
		{
			useriddir.mkdir();
		}
		
		try {
			
			BufferedImage img_profile = ImageIO.read(default_profile);
			BufferedImage img_background = ImageIO.read(default_background);
			
			if(useriddir.exists())
			{
				ImageIO.write(img_profile, "jpg", new File(user+userid+"/profile.jpg"));
				ImageIO.write(img_background, "jpg", new File(user+userid+"/background.jpg"));
			}
			
		} catch (IOException e) {
			System.out.println("이미지 불러오기 실패");
			e.printStackTrace();
		} 
		
		return "member/insertend";
	}	
	
	
	@RequestMapping(value = "/login.tp", method = RequestMethod.POST)
	public String login(HttpServletRequest req, HttpSession ses, HttpServletResponse res) {
		
		int result=0;
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String id_save = req.getParameter("id_save");
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("pw", pw);
		
		result = service.loginchk(map);
		
		if(result==-1){
			req.setAttribute("msg", "존재하지 않는 ID입니다. 회원가입을 하세요.");
			req.setAttribute("loc", "/triplan/main.tp");
			
			return "msg";
		}
		else if(result==0)
		{
			req.setAttribute("msg", "PW가 일치하지 않습니다.");
			req.setAttribute("loc", "/triplan/main.tp");
			
			return "msg";
		}
		else{
			
			MemberVO member = service.getmemberInfo(id);
			ses.setAttribute("member", member);
			
			Cookie cookie = new Cookie("saveid", member.getUserid());
			
			if(id_save != null)	
    		{
    			cookie.setMaxAge(604800);		// 일주일간 정보를 가지고 있을거다! 파라미터는 초단위.
    			 
    			cookie.setPath("/");
    		}
			else{
				cookie.setMaxAge(0);	// 쿠키의 삭제!
    			cookie.setPath("/");
			}
			res.addCookie(cookie);
			
			return "main";
		}	
		
	}
	
	@RequestMapping(value = "/logout.tp", method = RequestMethod.GET)
	public String logout() {
	    
		return "member/logout";
	}
	
	
	@RequestMapping(value = "/idcheck.tp", method = RequestMethod.GET)
	public String idcheck() {
	    
		return "member/idcheck";
	}
	
	@RequestMapping(value = "/idcheck2.tp", method = RequestMethod.POST)
	public String idcheck2(HttpServletRequest req) {
	    
		String userid = req.getParameter("userid");
		
		int chk = service.idcheck(userid);
		
		if(chk==0)		// 사용가능
		{
			req.setAttribute("check",chk);
			req.setAttribute("userid", userid);
			return "member/idcheck2";
		}
		else			// 사용불가
		{
			req.setAttribute("check",chk);
			req.setAttribute("userid", userid);
			return "member/idcheck2";
		}
		
		
	}
	
	@RequestMapping(value = "/memberinfo.tp", method = RequestMethod.GET)
	public String memberinfo() {
	    
		return "member/memberinfo";
	}
	
	
	@RequestMapping(value = "/kyu_meminfochg.tp", method = RequestMethod.POST)
	public String kyu_meminfochg(MemberVO vo, HttpServletRequest req, HttpSession ses) {
		    
		if(vo == null)
		{
			req.setAttribute("msg", "로그인이 필요한 서비스입니다.");
			req.setAttribute("loc", "/triplan/main.tp");
			
			return "msg";
		}
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		String name_k = vo.getName();
		String passwd_k = vo.getPassword();
		String email_k = vo.getEmail();
		String pnum_k = vo.getMobile();
		String userid_k = vo.getUserid();
		
		String pnum1 = null;
		String pnum2 = null;
		String pnum3 = null;
		
		if(pnum_k.length()==10){
			
			pnum1 = pnum_k.substring(0,3);		// 000 000 0000
			pnum2 = pnum_k.substring(3,6);
			pnum3 = pnum_k.substring(6);
			
		}else{
			pnum1 = pnum_k.substring(0,3);		// 000 0000 0000
			pnum2 = pnum_k.substring(3,7);
			pnum3 = pnum_k.substring(7);
		}
		
		pnum_k = pnum1+"-"+pnum2+"-"+pnum3;
		
		///////////////////////////////////////
		map.put("userid", userid_k);			// 이거
		map.put("name", name_k);
		map.put("passwd", passwd_k);
		map.put("pnum", pnum_k);
		map.put("email", email_k);
		
		service.meminfochg(map);
		
		req.setAttribute("msg", "회원정보가 변경되었습니다.");
		req.setAttribute("loc", "/triplan/cd_myplan.tp");
		
		MemberVO member = service.getmemberInfo(userid_k);///////////
		
		ses.setAttribute("member",member);
		
		return "msg";
	}
	
	 @RequestMapping(value = "/idFind2.tp", method = RequestMethod.GET)
	   public String idFind2(HttpServletRequest req) {
	      
	      HashMap<String,String> map = new HashMap<String,String>();
	      
	      String name = req.getParameter("name");
	      String mobile = req.getParameter("mobile");
	      
	      if(name != null && mobile != null)
	      {
	      
	         map.put("name", name);
	         map.put("mobile", mobile);
	         
	         String userid = service.idFind(map);
	         
	         if(userid == null)
	         {
	            userid = "null";
	         }
	         
	         req.setAttribute("userid",userid);
	      }
	      
	      return "popup/idFind2";
	   }
	 
	 @RequestMapping(value = "/pwFind2.tp", method = RequestMethod.GET)
	   public String pwFind(HttpServletRequest req) {
	      
		  HashMap<String,String> map = new HashMap<String,String>();
		   
		  String userid = req.getParameter("userid");
	      String email = req.getParameter("email"); 
	      
	      if(userid != null && email != null)
	      {
	      
	         map.put("userid", userid);
	         map.put("email", email);
	         
	         int n = service.pwFind(map);
	        
	         String msg = "";
	         
	         if(n == 1)
	         {
	        	 NaverMail mail = new NaverMail();
	        	 
	        	 try {
	        		 
	        		 int randnum = 0;
	        		 String imsipw = "";
	        		 
	        		 for(int i = 0; i <7 ; i++)
	        		 {
	        			 randnum = (int)(Math.random() * 10);
	        			 imsipw += randnum;
	        		 }
	        		 
					mail.sendmail(email, imsipw);
					req.setAttribute("imsipw",imsipw);
					// 비밀번호바꾸기
					
					
								
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	         }
	         else {
	             n = 2;
	         }
	         
	         req.setAttribute("n", n);
	         
	      }
		   
	      return "popup/pwFind2";
	   }
	   
	   
	   @RequestMapping(value = "/pwFind3.tp", method = RequestMethod.GET)
	   public String pwChange(HttpServletRequest req) {
	      
		  // 1. 폼에서 입력한 값을 받아오기
		  String newpw = req.getParameter("newpw");
		  String userid = req.getParameter("userid");
		
		  
		  if(newpw != null)
		  {
		      HashMap<String,String> map = new HashMap<String,String>();
		
		  
		      map.put("newpw", newpw);
		      map.put("userid", userid);
				
				
				// 3. Service 단으로 위에서 생성한 HashMap을 인자(파라미터)값으로 넘긴다.
		      service.pwChange(map);
		      return "pwFind2";
		  }
		  
		  req.setAttribute("userid", userid);
	   		
	      return "popup/pwFind3";
	   }
	   
	   @RequestMapping(value = "/adminme.tp", method = RequestMethod.GET)  // 관리자 회원 화면
		public String adminme(HttpServletRequest req) {
			
		   
		   	String colName = req.getParameter("colName");
			String searchWord = req.getParameter("searchWord");
			
			
			// $1
			int start = 1;
			int end = 10; 
		
			
			if(searchWord != null) {
				searchWord = searchWord.trim();
			}
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("colName", colName);
			map.put("searchWord", searchWord);
		
			//$2
			map.put("start", String.valueOf(start));
			map.put("end",String.valueOf(end));
			

			
			List<MemberVO> mlst = service.adminme(map);
			// **** 검색조건 컬럼명 및 검색어 입력데이터를 testdb.xml 쪽으로 넘겨주는 방법은
			//		즉, myBatis 쪽으로 넘겨야할 파라미터가 2개이상 여러개 이라면
			//		HashMap 으로 넘기면 된다.
			//	!!!! 중요 !!!!
			//	testdb.xml 에서 SQL구문 작성시 컬럼명이나 테이블명으로 사용되어지는 파라미터값은 ${key명} 이고,
			//	검색해야할 데이터 값으로 사용되어지느 파라미터 값은 #{key명}이다.
			
			req.setAttribute("mlst", mlst);
			int totalCount = service.totalMember();
			//$4
			req.setAttribute("start", start	);
			req.setAttribute("end", end);	
			req.setAttribute("totalCount", totalCount);
			
			if(colName != null && searchWord != null) {
				req.setAttribute("colName", colName);
				req.setAttribute("searchWord", searchWord);					
			}		   
	
		/*	List<MemberVO> mlist = service.adminme();
			req.setAttribute("mlist", mlist);
			*/
			return "admin/yj_memedit";
		}

	   // $6 회원 페이징
	   @RequestMapping(value = "/adminmepaging.tp", method = RequestMethod.GET)  // 관리자 회원 화면
		public String adminmepaging(HttpServletRequest req) {
			
		  // System.out.println("여기까진 오냐");
		   	String colName = req.getParameter("colName");
			String searchWord = req.getParameter("searchWord");
			String start = req.getParameter("start");
			String end = req.getParameter("end");
			
			
			if(searchWord != null) {
				searchWord = searchWord.trim();
			}
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("colName", colName);
			map.put("searchWord", searchWord);
		
			//$2
			map.put("start", String.valueOf(start));
			map.put("end",String.valueOf(end));
			

			
			List<MemberVO> mlst = service.adminme(map);
			// **** 검색조건 컬럼명 및 검색어 입력데이터를 testdb.xml 쪽으로 넘겨주는 방법은
			//		즉, myBatis 쪽으로 넘겨야할 파라미터가 2개이상 여러개 이라면
			//		HashMap 으로 넘기면 된다.
			//	!!!! 중요 !!!!
			//	testdb.xml 에서 SQL구문 작성시 컬럼명이나 테이블명으로 사용되어지는 파라미터값은 ${key명} 이고,
			//	검색해야할 데이터 값으로 사용되어지느 파라미터 값은 #{key명}이다.
			
			int totalCount = service.totalMember();
			
			req.setAttribute("mlst", mlst);
			req.setAttribute("totalCount", totalCount);
			//$4
			req.setAttribute("start", start	);
			req.setAttribute("end", end);	
			
			if(colName != null && searchWord != null) {
				req.setAttribute("colName", colName);
				req.setAttribute("searchWord", searchWord);					
			}		   
	
		/*	List<MemberVO> mlist = service.adminme();
			req.setAttribute("mlist", mlist);
			*/
			return "admin/adminmepaging";
		}
	   
	   @RequestMapping(value = "/updatemember.tp", method = RequestMethod.GET)  // 관리자 회원 화면
		public void updatemember(HttpServletRequest req) {
			
		   
		   	String userid = req.getParameter("userid");
		   	String active = req.getParameter("active");
			
		   	
		   	HashMap<String,String> map = new HashMap<String, String>();
		   	
		   	map.put("userid", userid);
		   	map.put("active", active);
		   	
			service.updatemember(map);

		}
				
}
