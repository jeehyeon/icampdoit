package com.exam.login;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jdbc.JdbcTemplateAutoConfiguration;
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
	
	
}
