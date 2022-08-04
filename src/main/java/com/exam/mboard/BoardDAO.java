package com.exam.mboard;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.exam.login.SignUpTO;
import com.exam.mboard.BoardListTO;
import com.exam.mboard.BoardTO;

@Repository
public class BoardDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private String uploadPath = "C:/java/ProjectGit/src/main/webapp/upload"; // 리나 upload 경로
	
	// write
	public void mboardWrite() {		
	}
	
	// write_ok
	public int mboardWriteOk(BoardTO to, FileTO fto) {	

		int flag = 1;
		
		SignUpTO sto = new SignUpTO();
		
		String sql = "insert into m_board values ( 0, ?, ?, ?, now(), 0, ?, ?, 0 )";
		int result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), sto.getId(), to.getContent(), sto.getUcode());
					System.out.println(result);
		//sql = "insert into m_file values ( 0, 0, ?, ? )";
		//result = jdbcTemplate.update(sql, fto.getFilename(), fto.getFilesize());

		if( result == 1 ) {
			flag = 0;
		}
		return flag;		
	}
	
	// list
	public ArrayList<BoardTO> mboardList() {
				
		String sql = "select seq, subject, writer, cmt, filename, date_format(wdate, '%Y.%m.%d') wdate, hit, datediff(now(), wdate) wgap from album_cmt_board1 order by seq desc";
		ArrayList<BoardTO> lists = (ArrayList<BoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class) );
		
		return lists;		
	}
	
	// listTO
	public BoardListTO mboardList(BoardListTO listTO) {
		
		
		return listTO;
	}
	
	// view
	public BoardTO mboardView(BoardTO to) {	

		return to;
	}
	
	// modify
	public BoardTO mboardModify(BoardTO to) {
		
		
	
		return to;
	}
	
	// modify_ok
	public int mboardModifyOk(BoardTO to) {	
		
		int flag = 2;
		
		return flag;
	}
	
	// delete
	public BoardTO mboardDelete(BoardTO to) {
		
		
		return to;
	}
	
	// delete_ok
	public int mboardDeleteOk(BoardTO to) {
		
		int flag = 2;
		
		return flag;
	}

}
