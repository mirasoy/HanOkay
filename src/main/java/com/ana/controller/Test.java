package com.ana.controller;

import org.apache.commons.lang3.StringUtils;

public class Test {

	public static void main(String[] args) {
		String keyword = StringUtils.replaceEach("서울시 종로구", new String[] {"대한민국","서울시","특별시","광역시","충청남도","충청북도","전라북도","전라남도","경상북도","경상남도","강원도","경기도","제주도"}, 
				  new String[] {"","서울","","","충남","충북","전북","전남","경북","경남","강원","경기","제주"}).trim();
		System.out.println("keyword1:"+keyword);
		keyword=keyword.trim();
		System.out.println("keyword2:"+keyword);
		String[] location = keyword.split(" ");
		System.out.println("keyword3:"+keyword);
		for(String s : location) {
			System.out.println(s);
		}

	}

}
