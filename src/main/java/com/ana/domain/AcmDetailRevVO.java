package com.ana.domain;

import java.util.Date;
import lombok.Data;

@Data
public class AcmDetailRevVO{
	
	String	revPstnum;
	String	revPtitle;
	String	revUsernum;
	Date	revPregdate;
	Date	revPupdatedate;
	Integer	revStisf;
	String	revAcmnum;
	String	revContent;
	String	revPstacti;
	
}
