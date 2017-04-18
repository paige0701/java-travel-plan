package com.spring.triplan;

import java.sql.*;

public class DBConnection {

	// 1. 오라클 드라이버
	private static String _DRIVER = "oracle.jdbc.driver.OracleDriver";
		
		// 2. 오라클 서버의 물리적 주소
		private static String _URL = "jdbc:oracle:thin:@localhost:1521:xe";
		
		// 3. 오라클 서버에 연결할 계정명
		private static String _USER = "triplan";
		
		// 4. 오라클 서버에 연결할 계정의 비밀번호
		private static String _PASSWORD = "triplan";
		
		private static String _URL(String ip)
		{
			return "jdbc:oracle:thin:@"+ip+":1521:XE";
		}

		// 5. 오라클 서버에 연결하는 Connection 객체 할당하기
		private static Connection conn = null;
		
		/*
		 * 위에서 초기값으로 부여했던 _URL, _USER, _PASSWORD 값을
		 * 사용하지 않고 나중에 새로운 값을 변경해서 사용할 수도 있으므로 final을 사용하지않고
		 * private을 사용한다
		 */
	
		
		public static String get_URL() {
			return _URL;
		}

		public static void set_URL(String _URL) {
			DBConnection._URL = _URL;
		}

		public static String get_USER() {
			return _USER;
		}

		public static void set_USER(String _USER) {
			DBConnection._USER = _USER;
		}

		public static String get_PASSWORD() {
			return _PASSWORD;
		}

		public static void set_PASSWORD(String _PASSWORD) {
			DBConnection._PASSWORD = _PASSWORD;
		}
		
		// static 초기화 블럭
		/*
		 * main()메소드가 있는 어떤 클래스에서
		 * 다른클래스에 정의된 static 초기화 블럭을 호출해오면
		 * main()메소드 보다 가장먼저 static 초기화 블럭에 정의된 것이
		 * 가장 먼저 메모리에 올라간다
		 * 또한 static 초기화 블럭이 여러번 호출되더라도 매번 메모리에 올라가는것이 아니라
		 * 딱 1번만 메모리에 올라간다.
		 * 즉, static 초기화 블럭이 메모리에 올라간 상태이라면
		 * 더이상 메모리에 올라가지 않는다.
		 * 그러므로 main()메소드가 있는 어떤 클래스에서 어떤 기능을 하는 메소드를 매번 사용하고 싶은데 
		 * 매번 호출하지 않고 딱 1번만 호출해서 계속 사용하고 싶을때에 
		 * static 초기화 블럭으로 만들어서 호출하여 사용하면 성능의 향상을 가져올수 있다.
		 * 
		 */
		
		static { // static 초기화 블럭 시작
			
			try {
				Class.forName(_DRIVER);
			}catch (ClassNotFoundException e) {
				System.out.println("오라클 드라이버 로딩 실패!! ojdbc6.jar 파일이 없습니다.");
				System.out.println(e.getMessage());
				
			}
		}// static 초기화 블럭 끝
		
		// 오라클 DB 서버와 연결해주는 Connection 객체 생성하기
		public static Connection getConn() throws SQLException
		{	
			if(conn == null || conn.isClosed()) // conn.isClose()는 conn 이 닫혀있으면 true
				conn = DriverManager.getConnection(_URL,_USER,_PASSWORD);
			return conn;
		}
		
}
