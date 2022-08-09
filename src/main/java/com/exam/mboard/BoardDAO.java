package com.exam.mboard;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
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
		
		
		int flag = 1;
		
		SignUpTO sto = new SignUpTO();
		
		String sql = "insert into m_board values  ( 0, ?, ?, ?, ?, now(), 0, ?, 0, ?)";
		int result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(), to.getUcode(), to.getVcode());
					System.out.println(result);
					
		//위에 들어가 부분에 seq값을 다시 들고 나와야 함
		if( result != 1 ) {
			System.out.println("m_board insert 오류");
			return flag;	
		}else {
			flag=0;
		}
		String pseq;
		System.out.println("vcode : " + to.getVcode());
		
		//파일이 있으면 진행 없으면 진행 X
		
		if(to.getContent().indexOf(fto.getFilename()) != -1) {
			try {
				sql = "select seq from m_board where vcode=?";
				pseq = jdbcTemplate.queryForObject(sql, String.class, to.getVcode());
				System.out.println("pseq 결과값 : " + pseq);
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				System.out.println("seq값 찾기 오류");
				return flag;
			}

						
			sql = "insert into m_file values ( 0, ?, ?, ? )";
			result = jdbcTemplate.update(sql, pseq, fto.getFilename(), fto.getFilesize());
	
			if( result != 1 ) {
				System.out.println("fileinsert 오류");
				flag = 1;
			}else {
				flag=0;
			}
		
		};
		
		return flag;		
	}
	
	// list
	public ArrayList<BoardTO> mboardList() {
				
		String sql = "select seq, subject, writer, title, date_format(wdate, '%Y.%m.%d') wdate, hit, ucode from m_board order by seq desc";
		ArrayList<BoardTO> lists = (ArrayList<BoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class) );
		
		return lists;		
	}
	
	
	public ArrayList<BoardTO> mboardListFree(BoardTO to) {
		
		String sql = "select seq, subject, writer, title, date_format(wdate, '%Y.%m.%d') wdate, hit, ucode from m_board where subject=? order by seq desc";
		ArrayList<BoardTO> lists = (ArrayList<BoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class), to.getSubject() );
		
		return lists;		
	}
	
	/*
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
	*/
	
	// listTO
	public BoardListTO mboardList(BoardListTO listTO, int subjectValue ) {
		
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();// 한페이지에 글 개수 5*2=10개
		int blockPerPage = listTO.getBlockPerPage();// 한 화면에 보이는 페이지수 5개
		
		String sql = "select seq, subject, title, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, ucode from m_board where subject=? order by seq desc";
		ArrayList<BoardTO> boardLists = (ArrayList<BoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class), subjectValue );
		
		// 총 게시글 수 얻기
		listTO.setTotalRecord( boardLists.size() );
		
		// 총 페이지 수 얻기(skip은 시작번호)
		listTO.setTotalPage( ( (listTO.getTotalRecord() -1 ) / recordPerPage ) + 1 );		
		int skip = ( cpage - 1 ) * recordPerPage;		
		
		ArrayList<BoardTO> lists = new ArrayList<BoardTO>();		
		for( int i=0; i<recordPerPage ; i++ ) {
			if( skip+i != boardLists.size() ) {
				BoardTO to = new BoardTO();
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
	
	public BoardListTO mboardSubjectChange(BoardListTO blistTO, BoardTO to ) {
		int cpage = blistTO.getCpage();
		int recordPerPage = blistTO.getRecordPerPage();// 한페이지에 글 개수 5*2=10개
		int blockPerPage = blistTO.getBlockPerPage();// 한 화면에 보이는 페이지수 5개
		
		
		String sql = "select seq, subject, title, writer, date_format(wdate, '%Y-%m-%d') wdate, hit, ucode from m_board where subject=? order by seq desc";
		ArrayList<BoardTO> boardLists = (ArrayList<BoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class), to.getSubject() );
		
		// 총 게시글 수 얻기
		blistTO.setTotalRecord( boardLists.size() );
		
		// 총 페이지 수 얻기(skip은 시작번호)
		blistTO.setTotalPage( ( (blistTO.getTotalRecord() -1 ) / recordPerPage ) + 1 );		
		int skip = ( cpage - 1 ) * recordPerPage;		
		
		ArrayList<BoardTO> lists = new ArrayList<BoardTO>();		
		for( int i=0; i<recordPerPage ; i++ ) {
			if( skip+i != boardLists.size() ) {
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
		
		blistTO.setBoardLists( lists );
		blistTO.setStartBlock( ( ( cpage-1 ) / blockPerPage ) * blockPerPage + 1);
		blistTO.setEndBlock( ( (cpage-1) / blockPerPage) * blockPerPage + blockPerPage);
		if(blistTO.getEndBlock() >= blistTO.getTotalPage()) {
			blistTO.setEndBlock(blistTO.getTotalPage());
		}		
		return blistTO;
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
	
	//파일 검사 및 이동
	public void filecnd(BoardTO to, FileTO fto) {
		//삭제했을 경우 임시 파일 삭제
		if(to.getContent().indexOf(fto.getFilename()) == -1) {
			String delurl = "C:/Users/kkk/Documents/Git/src/main/webapp/upload/" + fto.getFilename();
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
				String delurl = "C:/Users/kkk/Documents/Git/src/main/webapp/upload/" + filename;
				File delFile = new File(delurl);
				if(delFile.exists()) {//파일이 존재하는지 확인
					delFile.delete();
					System.out.println("임시파일 삭제 성공");
					
				}else {
					System.out.println("파일이 존재 하지 않습니다.");
				}
			
			}
		}

}
