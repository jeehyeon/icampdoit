package com.exam.weather;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;



@Component
public class WeatherInsert {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Autowired
	WeatherDAO wdao;
	
	@Scheduled(cron = "0 1 0 * * *")
	public void InsertWDB() {
		
		String sql = "delete from weather";
		int deleteresult = jdbcTemplate.update(sql);
		System.out.println(deleteresult);
		
		
		//long now = System.currentTimeMillis() / 1000;
        //System.out.println("schedule tasks using cron jobs - {}"+ now);
		WeatherTO wto = new WeatherTO();
		wto = wdao.weathearDAO();
		WeatherTO wto2 = new WeatherTO();
		wto2 = wdao.weathearDAO2();
		WeatherTO wto3 = new WeatherTO();
		wto3 = wdao.weathearDAO3();
		
		
		ArrayList<WeatherTO> lists = new ArrayList<WeatherTO>();
		//1일 데이터
		WeatherTO result = new WeatherTO();
		result.setResultDate(wto.getDate1().substring(4,6)+"."+wto.getDate1().substring(6,8));
		result.setResultTaMin(wto.getTaMin1());
		result.setResultTaMax(wto.getTaMax1());
		result.setResultPop(wto.getPop1());
		result.setResultSky(wto.getSky1());
		lists.add(result);
		//2일 데이터
		WeatherTO result2 = new WeatherTO();
		result2.setResultDate(wto.getDate2().substring(4,6)+"."+wto.getDate2().substring(6,8));
		result2.setResultTaMin(wto.getTaMin2());
		result2.setResultTaMax(wto.getTaMax2());
		result2.setResultPop(wto.getPop2());
		result2.setResultSky(wto.getSky2());
		lists.add(result2);
		
		//3일
		WeatherTO result3 = new WeatherTO();
		result3.setResultDate(wto.getDate3().substring(4,6)+"."+wto.getDate3().substring(6,8));
		result3.setResultTaMin(wto.getTaMin3());
		result3.setResultTaMax(wto.getTaMax3());
		result3.setResultPop(wto.getPop3());
		result3.setResultSky(wto.getSky3());
		lists.add(result3);
		
		//4일
		WeatherTO result4 = new WeatherTO();
		result4.setResultDate(wto.getDate4().substring(4,6)+"."+wto.getDate4().substring(6,8));
		result4.setResultTaMin(wto2.getTaMin4()+".0");
		result4.setResultTaMax(wto2.getTaMax4()+".0");
		result4.setResultPop(wto3.getPop4());
		result4.setResultSky(wto3.getSky4());
		lists.add(result4);
		//5일
		WeatherTO result5 = new WeatherTO();
		result5.setResultDate(wto.getDate5().substring(4,6)+"."+wto.getDate5().substring(6,8));
		result5.setResultTaMin(wto2.getTaMin5()+".0");
		result5.setResultTaMax(wto2.getTaMax5()+".0");
		result5.setResultPop(wto3.getPop5());
		result5.setResultSky(wto3.getSky5());
		lists.add(result5);
		//6일
		WeatherTO result6 = new WeatherTO();
		result6.setResultDate(wto.getDate6().substring(4,6)+"."+wto.getDate6().substring(6,8));
		result6.setResultTaMin(wto2.getTaMin6()+".0");
		result6.setResultTaMax(wto2.getTaMax6()+".0");
		result6.setResultPop(wto3.getPop6());
		//System.out.println("6일하늘 인서트 전 : "+wto3.getPop6());
		result6.setResultSky(wto3.getSky6());
		lists.add(result6);
		//7일
		WeatherTO result7 = new WeatherTO();
		result7.setResultDate(wto.getDate7().substring(4,6)+"."+wto.getDate7().substring(6,8));
		result7.setResultTaMin(wto2.getTaMin7()+".0");
		result7.setResultTaMax(wto2.getTaMax7()+".0");
		result7.setResultPop(wto3.getPop7());
		result7.setResultSky(wto3.getSky7());
		lists.add(result7);
		
		for(WeatherTO to : lists) {
			String insertsql = "insert into weather values(?, ?, ?, ?, ?)";
			int result1 = jdbcTemplate.update(insertsql, to.getResultDate(), to.getResultTaMin(), to.getResultTaMax(), to.getResultPop(), to.getResultSky());
			System.out.println(result1);
		}
		
		
		
	}
}
