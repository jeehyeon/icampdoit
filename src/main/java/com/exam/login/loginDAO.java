package com.exam.login;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.JdbcTemplateAutoConfiguration;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class loginDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public int loginOK(LoginTO lto) {
		int flag = 1;
		
		String sql = "select count(*) from users where id=? and pwd=?;";
		int result = jdbcTemplate.queryForObject(sql, Integer.class, lto.getId(), lto.getPwd());
		System.out.println(result);
		
		if(result == 1) {
			flag = 0;
		}else {
			flag = 1;
		}
		
		return flag;
	}
	
	public int signUpOK(SignUpTO sto) {
		int flag = 1;	
		String sql = "insert into users values(0, ?, ?, ?, ?, ?, now(), ?, ?, ?)";
		int result = jdbcTemplate.update(sql,  sto.getId(), sto.getPwd(), sto.getName(), sto.getGen(), sto.getEmail(), sto.getBirth(),  sto.getHint(), sto.getAnswer());

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
		List<String> lists = jdbcTemplate.query(sql, new BeanPropertyRowMapper<String>(String.class), name, birth, email);
		String data = "";
		for(String list: lists) {
			data += list;
			data += "/";
		}
		return data;
	}
}
