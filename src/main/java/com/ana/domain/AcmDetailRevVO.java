package com.ana.domain;

import java.util.Date;
import lombok.Data;

@Data
public class AcmDetailRevVO{
	
	private	String	revPstnum;
	private	String	revPtitle;
	private	String	revUsernum;
	private	Date	revPregdate;
	private	Date	revPupdatedate;
	private	Integer	revStisf;
	private	String	revAcmnum;
	private	String	revContent;
	private	String	revPstacti;
	
}
