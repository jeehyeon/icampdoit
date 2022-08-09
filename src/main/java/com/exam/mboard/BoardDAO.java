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
import com.exam.nboard.NBoardTO;

@Repository
public class BoardDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
		
	// write
	public void mboardWrite() {		
	}
		
	// write_ok
	public int mboardWriteOk(BoardTO to, FileTO fto) {	
		String sql = "select max(seq) from m_board";
		String seqdata = jdbcTemplate.queryForObject(sql, String.class);
		int lastseq = 0;
		if(seqdata != null) {
			lastseq = lastseq+Integer.parseInt(seqdata);
		}
		
		int flag = 1;
		
		SignUpTO sto = new SignUpTO();
		
		sql = "insert into m_board values ( 0, ?, ?, ?, ?, now(), 0, ?, 0 )";
		int result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(), to.getUcode());
					System.out.println(result);
					
		//위에 들어가 부분에 seq값을 다시 들고 나와야 함
		if( result != 1 ) {
			System.out.println("m_board insert 오류");
			return flag;	
		}
					
		sql = "insert into m_file values ( 0, ?, ?, ? )";
		result = jdbcTemplate.update(sql, lastseq+1, fto.getFilename(), fto.getFilesize());

		if( result == 1 ) {
			flag = 0;
		}
		return flag;		
	}
	
	// list
	public ArrayList<BoardTO> mboardList() {
				
		String sql = "select seq, subject, writer, title, date_format(wdate, '%Y.%m.%d') wdate, hit from m_board order by seq desc";
		ArrayList<BoardTO> lists = (ArrayList<BoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class) );
		
		return lists;		
	}
	
	public ArrayList<BoardTO> mboardListFree() {
		
		String sql = "select seq, subject, writer, title, date_format(wdate, '%Y.%m.%d') wdate, hit from m_board where subject='2' order by seq desc";
		ArrayList<BoardTO> lists = (ArrayList<BoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class) );
		
		return lists;		
	}
	
	public ArrayList<BoardTO> mboardListReview() {
		
		String sql = "select seq, subject, writer, title, date_format(wdate, '%Y.%m.%d') wdate, hit from m_board where subject='1' order by seq desc";
		ArrayList<BoardTO> lists = (ArrayList<BoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class) );
		
		return lists;		
	}
	
	public ArrayList<BoardTO> mboardListTrade() {
		
		String sql = "select seq, subject, writer, title, date_format(wdate, '%Y.%m.%d') wdate, hit from m_board where subject='3' order by seq desc";
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
		
		String sql = "update m_board set hit=hit+1 where seq=?";

		int result = jdbcTemplate.update(sql, to.getSeq() );
		
		sql = "select seq, subject, title, writer, content, date_format(wdate, '%Y-%m-%d') wdate, hit from m_board where seq=?";		
		to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class), to.getSeq() );
		
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
