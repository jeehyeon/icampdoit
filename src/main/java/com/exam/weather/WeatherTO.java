package com.exam.weather;

import java.util.Calendar;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter
public class WeatherTO {

	private String taMin1;
	private String taMax1;
	private String taMin2;
	private String taMax2;
	private String taMin3;
	private String taMax3;
	private String taMin4;
	private String taMax4;
	private String taMin5;
	private String taMax5;
	private String taMin6;
	private String taMax6;
	private String taMin7;
	private String taMax7;
	
	private String date0; //0은 현재날짜에서의 어제
	private String date1;
	private String date2;
	private String date3;
	private String date4;
	private String date5;
	private String date6;
	private String date7;
	
	private String pop1;
	private String pop2;
	private String pop3;
	private String pop4;
	private String pop5;
	private String pop6;
	private String pop7;
	
	private String sky1;
	private String sky2;
	private String sky3;
	private String sky4;
	private String sky5;
	private String sky6;
	private String sky7;
	
	private String resultDate;
	private String resultTaMin;
	private String resultTaMax;
	private String resultPop;
	private String resultSky;
	
	private String date;
	private String taMin;
	private String taMax;
	private String pop;
	private String sky;
	
	public WeatherTO() {
		// TODO Auto-generated constructor stub
		for(int i=0; i<=7; i++) {
		    Calendar today=Calendar.getInstance();
		    today.add(Calendar.DAY_OF_MONTH, +i-1); 
		    String strdate;
		    if(today.get(Calendar.MONTH)<10 && today.get(Calendar.DATE)<10) {
		    	strdate=today.get(Calendar.YEAR)+"0"+ (today.get(Calendar.MONTH)+1)+"0"+today.get(Calendar.DATE);
		    }else if(today.get(Calendar.MONTH)<10){
		    	strdate=today.get(Calendar.YEAR)+"0"+ (today.get(Calendar.MONTH)+1)+""+today.get(Calendar.DATE);
		    }else if(today.get(Calendar.DATE)<10) {
		    	strdate=today.get(Calendar.YEAR)+""+ (today.get(Calendar.MONTH)+1)+"0"+today.get(Calendar.DATE);
		    }else {
		    	strdate=today.get(Calendar.YEAR)+""+ (today.get(Calendar.MONTH)+1)+""+today.get(Calendar.DATE);
		    }
		    
		    switch(i) {
		    case 0:
		    	this.date0= strdate;
		    	break;
		    case 1:
		    	this.date1= strdate;
		    	break;
		    case 2:
		    	this.date2= strdate;
		    	break;
		    case 3:
		    	this.date3= strdate;
		    	break;
		    case 4:
		    	this.date4= strdate;
		    	break;
		    case 5:
		    	this.date5= strdate;
		    	break;
		    case 6:
		    	this.date6= strdate;
		    	break;
		    case 7:
		    	this.date7= strdate;
		    	break;
		   
		    }
		}
	}
	
	
}
