package com.exam.admin;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
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
	
	String url = System.getProperty("user.dir");
	private String hUploadPath = url + "/src/main/webapp/h_upload/";
	
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
		System.out.println("dao 리스트 : " + lists);
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
		System.out.println("dao 리스트 : " + lists);
		listTO.setBoardLists( lists );
		listTO.setStartBlock( ( ( cpage-1 ) / blockPerPage ) * blockPerPage + 1);
		listTO.setEndBlock( ( (cpage-1) / blockPerPage) * blockPerPage + blockPerPage);
		if(listTO.getEndBlock() >= listTO.getTotalPage()) {
			listTO.setEndBlock(listTO.getTotalPage());
		}		
		return listTO;
		
	}
	
	//modify
	public HBoardTO boardModify(HBoardTO to) {		
			
		String sql = "select seq, subject, title, writer, content, ucode, filename, filesize vcode from h_board where seq=?";		
		try {
			to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<HBoardTO>(HBoardTO.class), to.getSeq() );
		} catch (EmptyResultDataAccessException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러]" + e.getMessage());
			to.setFilename("null");			
		}
	
		return to;
	}
	
	//modify_ok
	public int boardModifyOk(HBoardTO to) {
	
		int flag = 1;
		
		HBoardTO to1 = new HBoardTO();
		
		if( to1.getFilename() != null ){
			try {
				String sql = "select filename from h_board where seq=?";		
				to1 = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<HBoardTO>(HBoardTO.class), to.getSeq() );
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				System.out.println("파일이름 찾기 오류");
				return flag;
			} 
		}		
		
		String oldFilename = to1.getFilename();
		
		int result = 0;		
		
		if( to.getFilename() != null ){
			String	sql = "update h_board set subject=?, title=?, writer=?, content=?, filename= ?, filesize=?, vcode=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(), to.getNewFilename(),
					to.getNewFilesize(), to.getVcode(), to.getSeq(), to.getUcode() );
		} else {
			String	sql = "update h_board set subject=?, title=?, writer=?, content=?, vcode=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(), to.getVcode(), to.getSeq(), to.getUcode() );
		}
		System.out.println("dao result : " + result);
		
		if( result == 0 ) {
			flag = 1;// 비정상 실행
			//새로운 파일 삭제
			if( to.getFilename() != null ) {
				String delurl = hUploadPath + to.getFilename();
				System.out.println("delurl : " + delurl);
				File file  = new File(delurl);
				file.delete(); 
			}
		} else if( result == 1 ) {
			flag =0;// 정상 실행
			//기존 파일 삭제
			if( to.getFilename() != null && oldFilename != null ) {
				String delurl = hUploadPath + oldFilename;
				File file  = new File(delurl);
				file.delete();
			}
		}	
		return flag;
	}

}
