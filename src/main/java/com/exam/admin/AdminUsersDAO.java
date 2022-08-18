package com.exam.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.exam.login.SignUpTO;

@Repository
public class AdminUsersDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//회원 list
	public UsersListTO usersList( UsersListTO ulistTO ) {
		
		int cpage = ulistTO.getCpage();
		int recordPerPage = ulistTO.getRecordPerPage();
		int blockPerPage = ulistTO.getBlockPerPage();
		
		String sql = "select ucode, id, name, gen, email, STR_TO_DATE( birth, '%Y%m%d' ) birth from users where name not like ' ' ";
		ArrayList<SignUpTO> ulists = (ArrayList<SignUpTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<SignUpTO>(SignUpTO.class));
		
		ulistTO.setTotalRecord( ulists.size() );
		
		ulistTO.setTotalPage( (ulistTO.getTotalRecord() -1) / recordPerPage + 1);
		int skip = ( cpage - 1 ) * recordPerPage;
		
		ArrayList<SignUpTO> lists = new ArrayList<SignUpTO>();
		for( int i=0; i<recordPerPage ; i++ ) {
			if( skip+i != ulists.size() ) {
				SignUpTO to = new SignUpTO();
				to.setUcode( ulists.get( skip+i ).getUcode() );
				to.setId( ulists.get(skip+i).getId() );
				to.setName( ulists.get(skip+i).getName() );
				to.setGen( ulists.get(skip+i).getGen() );
				to.setEmail( ulists.get(skip+i).getEmail() );
				to.setBirth( ulists.get(skip+i).getBirth() );	
				
				lists.add(to);
				
			} else { break; }
		}
		System.out.println("dao 리스트 : " + lists);
		ulistTO.setUsersLists( lists );
		ulistTO.setStartBlock( ( ( cpage-1 ) / blockPerPage ) * blockPerPage + 1);
		ulistTO.setEndBlock( ( (cpage-1) / blockPerPage) * blockPerPage + blockPerPage);
		if(ulistTO.getEndBlock() >= ulistTO.getTotalPage()) {
			ulistTO.setEndBlock(ulistTO.getTotalPage());
		}
		return ulistTO;
	}
	
	//회원 정보 modify
	public SignUpTO userView(SignUpTO sto) {
		
		String sql = "select ucode, id, name, gen, email, birth, DATE_FORMAT( rdate, '%Y-%m-%d' ) rdate from users where ucode=?";
		sto = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<SignUpTO>(SignUpTO.class), sto.getUcode() );
		
		return sto;
	}
	
	//회원정보 modifyOk
	public int usersModifyOK(SignUpTO sto) {
		int flag = 2;
		System.out.println( "birth: " + sto.getBirth() );
		System.out.println("Name: " + sto.getName() );
		System.out.println( "Gen: " +sto.getGen() );
		System.out.println( "Email: " +sto.getEmail() );
		System.out.println( "Ucode: " +sto.getUcode() );
		
		String sql = "update users set name=?, gen=?, email=?, birth=? where ucode=?";
		int result = jdbcTemplate.update(sql, sto.getName(), sto.getGen(), sto.getEmail(), sto.getBirth(), sto.getUcode() );
		
		System.out.println( result );
		
		if( result == 0 ) {
			flag = 1;
		} else if( result == 1 ) {
			flag = 0;
		}
		
		return flag;
	}
	
	//회원정보 deleteOk
		public int usersDeleteOK(SignUpTO sto) {
			int flag = 2;
			
			System.out.println( "Ucode deleteDAO 에서: " +sto.getUcode() );
			
			String sql = "update users set pwd=?, name=?, email=?, birth=?, gen=?, hint=?, answer=?, kid=? where ucode=?";
			int result = jdbcTemplate.update(sql, " ", " ", " ", " ", " ", " ", " ", " ", sto.getUcode() );
			
			System.out.println( result );
			
			if( result == 0 ) {
				System.out.println("삭제가 되지 않았습니다.");
				flag = 1;
			} else if( result == 1 ) {
				flag = 0;
			}
			
			return flag;
		}
}
