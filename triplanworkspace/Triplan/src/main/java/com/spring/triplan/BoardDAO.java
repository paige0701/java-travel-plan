package com.spring.triplan;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.model.BoardVO;
import com.spring.model.CommentVO;

// #9. DAO 선언
@Repository
public class BoardDAO {

	// #11-1. sqlSessionTemplate 의존 객체(Dependency Injection)
	//        생성주입(myBatis를 실행하는 객체생성) 
	@Autowired
	SqlSessionTemplate sqlSession;

	
	// #14. 글쓰기를 해주는 메소드 add(BoardVO vo) 생성하기
	public void add(BoardVO vo) {
		sqlSession.insert("board.add", vo);
	}


	// #18.글목록을 가져오는 메소드 생성하기
	public List<BoardVO> list() {
		
		List<BoardVO> list = sqlSession.selectList("board.list");
		
		return list;
	}


	// #26. 1개글을 보여주는 메소드 생성하기
	public BoardVO get(String seq) {
		
		BoardVO vo = sqlSession.selectOne("board.get", seq);
		return vo;
	}


	// #29. 글 조회수 컬럼의 값을 증가시켜주는 메소드 생성하기  
	public void addReadCount(String seq) {
		
		sqlSession.update("board.addReadCount", seq);
		
	}


	// #37. 글 수정시 해당 글번호에 대한 암호가 일치하는지 알아보기
	public boolean check(HashMap<String, String> map) {
		// 파라미터 map 에는 글번호를 알려주는 키값 "seq" 와
		// 글 수정시 사용자가 입력한 암호를 알려주는 키값 "pw" 이 들어있다.
		
		int cnt = sqlSession.selectOne("board.check", map);
		
		// #39. xml에서 넘겨받은 값이 cnt 변수에 저장되어지는데
		//      cnt 값이 1 이라면 암호가 일치하는 것이고,
		//      cnt 값이 0 이라면 암호가 일치하지 않는 것이다.
		
		boolean result = false;
		
		if(cnt == 1) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}
	
	// #41. 글수정하기
	public void edit(BoardVO vo) {
		sqlSession.update("board.edit", vo);
	}

	// #49. 글 삭제하기
	public void del(int groupno) {
		sqlSession.delete("board.delete", groupno);
	}
	
	
	// 댓글 삭제시 해당 댓글번호에 대한 암호가 일치하는지 알아보기
	public boolean checkComment(String seq) {
		
		int cnt = sqlSession.selectOne("board.checkComment", seq);
		
		//  xml에서 넘겨받은 값이 cnt 변수에 저장되어지는데
		//  cnt 값이 1 이라면 암호가 일치하는 것이고,
		//  cnt 값이 0 이라면 암호가 일치하지 않는 것이다.
		
		boolean result = false;
		
		if(cnt == 1) {
			result = true;
		} else {
			result = false;
		}
		
		return result;
	}
	
	// 댓글 삭제하기
	public void delComment(String seq) {
		sqlSession.delete("board.deleteComment", seq);
	}
	
	//원게시물의 글번호에 해당하는 댓글수 컬럼(commentCount)의 값을 1감소 시키기	
	public void downCommentCount(String parentSeq) {
		sqlSession.update("board.downCommentCount", parentSeq);
	}


	// #56. 검색조건에 따른 글목록을 가져오는 메소드 생성하기
	//      검색조건이 없는 경우는 모든 글목록을 보여주어야 하고
	//      검색조건이 있는 경우라면 해당조건에 맞는 글목록을 보여주어야 한다.
	public List<BoardVO> list(String column, String search) {
		
		List<BoardVO> list = null;
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		if(column != null && search != null) {
			map.put("column", column);
			map.put("search",search);
			
			list = sqlSession.selectList("board.search", map);
		}
		else {
			list = sqlSession.selectList("board.list");
		}
		 
		return list;
	}


	// #65. 댓글쓰기
	public int addComment(CommentVO vo) {
		int n = sqlSession.insert("board.addComment", vo);
		return n;
	}


	//#67. 원게시물의 글번호에 해당하는 댓글수 컬럼(commentCount)의 값을 1증가 시키기	
	public void editCommentCount(String parentSeq) {
		sqlSession.update("board.editCommentCount", parentSeq);
		
	}

	
	// #71. 댓글 목록 가져오기
	public List<CommentVO> listComment(String parentSeq) {
		List<CommentVO> commentList = sqlSession.selectList("board.listComment", parentSeq);
		return commentList;
	}
	
	
	// #80. 검색조건에 따른 글목록을 가져오는 메소드 생성하기(페이징처리 동반)
	//      검색조건이 없는 경우는 모든 글목록을 보여주어야 하고
	//      검색조건이 있는 경우라면 해당조건에 맞는 글목록을 보여주어야 한다.
		public List<BoardVO> list(String column, String search, int start, int end) {
			
			List<BoardVO> list = null;
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("start", String.valueOf(start));
			map.put("end", String.valueOf(end));
			
			if(column != null && search != null) {
				map.put("column", column);
				map.put("search",search);
				
				list = sqlSession.selectList("board.search", map);
			}
			else {
				list = sqlSession.selectList("board.list", map);
			}
			 
			return list;
		}


	// #84. 총 게시물 건수(tblBoard 테이블에 저장된 총 행의 갯수)
		public int getTotalCount() {
			int totalCount = sqlSession.selectOne("board.getTotalCount");
			return totalCount;
		}

	
	// #91. 검색조건이 있는 총 게시글 건수 알아오기	
		public int getSearchCount(HashMap<String, String> map) {
			int total = sqlSession.selectOne("board.getSearchCount", map); 
			return total;
		}

	// #102. 답변글쓰기에 있어서 tblBoard 테이블의 groupno 컬럼의 최대값 + 1 을 구해오는 메소드 생성하기 
		public String getGroupno() {
			String groupno = sqlSession.selectOne("board.getGroupno");
			return groupno;
		}

	// #119. 파일 첨부가 있는 글쓰기 메소드 생성하기
		public void add_withFile(BoardVO vo) {
			sqlSession.insert("board.add_withFile", vo);
			
		}


		// #137. Ajax(제목 검색어 입력시 검색단어 자동완성하기)관련 
		public List<String> getAllSubject() {
			List<String> list = sqlSession.selectList("board.getAllSubject");
			return list;
		}

		// #138. Ajax(내용물 검색어 입력시 검색단어 자동완성하기)관련
		public List<String> getAllContent() {
			List<String> list = sqlSession.selectList("board.getAllContent");
			return list;
		}

		// #139. Ajax(이름 검색어 입력시 검색단어 자동완성하기)관련
		public List<String> getAllName() {
			List<String> list = sqlSession.selectList("board.getAllName");
			return list;
		}
		
		
		// #149. Ajax(JSON 을 사용하여 조회수 랭킹 보여주기 5) //
		public List<BoardVO> getRankN(String rankN) {
			List<BoardVO> rankNList = sqlSession.selectList("board.getRankN", rankN);
			return rankNList;
		}
	
		//-------------------------------------어드민 
				public List<BoardVO> adminlist() {
					
					return sqlSession.selectList("board.adminlist");
					
				}


				public BoardVO adminshowone(String seq) {
					return sqlSession.selectOne("board.adminshowone", seq);
					
				}


				public List<BoardVO> adminsearchlist(HashMap<String, String> map) {

					return sqlSession.selectList("board.adminsearchlist",map);

				}


				public void writeOne(BoardVO vo) {
					sqlSession.insert("board.writeOne", vo);

					
				}


				public List<CommentVO> adminlistComment(String seq) {
					List<CommentVO> adminlistComment = sqlSession.selectList("board.adminlistComment", seq);
					return adminlistComment;
				}


				public void adminDel(int groupno) {
					sqlSession.delete("board.delete", groupno);
					
				}

				public int findGroupNo(String seq) {
					return sqlSession.selectOne("board.findGroupNo",seq);
				}
}






