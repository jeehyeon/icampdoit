package com.exam.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.exam.login.SignUpTO;

@Repository
public class AdminStatDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//게시판 글 수
	public String countBoard() {
		
		String sql = "select count(*) from m_board";
		String countBoardResult = (String)jdbcTemplate.queryForObject(sql, String.class );
		
		return countBoardResult;
	}
	
	//여성 회원 수
	public String countFemale() {
		
		String sql = "select count(*) from users where gen='여'";
		String countFemaleResult = (String)jdbcTemplate.queryForObject(sql, String.class );
		
		return countFemaleResult;
	}
	
	//남성 회원 수
	public String countMale() {
		
		String sql = "select count(*) from users where gen='남'";
		String countMaleResult = (String)jdbcTemplate.queryForObject(sql, String.class );
		
		return countMaleResult;
	}
	
	//이번 주 가입자 수
	public String weeklyRegistered() {
		
		String sql = "select count(*) from users where "
					+ "rdate > now() - interval 1 week";
		String registeredResult = (String)jdbcTemplate.queryForObject(sql, String.class);
		
		return registeredResult;
	}
	
	//캠핑장 view 리뷰 댓글 수
	public String countReviews() {
		
		String sql = "select count(*) from campview_cmt";
		String countReviewsResult = (String)jdbcTemplate.queryForObject(sql, String.class );
		
		return countReviewsResult;
	}
	
	//연령대 별 회원 수 count
	public ArrayList<SignUpTO> countbyAge(SignUpTO sto) {
		
		String sql = "select * from("
					+ "select floor((date_format( now(), '%Y')-substring(birth,1,4))/10)*10 as age, "
					+ "count(*) as total "
					+ "from users "
					+ "group by age) s "
					+ "where s.age >=0 and s.age<=100";
		
		ArrayList<SignUpTO> ageList = (ArrayList<SignUpTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SignUpTO>(SignUpTO.class) );
		
		
		return ageList;
	}
	
	//세션 생성시 방문자 수 증가 위해 테이블에 날짜 추가
	public int increaseVisitor() {
		
		int flag = 1;
		
		String sql = "insert into visit(vdate) values(sysdate())";
		int result = (Integer)jdbcTemplate.update(sql);
		
		if( result != 1 ) {
			System.out.println( "visitor 늘리기 오류" );
		} else {
			flag = 0;
		}
		
		return flag;
	}
	
	//총 방문자 수
	public String countTotalVisitor() {
		
		String sql = "select count(*) as totalcnt from visit";
		String totalVisitor = (String)jdbcTemplate.queryForObject(sql, String.class );
		
		return totalVisitor;
	}
	
	//오늘 방문자 수
	public String countTodayVisitor() {
		
		String sql = "select count(*) as todaycnt from visit where DATE_FORMAT( vdate, '%Y-%m-%d') = DATE_FORMAT(sysdate(), '%Y-%m-%d');";
		
		String todayVisitor = (String)jdbcTemplate.queryForObject(sql, String.class);
		
		return todayVisitor;
	}
	
	//소셜 가입자 수
	public String countSocialId() {
		
		String sql = "select count(*) from users where kid != 0";
		
		String countSocialId = (String)jdbcTemplate.queryForObject(sql, String.class );
		
		return countSocialId;
	}
}
