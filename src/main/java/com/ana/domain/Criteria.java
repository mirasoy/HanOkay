package com.ana.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	private String person;
	private String in;
	private String out;
	
	public Criteria() {
		this(1,10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount= amount;
		this.keyword="";
		this.person="1";
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}

}
