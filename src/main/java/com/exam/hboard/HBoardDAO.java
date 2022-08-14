package com.exam.hboard;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.exam.login.SignUpTO;
import com.exam.mboard.BoardTO;
import com.exam.mboard.FileTO;
import com.exam.nboard.NBoardTO;
import com.exam.nboard.NFileTO;

@Repository
public class HBoardDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	String url = System.getProperty("user.dir");
	private String hUploadPath = url +"/src/main/webapp/h_upload/";

	// write_ok
	public int aboardWriteOk(HBoardTO hto) {			
		
		int flag = 1;
		
		SignUpTO sto = new SignUpTO();
		
		String sql = "insert into h_board values  ( 0, ?, ?, ?, ?, now(), 0, ?, ?, ?, ?)";
		int result = jdbcTemplate.update(sql, hto.getSubject(), hto.getTitle(), hto.getWriter(), hto.getContent(), 
				hto.getUcode(), hto.getFilename(), hto.getFilesize(), hto.getVcode() );
					System.out.println("dao result "+ result);
					
		if( result != 1 ) {
			System.out.println("h_board insert 오류");
			return flag;	
		}else {
			flag=0;
		}
		String pseq;
		System.out.println("vcode : " + hto.getVcode());
		
		return flag;		
	}
	
	//파일 검사 및 이동
	public void filecnd(HBoardTO hto) {
		//삭제했을 경우 임시 파일 삭제
		if(hto.getContent().indexOf(hto.getFilename()) == -1) {
			String delurl = hUploadPath + hto.getFilename();
			File delFile = new File(delurl);
			if(delFile.exists()) {//파일이 존재하는지 확인
				delFile.delete();
				System.out.println("임시파일 삭제 성공");
				
			}else {
				System.out.println("파일이 존재 하지 않습니다.");
			}
		
		}
	}
	//글작성하다가 취소 눌렀을 경우 파일 삭제
	public void filedel(String filename) {
		//삭제했을 경우 임시 파일 삭제
		System.out.println("파일삭제 메서드 : " + filename);
		if(filename != "default") {
			String delurl = hUploadPath + filename;
			File delFile = new File(delurl);
			if(delFile.exists()) {//파일이 존재하는지 확인
				delFile.delete();
				System.out.println("임시파일 삭제 성공");
				
			}else {
				System.out.println("파일이 존재 하지 않습니다.");
			}
		
		}
	}
	
	// listTO
	public HBoardListTO boardList(HBoardListTO listTO) {
		
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();// 한페이지에 글 개수 5*2=10개
		int blockPerPage = listTO.getBlockPerPage();// 한 화면에 보이는 페이지수 5개
		
		String sql = "select seq, subject, title, writer, content, date_format(wdate, '%Y-%m-%d') wdate, hit, ucode, filename, filesize, vcode from h_board order by seq desc";
		ArrayList<HBoardTO> boardLists = (ArrayList<HBoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<HBoardTO>(HBoardTO.class) );
		
		// 총 게시글 수 얻기
		listTO.setTotalRecord( boardLists.size() );
		
		// 총 페이지 수 얻기(skip은 시작번호)
		listTO.setTotalPage( ( (listTO.getTotalRecord() -1 ) / recordPerPage ) + 1 );		
		int skip = ( cpage - 1 ) * recordPerPage;		
		
		ArrayList<HBoardTO> lists = new ArrayList<HBoardTO>();		
		for( int i=0; i<recordPerPage ; i++ ) {
			if( skip+i != boardLists.size() ) {
				HBoardTO to = new HBoardTO();
				to.setSeq( boardLists.get(skip+i).getSeq() );
				to.setSubject( boardLists.get(skip+i).getSubject() );
				to.setTitle( boardLists.get(skip+i).getTitle() );				
				to.setWriter( boardLists.get(skip+i).getWriter() );
				to.setContent( boardLists.get(skip+i).getContent() );
				to.setWdate( boardLists.get(skip+i).getWdate() );
				to.setHit( boardLists.get(skip+i).getHit() );
				to.setUcode( boardLists.get(skip+i).getUcode() );
				to.setFilename( boardLists.get(skip+i).getFilename() );
				to.setFilesize( boardLists.get(skip+i).getFilesize() );
				to.setVcode( boardLists.get(skip+i).getVcode() );
				
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
	
	public HBoardTO boardview( HBoardTO to ) {
		
		String sql = "update h_board set hit=hit+1 where seq=?";

		int result = jdbcTemplate.update(sql, to.getSeq() );
		
		sql = "select seq, subject, title, writer, content, date_format(wdate, '%Y-%m-%d') wdate, hit from h_board where seq=?";		
		to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<HBoardTO>(HBoardTO.class), to.getSeq() );
		
		return to;
	}
	
	//게시글 ucode 찾기
	public HBoardTO findViewUcode(HBoardTO to) {

		String sql = "select ucode from h_board where seq=?";
		to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<HBoardTO>(HBoardTO.class), to.getSeq() );
		System.out.println("findViewUcode 성공");	
		return to;	
	}
	
	// 파일체크
	public HBoardTO hboardDelFileCheck(HBoardTO to) {
		//삭제했을 경우 임시 파일 삭제
		//System.out.println("파일삭제 메서드 : " + filename);
		String sql = "select filename from h_board where seq=?";
		try {
			to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<HBoardTO>(HBoardTO.class), to.getSeq() );
		} catch (DataAccessException e) {
			// TODO Auto-generated catch block
			to.setFilename("null");
		}
		
		return to;	
	}
	
	//게시글 삭제메서드
	public int fileDBDel(HBoardTO to) {
		//삭제했을 경우 임시 파일 삭제
		//System.out.println("파일삭제 메서드 : " + filename);
		int flag = 1;
		
		String sql = "delete from h_board where seq=?";
		int result = jdbcTemplate.update(sql, to.getSeq());
		System.out.println("fileDBDel seq : " + to.getSeq());
		System.out.println("fileDBDel flag : " + flag);
		if( result != 1 ) {
			System.out.println("filedbDel() 오류");
		}else {
			flag = 0;
		}
		
		return flag;
	}
	
	
	// delete_ok
	public int hboardDeleteOk(HBoardTO to) {
		
		int flag = 2;
		
		String sql = "delete from h_board where seq=?";
		int result = jdbcTemplate.update(sql, to.getSeq() );
	
		if(result == 0) {
			System.out.println("hboardDeleteOk 오류");
			flag=1;
		}else {
			flag=0;
		}
	
		return flag;
	}
	
}
