package com.ana.domain;

import java.util.Date;

import lombok.Data;

@Data
public class UserHostVO {

	private String userNum;
	private Long bizRegnum;
	private String bizRegPurl;//추후에 파일로 바뀌어야함
}
