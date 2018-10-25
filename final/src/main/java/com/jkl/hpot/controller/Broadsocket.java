package com.jkl.hpot.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.web.socket.WebSocketSession;

@ServerEndpoint("/broadcasting")
public class Broadsocket {

	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());
	
	HashMap<String,String> hashMap = new HashMap<>();

	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			String qsd = message.substring(message.length()-3, message.length());
			if(qsd.equals("qsd")) {
				message = message.substring(0, message.length()-3);
				String userId = message.substring(0,message.indexOf("님이 입"));
				String sessionId = session.getId();
				hashMap.put(sessionId,userId);
				System.out.println("아이디 : "+hashMap.get(sessionId));
			}
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}

	@OnOpen
	public void onOpen(Session session) throws IOException {
		// Add session to the connected sessions set
		System.out.println(session);
		clients.add(session);
	}

	@OnClose
	public void onClose(Session session) throws IOException {
		String sessionId = session.getId();
		String exitMessage = hashMap.get(sessionId)+"님이 퇴장하였습니다.";
		hashMap.remove(sessionId);
		// Remove session from the connected sessions set
		clients.remove(session);
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			for (Session client : clients) {
				client.getBasicRemote().sendText(exitMessage);
			}
		}
	}
}