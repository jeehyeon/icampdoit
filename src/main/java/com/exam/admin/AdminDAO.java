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
import com.exam.mboard.FileTO;
import com.exam.nboard.NBoardTO;
import com.exam.nboard.NFileTO;
import com.exam.nboard.NListTO;

@Repository
public class AdminDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	String url = System.getProperty("user.dir");
	private String hUploadPath = url + "/src/main/webapp/h_upload/";
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
		//System.out.println("dao 리스트 : " + lists);
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
	
	//h-modify_ok
	public int hboardModifyOk(HBoardTO to) {
			
		int flag = 1;	
		/*if( to.getFilename() != null ){
			try {
				String sql = "select filename as oldFilename from h_board where seq=?";		
				to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<HBoardTO>(HBoardTO.class), to.getSeq() );
				System.out.println("to 결과값 : " + to);
				flag = 0;
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				System.out.println("파일이름 찾기 오류");
				return flag;
			} 
		}	*/	
		String oldFilename = to.getFilename();
		System.out.println("oldFilename : " + to.getFilename());
		System.out.println("새파일이름 : " + to.getNewFilename());
		
		int result = 0;							
		
		// 새파일 첨부시
		if( !to.getNewFilename().equals("default") ){
			String	sql = "update h_board set subject=?, title=?, writer=?, content=?, filename=?, filesize=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(), to.getNewFilename(),
					to.getNewFilesize(), to.getSeq(), to.getUcode() );
			System.out.println("dao1 result : " + result);
		// 기존 파일 그대로일 경우
		} else if( to.getContent().indexOf(to.getFilename()) != -1) {
			String	sql = "update h_board set subject=?, title=?, writer=?, content=?, filename=?, filesize=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(), to.getFilename(), to.getFilesize(), to.getSeq(), to.getUcode() );
			result = 2;
			System.out.println("dao2 result : " + result);
			System.out.println("dao2 filename : " + to.getFilename());
		// 기존 파일 삭제시
		}  else if( to.getContent().indexOf(to.getFilename()) == -1) {
			String	sql = "update h_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(), to.getSeq(), to.getUcode() );
			result = 3;
			System.out.println("dao3 result : " + result);
		}
		System.out.println("dao result : " + result);
	
		
		if( result == 0 ) {
			flag = 1;// 비정상 실행
			// 새로운 파일 삭제
			if( to.getNewFilename() != "default" ) {
				String delurl = hUploadPath + to.getNewFilename();
				System.out.println("delurl : " + delurl);
				File file  = new File(delurl);
				file.delete(); 
				System.out.println("새 파일 삭제완료 : ");
			}
		} else if( result == 1 ) {
			flag = 0;// 정상 실행
			// 새파일 첨부시 -> 기존 파일 삭제
			if( !to.getNewFilename().equals("default") && oldFilename != null ) {
				String delurl = hUploadPath + oldFilename;
				File file  = new File(delurl);
				file.delete();
				System.out.println("기존 파일 삭제완료 : ");
			}
		} else if( result == 2 ) {
			flag = 0;
			System.out.println("파일 그대로일 경우 : ");
		} else if( result == 3 ) { 
			flag = 0;			
			String delurl = hUploadPath + oldFilename;
			System.out.println("delurl : " + delurl);
			File file  = new File(delurl);
			file.delete(); 			
			System.out.println("기존 파일 삭제시 작동 : ");
		}
		return flag;
	}
	
	//n-modify
	public NBoardTO nboardModify(NBoardTO to) {		
			
		String sql = "select * from n_board where seq=?";		
		to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<NBoardTO>(NBoardTO.class), to.getSeq() );		
	
		return to;		

	}
	
	//공지사항 파일찾기
	public NFileTO findNFile(NBoardTO nto) {
		
		NFileTO nfto = new NFileTO();
		
		String sql = "select * from n_file where nseq=?";
		try {
			nfto = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<NFileTO>(NFileTO.class), nto.getSeq() );
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			//nfto.setFilename("null");
			System.out.println("공지 게시글에 파일없음 ");
		}
		return nfto;
	}
	
	//n-modify_ok
	public int nboardModifyOk(NBoardTO nto, NFileTO nfto) {
			
		int flag = 1;	
		/*if( nfto.getFilename() != null ){
			try {
				String sql = "select filename from h_board where pseq=?";		
				nfto = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<NFileTO>(NFileTO.class), nto.getSeq() );
				System.out.println("nfto 결과값 : " + nfto);
				flag = 0;
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				System.out.println("파일이름 찾기 오류");
				return flag;
			} 
		}	*/
		String oldFilename = nfto.getFilename();
		System.out.println("oldFilename : " + nfto.getFilename());
		System.out.println("새파일이름 : " + nfto.getNewFilename());
		
		int result = 0;	
		String nseq;
		
		// 새파일 첨부시
		if( !nfto.getNewFilename().equals("default") ){
			String	sql = "update n_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, nto.getSubject(), nto.getTitle(), nto.getWriter(), nto.getContent(),
					 nto.getSeq(), nto.getUcode() );
			result = 5;
			System.out.println("1result : "+result);
			
			// 새파일 첨부하고 저장까지 한 경우
			if( nto.getContent().indexOf(nfto.getNewFilename()) != -1) {
				sql = "update n_file set filename=?, filesize=? where nseq=?";
				result = jdbcTemplate.update(sql, nfto.getNewFilename(), nfto.getNewFilesize(), nto.getSeq());
				result = 1;
				System.out.println("2result : "+result);
			}
			if( result != 1 ) {
				System.out.println("fileinsert 오류");
				flag = 1;
			}else {
				flag = 0;
			}			
			
			System.out.println("dao1 result : " + result);
		// 기존 파일 그대로일 경우
		} else if( nto.getContent().indexOf(nfto.getFilename()) != -1) {
			String	sql = "update n_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, nto.getSubject(), nto.getTitle(), nto.getWriter(), nto.getContent(),
					 nto.getSeq(), nto.getUcode() );
			System.out.println("2result : "+result);
			result = 2;
			System.out.println("dao2 result : " + result);
		// 기존 파일 삭제 또는 원래 파일이 없을 경우
		} else if( nto.getContent().indexOf(nfto.getFilename()) == -1) {
			//System.out.println("3seq : "+nto.getSeq());
			//System.out.println("3ucode : "+nto.getUcode());
			String	sql = "update n_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, nto.getSubject(), nto.getTitle(), nto.getWriter(), nto.getContent(),
					 nto.getSeq(), nto.getUcode() );
			result = 4;
			System.out.println("3result : "+result);
			
			if( oldFilename != null ) {
				try {
					//sql = "select seq from n_board where vcode=?";
					//nseq = jdbcTemplate.queryForObject(sql, String.class, nto.getVcode());
					//System.out.println("3nseq : "+nseq);
				
					sql = "delete from n_file where nseq=?";
					result = jdbcTemplate.update(sql, nto.getSeq());		
					System.out.println("3result : "+result);
					result = 3;
					System.out.println("dao3 result : " + result);
				} catch (DataAccessException e) {
					//return result;
				}
			}
		} else if( nto.getContent().indexOf(nfto.getNewFilename()) == -1) {
			String	sql = "update n_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, nto.getSubject(), nto.getTitle(), nto.getWriter(), nto.getContent(),
					 nto.getSeq(), nto.getUcode() );
			result = 4;
			System.out.println("3result : "+result);
	
		} 
		System.out.println("dao result : " + result);	
		
		if( result == 0 ) {
			flag = 1;// 비정상 실행
			// 새로운 파일 삭제
			if( nfto.getNewFilename() != "default" ) {
				String delurl = nUploadPath + nfto.getNewFilename();
				System.out.println("delurl : " + delurl);
				File file  = new File(delurl);
				file.delete(); 
				System.out.println("새 파일 삭제완료 : ");
			}
		} else if( result == 1 ) {
			flag = 0;// 정상 실행
			// 새파일 첨부시 -> 기존 파일 삭제
			if( !nfto.getNewFilename().equals("default") && oldFilename != null ) {
				String delurl = nUploadPath + oldFilename;
				File file  = new File(delurl);
				file.delete();
				System.out.println("기존 파일 삭제완료 : ");
			}
		} else if( result == 2 ) {
			flag = 0;
			System.out.println("파일 그대로일 경우 : ");
		} else if( result == 3 ) { 
			flag = 0;			
			String delurl = nUploadPath + oldFilename;
			System.out.println("delurl : " + delurl);
			File file  = new File(delurl);
			file.delete(); 			
			System.out.println("기존 파일 삭제시 작동 : ");
		} else if( result == 4 ) { 
			flag = 0;
			System.out.println("원래 파일이 없었음 : ");
		} else if( result == 5 ) { 
			flag = 0;			
			String delurl = nUploadPath + nfto.getNewFilename();
			System.out.println("delurl : " + delurl);
			File file  = new File(delurl);
			file.delete(); 			
			System.out.println("임시파일 삭제 ");
		}
		return flag;
	}

}
