package com.spring.triplan;


import java.io.IOException;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
 
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


@ServerEndpoint("/websocket")
public class websocket {

	private websocketDAO wdao =  new websocketDAO();
	
	static List<Session> sessionUsers = Collections.synchronizedList(new ArrayList());

    /***
     * 웹 소켓이 연결되면 호출되는 이벤트
     */
    @OnOpen
    public void handleOpen(){
        System.out.println("client is now connected...");
    }
    /**
     * 웹 소켓으로부터 메시지가 오면 호출되는 이벤트
     */
    @OnMessage
    public void handleMessage(String message,Session userSession) throws IOException{
        String userid = (String)userSession.getUserProperties().get("userid");
        
        if(userid == null){
            userSession.getUserProperties().put("userid", message);
            sessionUsers.add(userSession);
            return;
        }
        
        /*Iterator<Session> iterator = sessionUsers.iterator();*/
        String sc_idx = message;
        HashMap<String, String> useridMap = null;
        
		try {
			
			useridMap = wdao.getScheduleMember(sc_idx);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		for(int i=0; i < sessionUsers.size(); i++)
		{
			if(useridMap.get(sessionUsers.get(i).getUserProperties().get("userid")) != null)
			{
				sessionUsers.get(i).getBasicRemote().sendText("call");
			}
		}
		
/*        while(iterator.hasNext()){
        	Session temp = iterator.next();
        	if(useridMap.get(temp.getUserProperties().get("userid")) != null)
        	{
        		temp.getBasicRemote().sendText("call");
        	}
        }*/
    }
    /**
     * 웹 소켓이 닫히면 호출되는 이벤트
     */
    @OnClose
    public void handleClose(){
        System.out.println("client is now disconnected...");
    }
    /**
     * 웹 소켓이 에러가 나면 호출되는 이벤트
     */
    @OnError
    public void handleError(Throwable t){
        t.printStackTrace();
    }
    
}