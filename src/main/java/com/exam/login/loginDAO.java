package com.exam.login;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.JdbcTemplateAutoConfiguration;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class loginDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
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
	
	public int signUpOK(SignUpTO sto) {
		int flag = 1;	
		String sql = "insert into users values(0, ?, ?, ?, ?, ?, now(), ?, ?, ?, ?)";
		int result = jdbcTemplate.update(sql,  sto.getId(), sto.getPwd(), sto.getName(), sto.getGen(), sto.getEmail(), sto.getBirth(),  sto.getHint(), sto.getAnswer(), sto.getKid());

		if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	public int idCheck(String id) {
		int flag = 1;
		String sql = "select count(*) from users where id=?";
		int result = jdbcTemplate.queryForObject(sql, Integer.class, id);
		if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	public String idSearch(String name, String birth, String email) {
		System.out.println("idSearch()");
		String sql = "select id from users where name=? and birth=? and email=?";
		List<LoginTO> lists = jdbcTemplate.query(sql, new BeanPropertyRowMapper<LoginTO>(LoginTO.class), name, birth, email);
		String data = "";
		if(lists != null) {	
			for(LoginTO list: lists) {
				data += list.getId();
				data += ", ";
			}
		}else {
			data += "0";
		}
		return data;
	}
	
	public String pwdCheck(SignUpTO sto) {
		
		String sql = "select ucode from users where name=? and id=? and email=? and hint=? and answer=?";
		String result;
		try {
			result = jdbcTemplate.queryForObject(sql, String.class, sto.getName(), sto.getId(), sto.getEmail(), sto.getHint(), sto.getAnswer());
		} catch (EmptyResultDataAccessException e) {
			// TODO Auto-generated catch block
			result = "-1";
		}
		
		System.out.println("pwdcheck : " + result);
		return result;
	}
	
	public int pwdset(String pwd, String ucode) {
			int flag = 1;
			
			String sql1 = "select count(*) from users where ucode=? and pwd=?";
			int result1 = jdbcTemplate.queryForObject(sql1, Integer.class, ucode, pwd);
			if(result1 == 1) {
				flag = 2;
				return flag;
			}

			String sql = "update users set pwd=? where ucode=?;";
			int result = jdbcTemplate.update(sql, pwd, ucode);
			if(result == 1) {
				flag = 0;
			}
			
			
			return flag;
		}
	 
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
	public String kakaoLoginID(int ucode) {
		
		
		
			String sql = "select id from users where ucode=?";
			String id = jdbcTemplate.queryForObject(sql, String.class, ucode);
		
		
		
		
		return id;
	}
}
