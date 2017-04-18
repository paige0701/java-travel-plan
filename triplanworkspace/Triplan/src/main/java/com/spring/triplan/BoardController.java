package com.spring.triplan;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.spring.common.FileManager;
import com.spring.triplan.BoardDAO;
import com.spring.model.BoardVO;
import com.spring.model.CommentVO;
import com.spring.model.MemberVO;

// #8.컨트롤러 선언
@Controller("BoardController")
public class BoardController {

	// #11-2. DAO 의존 객체(Dependency Injection) 생성 주입 
		@Autowired
		BoardDAO dao;
		
	// #111. 파일업로드 및 다운로드를 해주는 FileManager 클래스 의존객체 생성 주입하기 
		@Autowired
		FileManager fileManager;
		
		
	// #12. 글쓰기 페이지 요청. 
	// 지금은 특별히 구현해야할 업무는 없고 JSP 페이지만 요청한다.
		@RequestMapping(value="/boardAdd.tp", method={RequestMethod.GET})  
//		public String add() {
			
	// #99.	답변글쓰기가 존재하므로 위의 public String add() { 을 
	//      주석처리하고서 아래와 같이 한다.
		public String add(HttpServletRequest req, HttpSession session) {	
			
			MemberVO loginUser = (MemberVO)session.getAttribute("member");
			
			if(loginUser==null || loginUser.getUserid().isEmpty() ) 
			{
				req.setAttribute("loc", "javascript:history.back()");
				req.setAttribute("msg", "로그인 후 도움말을 이용하십시오");
				
				return "msg";
			}
			
		// #99. 계속
			String fk_seq = req.getParameter("fk_seq");
			String groupno = req.getParameter("groupno");
			String depthno = req.getParameter("depthno");
			
			req.setAttribute("fk_seq", fk_seq);
			req.setAttribute("groupno", groupno);
			req.setAttribute("depthno", depthno);
			
			return "board/boardAdd"; 
			// Board/src/main/webapp/WEB-INF/views/add.jsp 파일을 생성한다.
		}
	
		
	// #13.글쓰기   VO를 매개변수로 해서 전송된 글쓰기 데이터 받아오기
		@RequestMapping(value="/boardAddEnd.tp", method={RequestMethod.POST}) 
//		public String addEnd(BoardVO vo) {
			
		// #101. 답변글쓰기 인지 아니면 원글(새글)쓰기인지 구분을 지어야한다.
		//      먼저 위의 	public String addEnd(BoardVO vo) { 
		//    	을 주석처리 한 이후에 아래와 같이 하도록 한다.
//		public String addEnd(BoardVO vo, HttpServletRequest req) {
		
		// #115. 파일첨부가 된 글쓰기 이므로 
		//       먼저 위의 public String addEnd(BoardVO vo, HttpServletRequest req) { 을 
		//       주석 처리 한 이후에 아래와 같이 한다.
		public String addEnd(BoardVO vo, MultipartHttpServletRequest req, HttpSession session) {
		
			
		// #101. 계속하기
			String fk_seq = null;
			String groupno = null;
			String depthno = null;
			
			if( (req.getParameter("fk_seq")==null || req.getParameter("fk_seq").trim().isEmpty()) &&
				(req.getParameter("groupno")==null || req.getParameter("groupno").trim().isEmpty()) &&	
				(req.getParameter("depthno")==null || req.getParameter("depthno").trim().isEmpty()) )
			{ // 답변글이 아닌 원글(새글)쓰기 이라면
				groupno = dao.getGroupno(); 
				// tblBoard 테이블상의 groupno 컬럼의 최대값에 +1 한값을 
				// groupno 로 설정한다.
			}
			else { // 답변글 쓰기 이라면
				// 넘겨받은 원글(부모글)의 depthno 값에다가 +1 증가한 값으로 
				// depthno 를 만들어서 DB로 보내야 한다.
				fk_seq = req.getParameter("fk_seq");
				groupno = req.getParameter("groupno");
				depthno = req.getParameter("depthno");
				
				int depthnoInt = Integer.parseInt(depthno);
				depthnoInt++;
				
				depthno = String.valueOf(depthnoInt);
			}
			
			vo.setFk_seq(fk_seq);
			vo.setGroupno(groupno);
			vo.setDepthno(depthno);
			
		//	#116. 사용자가 쓴 글에 파일이 첨부가 된것인지 
		//        아니면 파일첨부가 안된 것이지 구분을 지어주어야 한다.
			
			// *** 첨부파일이 있는지? ***
			if(!vo.getAttach().isEmpty()) {
				// 1. 사용자가 보낸 파일을 웹서버의 특정 폴더에 저장해주어야 한다.
				// 파일이 업로드 되어질 특정 경로(폴더)지정해주기
				// 우리는 웹서버의 webapp/files 라는 폴더로 지정해준다.
				
				// 웹서버의 webapp 의 절대경로를 알아온다.
				String root = session.getServletContext().getRealPath("/");
				String path = root + "files"; 
				// path 가 첨부파일들을 저장할 웹서버의 폴더가 된다.
				
				System.out.println("확인용=> 첨부파일들을 저장할 웹서버의 폴더명 : " + path);
				// 확인용=> 첨부파일들을 저장할 웹서버의 폴더명 : C:\springworkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\files 
				
				
				// 2. 파일첨부를 위한 변수의 설정 및 값의 초기화한 후 파일올리기 
				String newFileName = ""; // 웹서버 디스크에 저장할 파일명
				byte[] bytes = null;     // 첨부파일을 서버에 저장할때 사용되는 용도
				long fileSize = 0;       // 파일크기를 읽어오기 위한 용도
				
				try {
					bytes = vo.getAttach().getBytes();
					
					newFileName = fileManager.doFileUpload(bytes, vo.getAttach().getOriginalFilename() , path); 
					// 2-1. 첨부한 파일이  강아지.png 이라면 
					//    이파일을 웹서버 하드디스크에 저장시키기 위해
					//    byte[] 타입으로 변경해서 받아들인다.
					
					// 2-2. 첨부한 파일의 확장자명을 알려고 아래와 같이 한다.  
					//    vo.getAttach().getOriginalFilename() 은 
					//    첨부파일의 파일이름을 말한다.
					//    예를 들어, 강아지.png 를 첨부파일로 올리면 
					//    vo.getAttach().getOriginalFilename() 이 
					//    String 타입으로 "강아지.png" 를 얻어오는 것이다.
					//    fileManager.doFileUpload() 메소드에서 . 을 기준으로 
					//    그나머지 글자만 취해오도록 되어있다.
					//    즉 .png 라는 확장자만 얻어온다.
					
					// 2-3. 세번째 파라미터인 path 값에 대한 경로에 파일을 올린다.
				   
					// 2-4. 파일을 업로드 한 이후에 시간으로 설정된 새로운 파일명을 
					//      리턴받아온다. 그 리턴된 파일명이 newFileName 이다. 
					
			// 3. vo 에 fileName 값과 orgFileName 값과 fileSize 값을 넣어주기
					
				  fileSize = vo.getAttach().getSize(); // 첨부한 파일의 파일크기인데 리턴타입이 long 타입이다.
					             
				  vo.setFileName(newFileName);	// 웹서버 디스크에 저장될 파일명(201606093776543535325235325546256.png) 
				  vo.setOrgFileName(vo.getAttach().getOriginalFilename()); // 진짜 파일명(강아지.png) // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명 
				  vo.setFileSize(String.valueOf(fileSize));	// 첨부한 파일의 크기를 String 타입으로 변경해서 저장함.
					
				} catch (Exception e) {
					
				}
				
			}
			
	  //#117. 파일 첨부가 없는 DAO 호출
		if(vo.getAttach().isEmpty()) {	
			dao.add(vo);
		}
			
	  //#118. 파일 첨부가 있는 DAO 호출
		if(!vo.getAttach().isEmpty()) {
			dao.add_withFile(vo);
		}
			
			return "board/boardAddEnd";
			// Board/src/main/webapp/WEB-INF/views/addEnd.jsp 파일을 생성한다.
		}
	
		
	// #16.글목록 보기 페이지 요청
		@RequestMapping(value="/boardList.tp", method={RequestMethod.GET}) 
		public String list(HttpServletRequest req, HttpSession session) {
			
			MemberVO loginUser = (MemberVO)session.getAttribute("member");
			
			if(loginUser==null || loginUser.getUserid().isEmpty())
			{
				req.setAttribute("loc", "javascript:history.back()");
				req.setAttribute("msg", "로그인 후 도움말을 이용하십시오");
				
				return "msg";
			}
			
			// #78. 페이징 처리하기
			// 글목록 보기 페이지 요청을 하는 URL의 형태는 아래처럼 2가지 형태를 띈다.
			// 첫번째, list.action 이고
			// 두번째, list.action?pageNo=조회하고자하는페이지번호숫자  이다.
			
			String pageNo = req.getParameter("pageNo");
			
			int totalCount = 0;        // 총 게시글 건수
			int sizePerPage = 8;       // 한 페이지당 보여줄 게시글 건수
			int currentShowPageNo = 1; // 현재 보여주는 페이지 번호로서 초기치로는 1페이지로 설정함. 
			int totalPage = 0;         // 총 페이지 수(웹 브라우저상에 보여줄 총 페이지갯수)
			
			int start = 0; // 시작 행번호
			int end = 0;   // 끝 행번호
			int startPageNo = 0;  // 페이지바에서 시작될 페이지번호
                                  // "페이지바"란 ? 
			                      // 이전5페이지 [1][2][3][4][5] 다음5페이지
			                      // 이전5페이지[6][7][8][9][10] 다음5페이지
			                      // 와 같이 [1][2][3][4][5] 또는 [6][7][8][9][10] 을 
			                      // "페이지바" 라고 부른다.
			
			int loop = 0; // startPageNo 값이 증가할때 마다 1씩 증가하는 증가치용도.
			int blocksize = 5; // "페이지바" 에 보여줄 페이지의 갯수
			
			if(pageNo == null) {
				// 게시판 초기화면에 보여지는 것은 
				// req.getParameter("pageNo"); 값이 없으므로
				// pageNo 은 null 이 된다.
				// 왜냐하면 맨처음 띄워주는 초기페이지에서는 
				// 사용자가 마우스로 몇번 페이지를 볼것인지 클릭을 안하기 때문이다.
				
				currentShowPageNo = 1; // 즉, list.action 은 list.action?pageNo=1 로 하겠다는 말이다. 
			} 
			else {
				currentShowPageNo = Integer.parseInt(pageNo);
				// GET 방식으로 파라미터 pageNo 에 넘어온 값을 현재 보여주고자 하는 페이지로 설정함.
			}
			
			// ***** 가져올 게시글의 범위는 공식임!!!! ******
			//  (오라클의 select 절에서 row_number() 함수를 사용한 결과를 사용할 것임.)
			
			/*
			      currentShowPageNo     row_number() 
			                            start   end
			            1 page ==>        1      5
			            2 page ==>        6      10
			            3 page ==>        11     15
			            4 page ==>        16     20
			            5 page ==>        21     25
			            6 page ==>        26     30
			            7 page ==>        31     35
			            8 page ==>        36     40
			 */
			  start = ((currentShowPageNo - 1) * sizePerPage) + 1;
			  end = start + sizePerPage - 1;
			
			  
			  
			// #54. 글목록 보기 페이지 내에서 
			//      제목, 내용, 이름 중에 한가지를 선택해서 검색을 한 경우
			// 검색대상 컬럼명과 검색어를 받아오기
			String column = req.getParameter("column");
			String search = req.getParameter("search");
			if(search != null) {
				search = search.trim();	
			}
			
			// #31. 글 조회수 증가를 위한 세션값 추가하기
			session.setAttribute("readCountCheck", "no"); 
			// session 에 "readCountCheck" 키값으로  저장된 밸류값은 "no" 이다.
			// session 에 "readCountCheck" 키값에 해당하는 밸류값이 "no"라고 얻으려면 
			// 반드시 웹브라우저 주소창에 "/list.action" 라고 입력해야만 얻어올수 있다.
			
			
			// #17. DAO에게로 글목록을 가져오게끔 요청한다.
//			List<BoardVO> list = dao.list();
			
			// #55. 위의 #17. DAO에게로 글목록을 가져오게끔 요청한다. 
			//      부분을 먼저 주석처리하고서 아래와 같이 한다.
//			List<BoardVO> list = dao.list(column, search);
			
			
			// #79. 위의 #55 부분을 먼저 주석처리하고서 아래와 같이 한다.
			List<BoardVO> list = dao.list(column, search, start, end);
			
			
			
			// DAO로 부터 넘겨받은 데이터중 글제목이 너무 길면 일정크기만큼만 잘라서
			// request 영역에 저장시켜주도록 한다.
			for(BoardVO vo : list) {
				// #76. 해당 게시물의 글제목을 보여줄때 댓글수가 1 개 이상 달려있다라면 
				//      글제목 뒤에 [댓글갯수]를 붙여준다.
				int commentCount = Integer.parseInt(vo.getCommentCount()); 
				                                    // 댓글갯수

				String subject = vo.getSubject(); // 글제목을 가져오는 것
				
				/*
				  if(subject.length() > 20) {
					subject	= subject.substring(0, 17)+"..."; 
					vo.setSubject(subject);
				}
				*/
				
				// #77. 위의 if문을 주석처리한 후 아래와 같이 한다.
				//      해당 게시물의 글제목을 보여줄때 댓글수가 1 개 이상 달려있다라면 
				//      글제목 뒤에 [댓글갯수]를 붙여준다.
				if(commentCount > 0) { // 해당 게시물에 댓글이 있는 경우이라면 
					if(subject.length() > 20) {
						subject	= subject.substring(0, 13)+"..."+"<span style='color:red; font-weight:bold; font-style:italic; font-size:smaller; vertical-align:super;'>["+vo.getCommentCount()+"]</span>";          
						vo.setSubject(subject);
					} 
					else {
						subject	= subject+"<span style='color:red; font-weight:bold; font-style:italic; font-size:smaller; vertical-align:super;'>["+vo.getCommentCount()+"]</span>"; 
						vo.setSubject(subject);
					}
				}
				else { // 해당 게시물에 댓글이 없는 경우이라면
					if(subject.length() > 20) {
						subject	= subject.substring(0, 17)+"..."; 
						vo.setSubject(subject);
					}
				}
				
			}// end of for----------------------
			
			
		// #83. 페이징 작업의 계속(총 페이지수 계산하기)
		//      -- 총 게시물 건수(tblBoard 테이블에 저장된 총 행의 갯수)
//			totalCount = dao.getTotalCount();
		    // 만약에  totalCount 값이 52개 이라면
			// 만들어야 할 총 페이지수는  52 / 5 ==> 몫은 10, 나머지가 2 이므로 
			// 그러므로 총 페이지수는 11 페이지 이어야 한다.
//			totalPage = (int)Math.ceil( (double)totalCount / sizePerPage );
	
			
		// #90. 총 페이지수 계산하기(검색까지 포함한것)
		//      먼저 위의  	#83. 페이징 작업의 계속(총 페이지수 계산하기)을 
		//	       주석처리 한 후에 아래와 같이 한다.
		//    1. 총 페이지수 계산은 검색조건이 없을 때와
		//    2. 총 페이지수 계산은 검색조건이 있을 때로 나뉘어진다.
		
		if(column==null || search==null) {
			// 총 페이지수 계산은 검색조건이 없을 때
			totalCount = dao.getTotalCount(); // 검색조건이 없는 총 게시글 건수 알아오기
		}
		else {
			// 총 페이지수 계산은 검색조건이 있을 때
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("column", column);
			map.put("search", search);
			
			totalCount = dao.getSearchCount(map); // 검색조건이 있는 총 게시글 건수 알아오기
		}
		
		totalPage = (int)Math.ceil( (double)totalCount / sizePerPage );
		
		
			
			
		// #86. 페이지바 작업
			String pagebar = "";
			
			pagebar += "<ul>";
		
		// 현재 우리는 blocksize 를 5로 설정했으므로		
		// 아래와 같은 페이지 번호를 만들어야 한다.
		// 이전5페이지 [1][2][3][4][5] 다음5페이지
        // 이전5페이지[6][7][8][9][10] 다음5페이지
		// 이전5페이지[11] 다음5페이지	
		// 페이지 번호는 1씩 증가하므로 페이지번호를 증가시켜주는 
		// 반복변수가 필요하다. 이것은 위에서 선언한 loop 를 사용한다.
		// 이때 loop 는 blocksize 의 크기보다 크면 안된다.	
		
			loop = 1;
			
 // *******!! startPageNo(페이지바의 시작 페이지 번호)값 만들기 -- 공식임 !! ***** //
			startPageNo = ((currentShowPageNo - 1)/blocksize)*blocksize + 1;
		// 예 : 현재 우리는 	blocksize 를 위에서 5로 설정했다.
		// 	     여기서  
		//     조회하고자 하는 currentShowPageNo 가 3페이지 이라면
		//         startPageNo = ((3 - 1)/5)*5 + 1; ==> 1
		//     조회하고자 하는 currentShowPageNo 가 5페이지 이라면
		//	       startPageNo = ((5 - 1)/5)*5 + 1; ==> 1
		//     조회하고자 하는 currentShowPageNo 가 7페이지 이라면
		//	       startPageNo = ((7 - 1)/5)*5 + 1; ==> 6
        //	     조회하고자 하는 currentShowPageNo 가 10페이지 이라면
		//	       startPageNo = ((10 - 1)/5)*5 + 1; ==> 6
        //	     조회하고자 하는 currentShowPageNo 가 11페이지 이라면
		//	       startPageNo = ((11 - 1)/5)*5 + 1; ==> 11	
		
	    // 그리고  startPageNo 의 값은 1씩 증가를 할 것인데
		// startPageNo 의 값은 totalPage 의 값보다 크면 안된다.	
		
			
		//#89. 이전 5페이지 만들기
		if(startPageNo == 1) {
			// 첫번째 페이지바에 도달한 경우
			pagebar += String.format(" [이전%d페이지] ", blocksize);
		}
		else{
			// 첫번째 페이지바가 아닌 페이지바에 도달한 경우
	//		pagebar += String.format(" <a href='/board/list.action?pageNo=%d'>[이전%d페이지]</a> ",startPageNo-1, blocksize); 
			
			// #95. 바로 위의 pagebar += ...부분을 주석처리 하고서 아래와 같이 한다.
			if(column==null || search==null) { // 검색조건이 없는 모든 페이지를 조회할 경우
				pagebar += String.format(" <a href='/triplan/boardList.tp?pageNo=%d'>[이전%d페이지]</a> ",startPageNo-1, blocksize); 
			}
			else { // 검색조건이 있는 페이지를 조회할 경우
				pagebar += String.format(" <a href='/triplan/boardList.tp?pageNo=%d&column=%s&search=%s'>[이전%d페이지]</a> ",startPageNo-1, column, search, blocksize);
			}
		}	
			
		
		// #86. 페이지바 작업의 연속임	
		while( !(loop > blocksize || 
			     startPageNo > totalPage) )	{
			
			if(startPageNo == currentShowPageNo) {
				pagebar += String.format("<span style='color:red; font-weight:bold; text-decoration:underline; '>%d</span>",startPageNo);
			}
			else{
		//		pagebar += String.format(" <a href='/board/list.action?pageNo=%d'>%d</a> ",startPageNo ,startPageNo); 
			
			// #93. 바로 위의 pagebar += ...부분을 주석처리 하고서 아래와 같이 한다. 
				if(column==null || search==null) { // 검색조건이 없는 모든 페이지를 조회할 경우
					pagebar += String.format(" <a href='/triplan/boardList.tp?pageNo=%d'>%d</a> ",startPageNo ,startPageNo);
				}
				else { // 검색조건이 있는 페이지를 조회할 경우
					pagebar += String.format(" <a href='/triplan/boardList.tp?pageNo=%d&column=%s&search=%s'>%d</a> ",startPageNo, column, search, startPageNo);
				}
			}
			
			loop++;
			startPageNo++;
		}
		
		//#88. 다음 5페이지 만들기
		if(startPageNo > totalPage) {
			// 마지막 페이지바에 도달한 경우
			pagebar += String.format(" [다음%d페이지] ", blocksize);
		}
		else{
			// 마지막 페이지바가 아닌 페이지바에 도달한 경우
	//		pagebar += String.format(" <a href='/board/list.action?pageNo=%d'>[다음%d페이지]</a> ",startPageNo, blocksize);
		
		// #94. 바로 위의 pagebar += ...부분을 주석처리 하고서 아래와 같이 한다. 
			if(column==null || search==null) { // 검색조건이 없는 모든 페이지를 조회할 경우
				pagebar += String.format(" <a href='/triplan/boardList.tp?pageNo=%d'>[다음%d페이지]</a> ",startPageNo, blocksize);
			}
			else { // 검색조건이 있는 페이지를 조회할 경우
				pagebar += String.format(" <a href='/triplan/boardList.tp?pageNo=%d&column=%s&search=%s'>[다음%d페이지]</a> ",startPageNo, column, search, blocksize);
			}
			
		}
		
		pagebar += "</ul>";
		
		req.setAttribute("pagebar", pagebar);
		
			
			
			// #20. DAO로 부터 받은 글목록을 request 영역에 저장시킨다.
			req.setAttribute("list", list);
			
			// #59. 글목록을 볼때 검색에 따른 조회이라면
			//      아래의 view 단 페이지인 list.jsp 파일에
			//      검색컬럼 및 검색어가 그대로 유지되게끔 해주어야 한다.
			if(column != null && search != null) {
				req.setAttribute("column", column);
				req.setAttribute("search", search);
			}
			
			
			return "board/boardList";
			// Board/src/main/webapp/WEB-INF/views/list.jsp 파일을 생성한다.
		}
		
		// #23. 글1개를 보여주는 페이지 요청하기
		@RequestMapping(value="/boardView.tp", method={RequestMethod.GET})
		public String view(HttpServletRequest req, HttpSession session) {
			
			MemberVO loginUser = (MemberVO)session.getAttribute("member");
			String userid = null;
			if(loginUser != null)
			{
				userid = loginUser.getUserid();
			}
			
			// #24. 글번호 가져오기
			String seq = req.getParameter("seq");
			
			
			//#32. 웹브라우저 주소창에 /view.action 을 새로고침(F5)을 할때
			//     조회수 증가가 되지 않도록 막아주기 
			if(session.getAttribute("readCountCheck") != null &&
				(session.getAttribute("readCountCheck")).equals("no")	) {
				
			// #28. 글조회수의 컬럼의 값을 증가시킨후 
			//      해당글 1개를 읽어오도록 요청해야 한다.
				dao.addReadCount(seq);
				
				// #33. 세션에 "readCountCheck" 라는 키값으로 
				//      저장된 "no" 값을 "yes"로 바꾸어 저장시킨다.
				session.setAttribute("readCountCheck", "yes");
				
			}
			
			// #25. 해당글 1개 가져오도록  DAO 에게 요청하기
			BoardVO vo = dao.get(seq);
			
			
			// 글내용에 엔터("\r\n")가 있으면 
			// 엔터를 <br>로 대체시켜서 request 영역으로 넘긴다.
			String content = vo.getContent();
			content = content.replaceAll("\r\n", "<br/>");
			vo.setContent(content);
			
			
			req.setAttribute("vo", vo);
			req.setAttribute("userid", userid);
			
			// #70. 댓글 목록 가져오기
			List<CommentVO> commentList = dao.listComment(seq);
			req.setAttribute("commentList", commentList);
			
			return "board/boardView";
			// Board/src/main/webapp/WEB-INF/views/view.jsp 파일을 생성한다.
		}
		
		
		// #34. 글수정 페이지 요청
		@RequestMapping(value="/boardEdit.tp", method={RequestMethod.GET})
		public String edit(HttpServletRequest req) {
			
			
			
			// 수정해야 할 글번호 가져오기
			String seq = req.getParameter("seq");
			
			// 수정해야 할 1개의 글을 보여주기
			// 왜냐하면 수정하기전 원래 글을 보여준 다음에 수정에 들어가므로.
			BoardVO vo = dao.get(seq);
			
			// 가져온 글 1개를 request 영역에 저장시킨다.
			req.setAttribute("vo", vo);
			
			// view 단에서 1개 글을 보여주기
			return "board/boardEdit";
			// Board/src/main/webapp/WEB-INF/views/edit.jsp 파일을 생성한다.
			
		}
		
		
		// #35. 글수정 완료 요청
		@RequestMapping(value="/boardEditEnd.tp", method={RequestMethod.POST}) 
		public String editEnd(BoardVO vo, HttpServletRequest req, HttpSession session) {
			
			MemberVO loginUser = (MemberVO)session.getAttribute("member");
			String userid = null;
			if(loginUser != null && !(loginUser.getUserid().isEmpty()))
			{
				userid = loginUser.getUserid();
			}
			
			// 글수정을 하려면 원본글의 암호와 수정시 입력해주는 암호가
			// 일치할때만 수정이 가능하도록 해야 한다.
			// 그러면 최종적으로 xml(SQL문)에서 파라미터로 받아야 할 값은 
			// 글 수정시 where 절에 들어가야할 글번호(seq) 와 암호(pw)이다.
			// 즉, where to_char(seq) = '23' and pw = 'qwer' 이다.
			// 그러므로 위에서 받아온 파라미터 BoardVO vo 에서 
			// 글번호(seq) 와 암호(pw)를 끄집어 내어서 xml 쪽으로 넘겨주어야 한다.
			// 그러면 2개 이상의 값을 파라미터로 넘길때 HashMap 으로 만들어서 넘겨야 한다. 
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("seq", vo.getSeq());
			map.put("pw", vo.getPw());
			
			// #36. 해당 글번호에 대한 암호가 일치하는지 DAO에게 요청을 해서 알아온다.
			boolean result = dao.check(map);
			
			// #40. result 의 값이 true 이면 암호가 일치하므로
			//      글 수정(update)을 해줄것이고,
			//      result 의 값이 false 이면 암호가 일치하지 않으므로
			//      암호가 일치하지 않는다라는 메시지를 띄워주면 될것이다.
			if(result == true || userid.equals("admin")) {
				result = true;
				dao.edit(vo);
			}
			
			// #43. view단인 editEnd.jsp 페이지에서 
			//      글 수정이 성공했으면 "글수정성공" 이라는 메시지를 띄워줄것이고,
			//      암호가 일치하지 않아서 글 수정을 못한 경우이라면 
			//      "암호가 틀려서 글수정 실패" 이라는 메시지를 띄워주려고 한다.
			//      그러면 view단인 editEnd.jsp 페이지에서는 
			//      글 수정의 성공/실패 여부를 알아야만 하므로 
			//      그것을 알수 있도록 값을 넘겨주는데 그 값이 result 인 것이다.
	        //      result 가 true 이면 "글수정성공" 이고 false 이면 "글수정실패" 이다. 
			req.setAttribute("result", result); 
			req.setAttribute("seq", vo.getSeq()); 
			
			return "board/boardEditEnd";
			// Board/src/main/webapp/WEB-INF/views/editEnd.jsp 파일을 생성한다.
			
		}
		
	
	// #45. 글삭제 페이지 요청
	@RequestMapping(value="/boardDel.tp", method={RequestMethod.GET}) 
	public String del(HttpServletRequest req) {
		
		
		
		// 삭제해야할 글번호 받아오기
		String seq = req.getParameter("seq");
		
		req.setAttribute("seq", seq);

		return "board/boardDel";
		// Board/src/main/webapp/WEB-INF/views/del.jsp 파일을 생성한다.
	}
	
	
	// #46. 글삭제 완료 페이지 요청
	// 7월4일
	@RequestMapping(value="/boardDelEnd.tp", method={RequestMethod.POST})
	public String delEnd(HttpServletRequest req, HttpSession session) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("member");
		String userid = null;
		if(loginUser != null && !(loginUser.getUserid().isEmpty()))
		{
			userid = loginUser.getUserid();
		}
		
	 	String seq = req.getParameter("seq");
		String pw = req.getParameter("pw");
		
		// #47. 삭제해야할 글에 있어서 암호가 일치하는지 여부를 확인해야 한다.
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("seq", seq);
		map.put("pw", pw);
		
		boolean result =  dao.check(map);
		int groupno = dao.findGroupNo(seq);
		
		if(result == true || userid.equals("admin")) {
			// #48. 글 삭제하기를 한다.
			result = true;
			dao.del(groupno);
		}
		
		// #51. 암호가 맞는지 틀리는지에 따라서 view단에 보여줄 
		//      메시지가 달라지므로 request 영역에 result 값을
		//      넘겨서 판단하도록 한다.
		req.setAttribute("result", result);
		
		return "board/boardDelEnd";
		// Board/src/main/webapp/WEB-INF/views/delEnd.jsp 파일을 생성한다.
	}
	
	// 댓글 삭제 페이지 요청
	@RequestMapping(value="/boardCommentDel.tp", method={RequestMethod.GET}) 
	public String commentDel(HttpServletRequest req) {

		// 삭제해야할 댓글번호 받아오기
		String seq = req.getParameter("seq");
		String parentSeq = req.getParameter("parentSeq");
		
		req.setAttribute("seq", seq);
		req.setAttribute("parentSeq", parentSeq);

		return "board/boardCommentDel";
		// Board/src/main/webapp/WEB-INF/views/boardCommentDel.jsp 파일을 생성한다.
	}
	
	
	// 댓글 삭제 완료 페이지 요청
	@RequestMapping(value="/boardCommentDelEnd.tp", method={RequestMethod.POST})
	public String commentDelEnd(HttpServletRequest req, HttpSession session) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("member");
		String userid = null;
		if(loginUser != null && !(loginUser.getUserid().isEmpty()))
		{
			userid = loginUser.getUserid();
		}
		
	 	String seq = req.getParameter("seq");
	 	String parentSeq = req.getParameter("parentSeq");
		
		boolean result =  dao.checkComment(seq);
		
		if(result == true || userid.equals("admin")) {
			// 댓글 삭제하기를 한다.
			result = true;
			dao.delComment(seq);
			
			dao.downCommentCount(parentSeq);
			// 원게시물의 글번호에 해당하는 댓글수 컬럼(commentCount)의 값을 1감소 시키기
		}
		
		req.setAttribute("result", result);
		
		req.setAttribute("parentSeq", parentSeq);
		
		return "board/boardCommentDelEnd";
		// Board/src/main/webapp/WEB-INF/views/boardCommentDelEnd.jsp 파일을 생성한다.
	}
	
	
	// #63. 댓글쓰기
	@RequestMapping(value="/boardAddComment.tp", method={RequestMethod.POST})
	public String addComment(CommentVO vo, HttpServletRequest req, HttpSession session) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("member");
		
		if(loginUser==null || loginUser.getUserid().isEmpty())
		{
			req.setAttribute("loc", "javascript:history.back()");
			req.setAttribute("msg", "로그인 후 도움말을 이용하십시오");
			
			return "msg";
		}
		
		// DAO에게 댓글쓰기 작업 호출하기 및 
		// 댓글쓰기를 성공하면 원게시물의 
		// 댓글수 컬럼(commentCount)의 값을 1 증가시키기.
		// 이작업을 하기 위해서는 먼저, 
		// 원게시물(테이블명 tblBoard) 테이블에 댓글수를 알려주는 컬럼이 
		// 있어야 한다. 그래서 오라클에서 아래와 같은 작업을 해준다.
		
		/* === 오라클에서 해야하는 작업 ===
		   alter table tblBoard
           add commentCount number default 0 not null; 
		*/
		
		
		int result = dao.addComment(vo);
		
		if(result != 0) { // 댓글 글쓰기가 성공했다라면
			dao.editCommentCount(vo.getParentSeq());
			// 원게시물의 글번호에 해당하는 댓글수 컬럼(commentCount)의 값을 1증가 시키기
		}
		
		req.setAttribute("vo", vo);
		
		return "board/boardAddCommentEnd";
		// Board/src/main/webapp/WEB-INF/views/addCommentEnd.jsp 파일을 생성한다.
	}
	
	// #127. 첨부파일 다운로드 받기
	@RequestMapping(value="/boardDownload.tp", method={RequestMethod.GET})
	public void download(HttpServletRequest req, HttpSession session, HttpServletResponse res) {
		
		String seq = req.getParameter("seq"); // 첨부파일이 있는 글번호
		
		// 첨부파일이 있는 글번호에서 
		// 2016060915111722619749993434.png 처럼 
		// 이러한 fileName 값을 DB 에서 가져와야 한다.
		BoardVO vo = dao.get(seq);
		
		String fileName = vo.getFileName(); 
		// 2016060915111722619749993434.png 처럼 웹서버 디스크에 저장된 파일명
		
		String orgFileName = vo.getOrgFileName();
		// k5_1.png 처럼 다운받을 사용자에게 보여줄 파일명
		
		// 첨부파일이 저장되어 있는 웹서버의 하드디스크 경로명을
		// 알아와야만 다운로드를 해줄수 있다.
		// 이 경로는 우리가 파일 첨부를 위해서 /addEnd.action 에서
		// 설정해 두었던 경로를 똑같이 알아오면 된다.
		String root = session.getServletContext().getRealPath("/");
		String path = root + "files"; 
		
		// *** 다운로드 하기 ***
		// 다운로드 성공,실패 여부를 알도록 하는 boolean 타입 변수 flag 선언한다.
		boolean flag = false;
		
		flag = fileManager.doFileDownload(fileName, orgFileName, path, res);
		// 다운로드가 성공이면 true 를 반납해주고,
		// 다운로드가 실패이면 false 를 반납해준다.
		
		if(!flag) {// 다운로드가 실패이라면 파일다운이 실패라는 메시지를 띄운다.
			
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = null;
			
			try {
				writer = res.getWriter();
				// 웹브라우저상에 메시지를 쓰기 위한 객체생성
			} catch (IOException e) {
				
			}  
			
			writer.println("<script type='text/javascript'>alert('파일 다운로드가 불가능합니다.!!')</script>"); 

		}
		
	}// end of download(HttpServletRequest req, HttpSession session, HttpServletResponse res)---------
	
	
	// #136. Ajax(검색어 입력시 검색단어 자동완성하기)관련 
	@RequestMapping(value="/boardWordSearchShow.tp", method={RequestMethod.POST})
	public String wordSearchShow(HttpServletRequest req) {
		
		List<String> allList = null;
		
		String column = req.getParameter("column");
		
		if("subject".equals(column)) {
			allList = dao.getAllSubject();
		}
		else if("content".equals(column)) {
			allList = dao.getAllContent();
		}
		else if("name".equals(column)) {
			allList = dao.getAllName();
		}
		
		String search = req.getParameter("search");
		
		List<String> resultList = new ArrayList<String>(); 
		
		if(search != null && !search.trim().isEmpty() ) {
			// 검색어가 영문일 경우 board.xml 에서 
			// select 시 lower() 함수를 사용하여 소문자로 변경했으므로
			// 여기서 검색어 또한 소문자로 변경해주어야 한다.
			search = search.toLowerCase();
			
		    // 다음으로는 DB에서 가져온 정보가 저장된
			// List<BoardVO> allList 에서 검색어 search로
			// 시작하는 단어들만 뽑아서 보여주도록 해야 한다.
			// 그러기 위해서 검색어 search로 시작하는 단어들만 뽑아서
			// List<String> resultList 라는 객체변수에 저장하도록 
			// 위에서 선언해두었다.
			
			for(String word : allList) {

				if(word.startsWith(search)) {
					resultList.add(word);
				}
				
			}// end of for---------------------
			
		}// end of if---------------------------
		
		req.setAttribute("resultList", resultList);
		
		return "board/boardWordSearchShowEnd";
		// Board/src/main/webapp/WEB-INF/views/wordSearchShowEnd.jsp 파일을 생성한다.
		
	}// end of wordSearchShow()--------------------
	
	
	// ===== #148. Ajax(JSON 을 사용하여 조회수 랭킹 보여주기 4) ======= //
	@RequestMapping(value = "/boardListRankN.tp", method = { RequestMethod.GET } )
	public String listRankN(HttpServletRequest req) {
		
			String rankN = req.getParameter("rankN");
			
			System.out.println("rankN 확인용: " + rankN); //확인용
			
			List<JSONObject> jsonObjList = new ArrayList<JSONObject>();
			
			if("0".equals(rankN)) {
				req.setAttribute("jsonObjList", null);
			}
			else if(!"0".equals(rankN)) {
				
				List<BoardVO> rankNList = dao.getRankN(rankN);
				
				for(BoardVO vo : rankNList) {
					// seq, name, subject, readCount, regDate
					
					JSONObject jsonObj = new JSONObject();
					// DB에서 select 해온 결과값인 vo를 JSON 형태로 저장하기 위해서 JSONObject 타입의 객체를 생성함
					
					// 다음으로 vo의 각 property 밸류 값을 key값으로 매핑하여 JSONObject 타입의 객체에 저장시킨다.
					jsonObj.put("seq", vo.getSeq());              
					jsonObj.put("name", vo.getUserid());
					jsonObj.put("subject", vo.getSubject());
					jsonObj.put("readCount", vo.getReadCount());
					jsonObj.put("regDate", vo.getRegDate());
					
					// List<JSONObject> 타입을 되어진 List에 차례로 저장시킨다. 
					jsonObjList.add(jsonObj);
					
				}// end of for--------------------------------------
				
				System.out.println(jsonObjList);  // 확인용
				/*
				 rankN 확인용: 5
			     [{"subject":"팔경규입니다.","name":"팔경규","regDate":"2016-06-08 13:45:43","readCount":"9","seq":"26"}, {"subject":"하하가 올립니다.(파일첨부함)","name":"하하","regDate":"2016-06-09 15:11:17","readCount":"6","seq":"58"}, {"subject":"칠경규입니다.","name":"칠경규","regDate":"2016-06-08 13:45:43","readCount":"6","seq":"25"}, {"subject":"구경규입니다.","name":"구경규","regDate":"2016-06-08 13:45:43","readCount":"4","seq":"27"}, {"subject":"반가워요~~안녕","name":"이순신","regDate":"2016-06-09 11:19:49","readCount":"3","seq":"51"}]

                 rankN 확인용: 10
                 [{"subject":"팔경규입니다.","name":"팔경규","regDate":"2016-06-08 13:45:43","readCount":"9","seq":"26"}, {"subject":"하하가 올립니다.(파일첨부함)","name":"하하","regDate":"2016-06-09 15:11:17","readCount":"6","seq":"58"}, {"subject":"칠경규입니다.","name":"칠경규","regDate":"2016-06-08 13:45:43","readCount":"6","seq":"25"}, {"subject":"구경규입니다.","name":"구경규","regDate":"2016-06-08 13:45:43","readCount":"4","seq":"27"}, {"subject":"반가워요~~안녕","name":"이순신","regDate":"2016-06-09 11:19:49","readCount":"3","seq":"51"}, {"subject":"오경규입니다.","name":"오경규","regDate":"2016-06-08 13:45:43","readCount":"3","seq":"23"}, {"subject":"육순신입니다.","name":"육순신","regDate":"2016-06-08 13:45:42","readCount":"2","seq":"15"}, {"subject":"오경규 오랜만이야","name":"이순신","regDate":"2016-06-09 12:13:04","readCount":"1","seq":"52"}, {"subject":"구경규의 답변글입니다.","name":"김영주","regDate":"2016-06-09 10:19:38","readCount":"1","seq":"48"}, {"subject":"안녕하세요? 동규입니다.","name":"강동규","regDate":"2016-06-09 10:11:53","readCount":"1","seq":"46"}]
 
				 */
				req.setAttribute("jsonObjList", jsonObjList);
			}
			
		 	return "board/boardListRankNEnd";
		 // Board/src/main/webapp/WEB-INF/views/listRankNEnd.jsp 파일을 생성한다.
		
	}// end of listRankN(HttpServletRequest req)--------------------------------
	
	// ----------------------------------  ADMIN ------------------------------------------------//
		// 처음 그냥 리스트 보여주기
			@RequestMapping(value = "/admin_paginglist.tp", method = { RequestMethod.GET } )
			public String admin_paginglist(HttpServletRequest req) {
		
				
				int totalCount = 0;      
				int start = Integer.parseInt(req.getParameter("start"));
				int end = Integer.parseInt(req.getParameter("end"));

				System.out.println("여기까진 오냐;;");
				System.out.println(start);
				System.out.println(end);
				totalCount = dao.getTotalCount();


				String column = null;
				String search = null;
				
				
				List<BoardVO> list = dao.list(column, search, start, end);
				
				System.out.println("11111111111111111111");
				/*
				  
				   총 게시글 : 45 개 / 10개씩 보여준다. 
				  start = 1 보다 작을 수 없고, end는 총 게시글 보다 클 수 없다.
				  
				  req.getParameter("previous"), req.getParameter("next") 둘다 null 이라면, 첫 페이지라는 뜻이니깐
				  start = 1
				  End   = 10 을 준다.
				  
				  previous 를  누르면 ("previous")와 start , end 를 같이 받고 , start 가 1이면 같은 것을 보여준다.
				  start 가 1이 아니면  End = (전)start-1 이 되고 (신)start는 End-9가 된다.
				  
				  next 를 누르면 ( "next" ) 와 start , end 를 같이 받고, 
				  (신)start = (전)end + 1 ,
				  (신) End  = (신)start + 9   
				   
				  start = 1  	end = 10
				  start = 11    end = 20
				  start = 21 	end = 30
				  start = 31    end = 40 
				
				*/
				
				req.setAttribute("start", start	);
				req.setAttribute("end", end);	
				req.setAttribute("totalCount", totalCount);
				
				for(BoardVO vo : list) {
					// #76. 해당 게시물의 글제목을 보여줄때 댓글수가 1 개 이상 달려있다라면 
					//      글제목 뒤에 [댓글갯수]를 붙여준다.
					int commentCount = Integer.parseInt(vo.getCommentCount()); 
					                                    // 댓글갯수

					String subject = vo.getSubject(); // 글제목을 가져오는 것
					
					/*
					  if(subject.length() > 20) {
						subject	= subject.substring(0, 17)+"..."; 
						vo.setSubject(subject);
					}
					*/
					
					// #77. 위의 if문을 주석처리한 후 아래와 같이 한다.
					//      해당 게시물의 글제목을 보여줄때 댓글수가 1 개 이상 달려있다라면 
					//      글제목 뒤에 [댓글갯수]를 붙여준다.
					if(commentCount > 0) { // 해당 게시물에 댓글이 있는 경우이라면 
						if(subject.length() > 20) {
							subject	= subject.substring(0, 13)+"..."+"<span style='color:red; font-weight:bold; font-style:italic; font-size:smaller; vertical-align:super;'>["+vo.getCommentCount()+"]</span>";          
							vo.setSubject(subject);
						} 
						else {
							subject	= subject+"<span style='color:red; font-weight:bold; font-style:italic; font-size:smaller; vertical-align:super;'>["+vo.getCommentCount()+"]</span>"; 
							vo.setSubject(subject);
						}
					}
					else { // 해당 게시물에 댓글이 없는 경우이라면
						if(subject.length() > 20) {
							subject	= subject.substring(0, 17)+"..."; 
							vo.setSubject(subject);
						}
					}
					
				}// end of for----------------------
				
			
				req.setAttribute("list", list);
				
				
				
				return "admin/board/admin_paginglist";
			}
		
		// 처음 그냥 리스트 보여주기
		@RequestMapping(value = "/admin_list.tp", method = { RequestMethod.GET } )
		public String admin_boardMain(HttpServletRequest req) {

		
			// List<BoardVO> list = dao.adminlist();
			
		   
			int start = 1;
			int end = 10; 
			String column = null;
			String search = null;
			
			List<BoardVO> list = dao.list(column, search, start, end);
		
			
				for(BoardVO vo : list) {
					// #76. 해당 게시물의 글제목을 보여줄때 댓글수가 1 개 이상 달려있다라면 
					//      글제목 뒤에 [댓글갯수]를 붙여준다.
					int commentCount = Integer.parseInt(vo.getCommentCount()); 
					                                    // 댓글갯수

					String subject = vo.getSubject(); // 글제목을 가져오는 것
					
					/*
					  if(subject.length() > 20) {
						subject	= subject.substring(0, 17)+"..."; 
						vo.setSubject(subject);
					}
					*/
					
					// #77. 위의 if문을 주석처리한 후 아래와 같이 한다.
					//      해당 게시물의 글제목을 보여줄때 댓글수가 1 개 이상 달려있다라면 
					//      글제목 뒤에 [댓글갯수]를 붙여준다.
					if(commentCount > 0) { // 해당 게시물에 댓글이 있는 경우이라면 
						if(subject.length() > 20) {
							subject	= subject.substring(0, 13)+"..."+"<span style='color:red; font-weight:bold; font-style:italic; font-size:smaller; vertical-align:super;'>["+vo.getCommentCount()+"]</span>";          
							vo.setSubject(subject);
						} 
						else {
							subject	= subject+"<span style='color:red; font-weight:bold; font-style:italic; font-size:smaller; vertical-align:super;'>["+vo.getCommentCount()+"]</span>"; 
							vo.setSubject(subject);
						}
					}
					else { // 해당 게시물에 댓글이 없는 경우이라면
						if(subject.length() > 20) {
							subject	= subject.substring(0, 17)+"..."; 
							vo.setSubject(subject);
						}
					}
					
				}// end of for----------------------
				
				int totalCount = dao.getTotalCount();
				req.setAttribute("totalCount", totalCount);
				req.setAttribute("start", start	);
				req.setAttribute("end", end);	
				req.setAttribute("list", list);
				
			return "admin/board/admin_list";
		}	
		
		
		// 글 하나 보여주기 
		@RequestMapping(value = "/admin_showone.tp", method = { RequestMethod.GET } )
		public String admin_showone(HttpServletRequest req,BoardVO vo) {

				String seq = req.getParameter("seq");
				
				
				vo = dao.adminshowone(seq);
				// 글내용에 엔터("\r\n")가 있으면 
				// 엔터를 <br>로 대체시켜서 request 영역으로 넘긴다.
				String content = vo.getContent();
				//System.out.println(content);
				content = content.replaceAll("\r\n", "<br/>");
				//System.out.println("--------------------------------------");
				//System.out.println(content);
				vo.setContent(content);
				

				// #70. 댓글 목록 가져오기
				List<CommentVO> commentList = dao.adminlistComment(seq);
				req.setAttribute("commentList", commentList);
				
				
				req.setAttribute("vo", vo);
				
			return "admin/board/admin_showone";
		}	
		
		
		// 검색한 리스트 보여주기
		@RequestMapping(value = "/admin_searchlist.tp", method = { RequestMethod.GET } )
		public String admin_searchlist(HttpServletRequest req) {

				HashMap<String, String> map = new HashMap<String, String>();
				
				String colName = req.getParameter("colName");
				String searchWord = req.getParameter("searchWord");
				
				map.put("colName", colName);
				map.put("searchWord", searchWord);
				
				List<BoardVO> list = dao.adminsearchlist(map);
				req.setAttribute("list", list);
				req.setAttribute("searchWord", searchWord);
				
			return "admin/board/admin_searchlist";
		}	
		
		// 글 쓸 수 있는 폼 보여주기
		@RequestMapping(value = "/admin_writeFrm.tp", method = { RequestMethod.GET } )
		public String admin_writeFrm(HttpServletRequest req) {

			String fk_seq = req.getParameter("fk_seq");
			String groupno = req.getParameter("groupno");
			String depthno = req.getParameter("depthno");
			
			req.setAttribute("fk_seq", fk_seq);
			req.setAttribute("groupno", groupno);
			req.setAttribute("depthno", depthno);
			
				
			return "admin/board/admin_writeFrm";
		}	
			
		// 글 지우기 
		// 7월4일
		@RequestMapping(value = "/admin_delete.tp", method = { RequestMethod.GET } )
		public String admin_delete(HttpServletRequest req) {

			String seq = req.getParameter("seq");
			
			
			int groupno = dao.findGroupNo(seq);
			System.out.println("groupno = "+ groupno);
			dao.adminDel(groupno);
			
			
			
			
			return "admin/board/admin_delete";
		}				
		
		
		// 그냥 새로운 글 쓰기 !
		@RequestMapping(value = "/admin_writeOne.tp", method = { RequestMethod.GET } )
		public String admin_writeOne(HttpServletRequest req, BoardVO vo, HttpSession session) {

			
			
			String fk_seq = null;
			String groupno = null;
			String depthno = null;
			
			if( (req.getParameter("fk_seq")==null || req.getParameter("fk_seq").trim().isEmpty()) &&
				(req.getParameter("groupno")==null || req.getParameter("groupno").trim().isEmpty()) &&	
				(req.getParameter("depthno")==null || req.getParameter("depthno").trim().isEmpty()) )
			{ // 답변글이 아닌 원글(새글)쓰기 이라면
				groupno = dao.getGroupno(); 
				// tblBoard 테이블상의 groupno 컬럼의 최대값에 +1 한값을 
				// groupno 로 설정한다.
			}
			else { // 답변글 쓰기 이라면
				// 넘겨받은 원글(부모글)의 depthno 값에다가 +1 증가한 값으로 
				// depthno 를 만들어서 DB로 보내야 한다.
				fk_seq = req.getParameter("fk_seq");
				groupno = req.getParameter("groupno");
				depthno = req.getParameter("depthno");
				System.out.println("depthno = " +  depthno);
				System.out.println("groupno = " +  groupno);
				System.out.println("fk_seq = " +  fk_seq);

				
				int depthnoInt = Integer.parseInt(depthno);
				depthnoInt++;
				
				depthno = String.valueOf(depthnoInt);
			}
			
			vo.setFk_seq(fk_seq);
			vo.setGroupno(groupno);
			vo.setDepthno(depthno);
		
			
			String userid = "admin";		
			String content = req.getParameter("content");
			String subject = req.getParameter("subject");
			String pw = req.getParameter("pw");

			
			
			vo.setUserid(userid);
			vo.setContent(content);
			vo.setSubject(subject);
			vo.setPw(pw);
			
			// dao.writeOne(vo);
			dao.add(vo);

			
			
			
			return "admin/board/admin_writeOne";
		}
		
		
		// 댓글 작성하기 
		@RequestMapping(value = "/admin_writeComment.tp", method = { RequestMethod.GET } )
		public String admin_writeComment(HttpServletRequest req,CommentVO vo) {

			String userid = "admin";
			String parentSeq = req.getParameter("parentSeq");
			String content = req.getParameter("content");
			vo.setContent(content);
			vo.setParentSeq(parentSeq);
			vo.setUserid(userid);
			
			
			int n = dao.addComment(vo);
					
			if(n != 0) { // 댓글 글쓰기가 성공했다라면
				dao.editCommentCount(vo.getParentSeq());
				// 원게시물의 글번호에 해당하는 댓글수 컬럼(commentCount)의 값을 1증가 시키기
			}
			
			req.setAttribute("vo", vo);
			
			
			req.setAttribute("n", n);
			req.setAttribute("parentSeq", parentSeq);
			return "admin/board/admin_writeComment";
		}	
		
		// 답글 쓰기  !!!
		@RequestMapping(value = "/admin_writeReply.tp", method = { RequestMethod.GET } )
		public String admin_writeReply(HttpServletRequest req,CommentVO vo) {


			
			return "admin/board/admin_writeReply";
		}	
}









