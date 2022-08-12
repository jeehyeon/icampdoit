package com.exam.admin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.exam.hboard.HBoardListTO;
import com.exam.hboard.HBoardTO;
import com.exam.mboard.BoardListTO;
import com.exam.mboard.BoardTO;
import com.exam.nboard.NBoardTO;
import com.exam.nboard.NListTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// listTO
	public AdminListTO mboardList(AdminListTO listTO, String subjectValue ) {
		
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();// 한페이지에 글 개수 5*2=10개
		int blockPerPage = listTO.getBlockPerPage();// 한 화면에 보이는 페이지수 5개
		
		String sql = "select seq, subject, title, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, ucode from m_board where subject=? order by seq desc";
		ArrayList<AdminTO> boardLists = (ArrayList<AdminTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<AdminTO>(AdminTO.class), subjectValue );
		
		// 총 게시글 수 얻기
		listTO.setTotalRecord( boardLists.size() );
		
		// 총 페이지 수 얻기(skip은 시작번호)
		listTO.setTotalPage( ( (listTO.getTotalRecord() -1 ) / recordPerPage ) + 1 );		
		int skip = ( cpage - 1 ) * recordPerPage;		
		
		ArrayList<AdminTO> lists = new ArrayList<AdminTO>();		
		for( int i=0; i<recordPerPage ; i++ ) {
			if( skip+i != boardLists.size() ) {
				AdminTO to = new AdminTO();
				to.setSeq( boardLists.get(skip+i).getSeq() );
				to.setSubject( boardLists.get(skip+i).getSubject() );
				to.setTitle( boardLists.get(skip+i).getTitle() );
				to.setWriter( boardLists.get(skip+i).getWriter() );
				to.setWdate( boardLists.get(skip+i).getWdate() );
				to.setHit( boardLists.get(skip+i).getHit() );
				to.setUcode( boardLists.get(skip+i).getUcode() );
				
				lists.add(to);
				
			} else { break; }
		}
		
		listTO.setBoardLists( lists );
		listTO.setStartBlock( ( ( cpage-1 ) / blockPerPage ) * blockPerPage + 1);
		listTO.setEndBlock( ( (cpage-1) / blockPerPage) * blockPerPage + blockPerPage);
		if(listTO.getEndBlock() >= listTO.getTotalPage()) {
			listTO.setEndBlock(listTO.getTotalPage());
		}		
		return listTO;
	}
		
	// listTO
	public AdminListTO hboardList(AdminListTO listTO, String subjectValue ) {
		
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();// 한페이지에 글 개수 5*2=10개
		int blockPerPage = listTO.getBlockPerPage();// 한 화면에 보이는 페이지수 5개
		
		String sql = "select seq, subject, title, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, ucode from h_board where subject=? order by seq desc";
		ArrayList<AdminTO> boardLists = (ArrayList<AdminTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<AdminTO>(AdminTO.class), subjectValue );
		
		// 총 게시글 수 얻기
		listTO.setTotalRecord( boardLists.size() );
		
		// 총 페이지 수 얻기(skip은 시작번호)
		listTO.setTotalPage( ( (listTO.getTotalRecord() -1 ) / recordPerPage ) + 1 );		
		int skip = ( cpage - 1 ) * recordPerPage;		
		
		ArrayList<AdminTO> lists = new ArrayList<AdminTO>();		
		for( int i=0; i<recordPerPage ; i++ ) {
			if( skip+i != boardLists.size() ) {
				AdminTO to = new AdminTO();
				to.setSeq( boardLists.get(skip+i).getSeq() );
				to.setSubject( boardLists.get(skip+i).getSubject() );
				to.setTitle( boardLists.get(skip+i).getTitle() );
				to.setWriter( boardLists.get(skip+i).getWriter() );
				to.setWdate( boardLists.get(skip+i).getWdate() );
				to.setHit( boardLists.get(skip+i).getHit() );
				to.setUcode( boardLists.get(skip+i).getUcode() );
				
				lists.add(to);
				
			} else { break; }
		}
		
		listTO.setBoardLists( lists );
		listTO.setStartBlock( ( ( cpage-1 ) / blockPerPage ) * blockPerPage + 1);
		listTO.setEndBlock( ( (cpage-1) / blockPerPage) * blockPerPage + blockPerPage);
		if(listTO.getEndBlock() >= listTO.getTotalPage()) {
			listTO.setEndBlock(listTO.getTotalPage());
		}		
		return listTO;

	}
	
	//NBoardList(페이지)
	public AdminListTO nboardList( AdminListTO listTO, String subjectValue ) {
		
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();
		
		String sql = "select seq, subject, title, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, ucode from n_board where subject=? order by seq desc";
		ArrayList<AdminTO> boardLists = (ArrayList<AdminTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<AdminTO>(AdminTO.class), subjectValue );
		
		listTO.setTotalRecord( boardLists.size() );
		
		listTO.setTotalPage( ( (listTO.getTotalRecord() -1 ) / recordPerPage ) + 1 );		
		int skip = ( cpage - 1 ) * recordPerPage;	
		
		ArrayList<AdminTO> lists = new ArrayList<AdminTO>();		
		for( int i=0; i<recordPerPage ; i++ ) {
			if( skip+i != boardLists.size() ) {
				AdminTO to = new AdminTO();
				to.setSeq( boardLists.get(skip+i).getSeq() );
				to.setSubject( boardLists.get(skip+i).getSubject() );
				to.setTitle( boardLists.get(skip+i).getTitle() );
				to.setWriter( boardLists.get(skip+i).getWriter() );
				to.setWdate( boardLists.get(skip+i).getWdate() );
				to.setHit( boardLists.get(skip+i).getHit() );
				to.setUcode( boardLists.get(skip+i).getUcode() );
				
				lists.add(to);
				
			} else { break; }
		}
		
		listTO.setBoardLists( lists );
		listTO.setStartBlock( ( ( cpage-1 ) / blockPerPage ) * blockPerPage + 1);
		listTO.setEndBlock( ( (cpage-1) / blockPerPage) * blockPerPage + blockPerPage);
		if(listTO.getEndBlock() >= listTO.getTotalPage()) {
			listTO.setEndBlock(listTO.getTotalPage());
		}		
		return listTO;
		
	}
	


}
