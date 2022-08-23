package com.exam.admin;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.exam.hboard.HBoardTO;
import com.exam.nboard.NBoardTO;
import com.exam.nboard.NFileTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	String url = System.getProperty("user.dir");
	private String nUploadPath = url + "/src/main/webapp/n_upload/";
	
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
	
	//AdminListTO
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
	
	//h-modify
	public HBoardTO hboardModify(HBoardTO to) {		
			
		String sql = "select seq, subject, title, writer, content, ucode, filename, filesize, vcode from h_board where seq=?";		
		try {
			to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<HBoardTO>(HBoardTO.class), to.getSeq() );
		} catch (EmptyResultDataAccessException e) {
			// TODO Auto-generated catch block
			System.out.println("[에러]" + e.getMessage());
			to.setFilename("null");			
		}
	
		return to;
	}
	

		
	//h-modify_ok
	public int hboardModifyOk(HBoardTO to) {
			
		int flag = 1;	
	
		String oldFilename = to.getFilename();
		
		if(to.getFilename() !=null) {
			if(to.getContent().indexOf(to.getFilename()) == -1) {
				to.setFilename(null);
				to.setFilesize(0);
			}
		}
		
		
		int result = 0;		
		
		//새파일 첨부시
		String	sql = "update h_board set subject=?, title=?, writer=?, content=?, filename=?, filesize=? where seq=? and ucode=?";
		result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(), to.getFilename(),
				to.getFilesize(), to.getSeq(), to.getUcode() );
		
		if(result == 1) {
			flag = 0;
		}
		
		return flag;
	}
	
	//n-modify
	public NBoardTO nboardModify(NBoardTO to) {		
			
		String sql = "select * from n_board where seq=?";		
		to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<NBoardTO>(NBoardTO.class), to.getSeq() );		
	
		return to;		

	}
	
	public int nboardModifyOk1(NBoardTO to) {
		int flag = 1;
		String	sql = "update n_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
		int result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(),
				to.getSeq(), to.getUcode() );
		if(result == 1) {
			flag=0;
		}
		return flag;
	}
	public int nboardModifyOk2(NBoardTO to, NFileTO fto) {
		int flag = 0;
		int result = 0;

		if(to.getContent().indexOf(fto.getFilename()) == -1) {
			String sql ="delete from n_file where nseq=? and filename=?";
			result = jdbcTemplate.update(sql, to.getSeq(), fto.getFilename());	
		}
		if(result == 0) {
			flag=0;
		}else {
			flag=1;
		}
		return flag;
	}
	
	public int nboardModifyOk3(NBoardTO to, NFileTO fto) {
		int flag = 0;
		int result = 1;
		if(to.getContent().indexOf(fto.getFilename()) != -1) {
			String sql ="insert into n_file values ( 0, ?, ?, ? )";
			result = jdbcTemplate.update(sql, to.getSeq(), fto.getFilename(), fto.getFilesize());
		}
		if(result == 1) {
			flag=0;
		}else {
			flag=1;
		}
		return flag;
	}
	
	//공지사항 파일찾기
	public ArrayList<NFileTO> findNFile(NBoardTO nto) {
		
		ArrayList<NFileTO> fileArr = new ArrayList<NFileTO>();
		String sql = "select * from n_file where nseq=?";
		try {
			fileArr = (ArrayList<NFileTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<NFileTO>(NFileTO.class), nto.getSeq() );
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			System.out.println("공지 게시글에 파일없음 ");
		}
		return fileArr;
	}
		
	//n-modify_ok
	public int nboardModifyOk(NBoardTO nto, NFileTO nfto) {
			
		int flag = 1;	

		String oldFilename = nfto.getFilename();
		
		int result = 0;	
		
		// 새파일 첨부시 -> 기존파일 삭제되어야함
		if( !nfto.getNewFilename().equals("default") ){
			String	sql = "update n_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, nto.getSubject(), nto.getTitle(), nto.getWriter(), nto.getContent(),
					 nto.getSeq(), nto.getUcode() );
			result = 1;			
			
			// 기존 텍스트 -> 새파일 첨부시 : n_file insert
			if( nto.getContent().indexOf( nfto.getNewFilename() ) != -1 && nfto.getFilesize() == 0  ) {
				sql = "insert into n_file values ( 0, ?, ?, ? )";
				result = jdbcTemplate.update(sql, nto.getSeq(), nfto.getNewFilename(), nfto.getNewFilesize());
				result = 3;
			}
			// 기존파일 -> 새파일 첨부하고 저장까지 한 경우 : n_file 업데이트
			else if( nto.getContent().indexOf( nfto.getNewFilename()) != -1 && oldFilename != null ) {
				sql = "update n_file set filename=?, filesize=? where nseq=?";
				result = jdbcTemplate.update(sql, nfto.getNewFilename(), nfto.getNewFilesize(), nto.getSeq());
				result = 1;
			
			// 새파일이 추가하고 저장전에 지웠을 경우	
			} else if( !nfto.getNewFilename().equals("default") && nto.getContent().indexOf(nfto.getNewFilename()) == -1) {
				sql = "update n_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
				result = jdbcTemplate.update(sql, nto.getSubject(), nto.getTitle(), nto.getWriter(), nto.getContent(),
						 nto.getSeq(), nto.getUcode() );
				result = 4;
			} 				
			
			if( result != 1 ) {
				// fileinsert 오류
				flag = 1;
			}else {
				flag = 0;
			}						
			
		// 기존 파일 그대로일 경우
		} else if( nto.getContent().indexOf(nfto.getFilename()) != -1) {
			String	sql = "update n_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, nto.getSubject(), nto.getTitle(), nto.getWriter(), nto.getContent(),
					 nto.getSeq(), nto.getUcode() );
			result = 2;
			
		// 기존 파일 삭제 또는 원래 파일이 없을 경우
		} else if( nto.getContent().indexOf(nfto.getFilename()) == -1) {
			String	sql = "update n_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, nto.getSubject(), nto.getTitle(), nto.getWriter(), nto.getContent(),
					 nto.getSeq(), nto.getUcode() );
			result = 3;
			
			if( oldFilename != null ) {
				try {
					sql = "delete from n_file where nseq=?";
					result = jdbcTemplate.update(sql, nto.getSeq());		
					result = 1;
				} catch (DataAccessException e) {
				}
			}
			
		} 
		
		if( result == 0 ) {
			flag = 1;// 비정상 실행
			// 새로운 파일 삭제
			if( nfto.getNewFilename() != "default" ) {
				String delurl = nUploadPath + nfto.getNewFilename();
				File file  = new File(delurl);
				file.delete(); 
			}
		} else if( result == 1 ) {
			flag = 0;// 정상 실행
			// 새파일 첨부시 -> 기존 파일 삭제
			if( oldFilename != null ) {
				String delurl = nUploadPath + oldFilename;
				File file  = new File(delurl);
				file.delete();
			}
		} else if( result == 2 ) {
			// n파일 그대로일 경우
			flag = 0;
		} else if( result == 3 ) { 
			// n원래 파일이 없었음
			flag = 0;
		} else if( result == 4 ) { 
			// n임시파일 삭제
			flag = 0;			
			String delurl = nUploadPath + nfto.getNewFilename();
			File file  = new File(delurl);
			file.delete(); 			
		}
		return flag;
	}

}
