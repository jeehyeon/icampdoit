package com.exam.search;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.exam.login.SignUpTO;
import com.exam.mboard.BoardTO;
import com.exam.mboard.FileTO;

@Repository
public class SearchkeyDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
		
	public List<SearchkeyTO> searchkeyDAO(String keysearch) {
	      // TODO Auto-generated method stub
		
		String sql = "select facltNm, addr1, addr2, induty, firstImageUrl, contentId, doNm, sigunguNm from go_api where facltNm like ? or addr1 like ? or induty like ?";
		ArrayList<SearchkeyTO> datas = (ArrayList<SearchkeyTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), "%"+keysearch+"%", "%"+keysearch+"%","%"+keysearch+"%" );
		
		return datas;
	}
	
	//campview 테이블이 존재하는 지 검사
	public SearchkeyTO campViewTableExist(SearchkeyTO kto) {
	      // TODO Auto-generated method stub
		
		try {
			String sql = "select seq, contentId from campview where contentId=?";
			kto = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), kto.getContentId());
		} catch (EmptyResultDataAccessException e) {
			// TODO Auto-generated catch block
			kto.setSeq("-1");
			
		}
		
		return kto;
	}
	//DBINSERT campview
	public int campViewTableInsert(SearchkeyTO kto) {	
		
		int flag = 1;
		
		
		
		String sql = "insert into campview values  ( 0, ?, 1)";
		int result = jdbcTemplate.update(sql, kto.getContentId());
					System.out.println(result);
					
		//위에 들어가 부분에 seq값을 다시 들고 나와야 함
		if( result != 1 ) {
			System.out.println("campViewTableInsert 오류");
			return flag;	
		}else {
			flag=0;
		}
		return flag;
	}
	
	//campview 조회수
	public int campViewHit(SearchkeyTO kto) {	
		int flag = 1;
		String sql = "update campview set hit=hit+1 where contentId=?";
		int result = jdbcTemplate.update(sql, kto.getContentId() );
		System.out.println("campViewHit 조회수 메서드 : " + result);
		if( result != 1 ) {
			System.out.println("campViewHit 오류");
			return flag;	
		}else {
			flag=0;
		}
		return flag;
	}
	
	
	// campview
		public SearchkeyTO campView(SearchkeyTO kto) {	
			
			String sql = "select * from go_api where contentId=?";		
			kto = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<SearchkeyTO>(SearchkeyTO.class), kto.getContentId() );
			
			return kto;
		}
	
	
}