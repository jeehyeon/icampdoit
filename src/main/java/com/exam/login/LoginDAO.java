package com.exam.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Repository
public class LoginDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// loginOK
	public int loginOK(LoginTO lto) {
		int ucode;
		
		try {
			String sql = "select ucode from users where id=? and pwd=?;";
			ucode = jdbcTemplate.queryForObject(sql, Integer.class, lto.getId(), lto.getPwd());
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			ucode= -1;
		}
		
		return ucode;
	}
	
	// signUpOK
	public int signUpOK(SignUpTO sto) {
		int flag = 1;	
		
		String sql = "insert into users values(0, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?)";
		int result = jdbcTemplate.update(sql,  sto.getId(), sto.getPwd(), sto.getName(), sto.getGen(), sto.getEmail(), sto.getBirth(),  sto.getHint(), sto.getAnswer(), sto.getKid());

		if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	// idCheck
	public int idCheck(String id) {
		int flag = 1;
		
		String sql = "select count(*) from users where id=?";
		int result = jdbcTemplate.queryForObject(sql, Integer.class, id);
		
		if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	// idSearch
	public String idSearch(String name, String birth, String email) {

		String sql = "select id from users where name=? and birth=? and email=?";
		List<LoginTO> lists = jdbcTemplate.query(sql, new BeanPropertyRowMapper<LoginTO>(LoginTO.class), name, birth, email);
		
		String data = "";
		
		if(lists != null) {	
			for(LoginTO list: lists) {
				data += list.getId();
				data += ", ";
			}
		} else {
			data += "0";
		}
		
		return data;
	}
	
	// pwdCheck
	public String pwdCheck(SignUpTO sto) {
		String sql = "select ucode from users where name=? and id=? and email=? and hint=? and answer=?";
		String result;
		try {
			result = jdbcTemplate.queryForObject(sql, String.class, sto.getName(), sto.getId(), sto.getEmail(), sto.getHint(), sto.getAnswer());
		} catch (EmptyResultDataAccessException e) {
			// TODO Auto-generated catch block
			result = "-1";
		}

		return result;
	}
	
	// pwdset
	public int pwdset(String pwd, String ucode) {
			int flag = 1;
			
			String sql = "select count(*) from users where ucode=? and pwd=?";
			int result = jdbcTemplate.queryForObject(sql, Integer.class, ucode, pwd);
			if(result == 1) {
				flag = 2;
				return flag;
			}

			sql = "update users set pwd=? where ucode=?;";
			result = jdbcTemplate.update(sql, pwd, ucode);
			if(result == 1) {
				flag = 0;
			}
			
			return flag;
		}
	 
	// kakaoCheck 
	public int kakaoCheck(String name, String email, String kid) {
		int ucode;
		
		try {
			String sql = "select ucode from users where name=? and email=? and kid=?";
			ucode = jdbcTemplate.queryForObject(sql, Integer.class, name, email, kid);
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			ucode= -1;
		}
		
		return ucode;
	}
	
	// kakaoLoginID
	public String kakaoLoginID(int ucode) {
		
			String sql = "select id from users where ucode=?";
			String id = jdbcTemplate.queryForObject(sql, String.class, ucode);
				
		return id;
	}
	
}
