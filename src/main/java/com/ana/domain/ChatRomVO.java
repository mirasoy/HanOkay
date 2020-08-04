package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChatRomVO {

	private String chatromnum;
	private String participant1;
	private String participant2;
	private String lastchat;
	private String lstaccessor;
	private String unread;
	private Date regdate;
	private Date udatedate;
	private UserVO otherUser;
}

