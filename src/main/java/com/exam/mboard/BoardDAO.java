package com.exam.mboard;

import java.io.File;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import com.exam.login.SignUpTO;

@Repository
public class BoardDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	String url = System.getProperty("user.dir");
	private String mUploadPath = url +"/src/main/webapp/upload/";	
		
	// write_ok
	public int mboardWriteOk(BoardTO to) {	
				
		int flag = 1;
		
		SignUpTO sto = new SignUpTO();
		
		String sql = "insert into m_board values  ( 0, ?, ?, ?, ?, now(), 0, ?, 0, ?)";
		int result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(), to.getUcode(), to.getVcode());
					
		//위에 들어가 부분에 seq값을 다시 들고 나와야 함
		if( result != 1 ) {
			System.out.println("m_board insert 오류");
			return flag;	
		}else {
			flag=0;
		}
		String pseq;
		
		return flag;
	};
		//파일이 있으면 진행 없으면 진행 X
	public int mboardWriteFileOk(BoardTO to, FileTO fto) {	
		
		int flag = 1;
		String sql="";
		String pseq="";
		
		if(to.getContent().indexOf(fto.getFilename()) != -1) {
			try {
				sql = "select seq from m_board where vcode=?";
				pseq = jdbcTemplate.queryForObject(sql, String.class, to.getVcode());
			} catch (DataAccessException e) {
				System.out.println("seq값 찾기 오류");
				return flag;
			}
						
			sql = "insert into m_file values ( 0, ?, ?, ? )";
			int result = jdbcTemplate.update(sql, pseq, fto.getFilename(), fto.getFilesize());
	
			if( result != 1 ) {
				System.out.println("fileinsert 오류");
				flag = 1;
			}else {
				flag=0;
			}
		
		};
		
		return flag;		
	}
	
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
		
		sql = "select seq, subject, title, writer, content, date_format(wdate, '%Y-%m-%d') wdate, hit, ucode from m_board where seq=?";		
		to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class), to.getSeq() );
		
		return to;
	}
	
	//view Comment
	public ArrayList<CmtTO> mboardViewComment( CmtTO cto ){
		
		String sql = "select seq, pseq, writer, content, date_format(wdate, '%Y.%m.%d %H:%i') wdate, ucode from m_cmt where pseq=? order by seq asc";
		ArrayList<CmtTO> lists = (ArrayList<CmtTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<CmtTO>(CmtTO.class), cto.getPseq());
				
		return lists;
		
	}
	
	//write Comment
	public int mboardWriteComment( CmtTO cto ) {
		
		int flag = 1;
		
		String sql = "insert into m_cmt values ( 0, ?, ?, ?, now(), ?)";
		int result = jdbcTemplate.update(sql, cto.getPseq(), cto.getWriter(), cto.getContent(), cto.getUcode() );

		if( result != 1 ) {
			System.out.println("m_cmt insert 오류");
		}else {
			flag=0;
		}
		
		return flag;
	}
	//delete Comment
	public int mboardDeleteComment( CmtTO cto ) {
		
		int flag = 1;
		
		String sql = "delete from m_cmt where seq=?";
		int result = jdbcTemplate.update(sql, cto.getSeq());

		if( result != 1 ) {
			System.out.println("m_cmt Delete 오류");
		}else {
			flag=0;
		}
		
		return flag;
	}
	
	
	// modify
	public BoardTO mboardModify(BoardTO to) {
		
		String sql = "select seq, subject, title, writer, content, ucode, vcode from m_board where seq=?";		
		to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class), to.getSeq() );
	
		return to;
	}
	
	public int mboardModifyOk1(BoardTO to) {
		
		int flag = 1;
		String	sql = "update m_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
		int result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(),
				to.getSeq(), to.getUcode() );
		if(result == 1) {
			flag=0;
		}
		return flag;
	}
	
	public int mboardModifyOk2(BoardTO to, FileTO fto) {
		
		int flag = 0;
		int result = 0;
		if(to.getContent().indexOf(fto.getFilename()) == -1) {
			String sql ="delete from m_file where pseq=? and filename=?";
			result = jdbcTemplate.update(sql, to.getSeq(), fto.getFilename());
			
		}
		if(result == 0) {
			flag=0;
		}else {
			flag=1;
		}
		return flag;
	}
	
	public int mboardModifyOk3(BoardTO to, FileTO fto) {
		
		int flag = 0;
		int result = 1;
		if(to.getContent().indexOf(fto.getFilename()) != -1) {
			String sql ="insert into m_file values ( 0, ?, ?, ? )";
			result = jdbcTemplate.update(sql, to.getSeq(), fto.getFilename(), fto.getFilesize());
		}
		if(result == 1) {
			flag=0;
		}else {
			flag=1;
		}
		return flag;
	}
		
	// modify_ok
	public int mboardModifyOk(BoardTO to, FileTO fto) {	
		
		int flag = 1;
		String oldFilename =fto.getFilename();
		
		int result = 0;
		
		// 새파일 첨부시
		if( !fto.getNewFilename().equals("default") ){
			String	sql = "update m_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(),
					to.getSeq(), to.getUcode() );
			
			// 기존 텍스트 -> 새파일 첨부시 : m_file insert
			if( to.getContent().indexOf( fto.getNewFilename())!=-1 && fto.getFilesize()==0 ) {
				sql = "insert into m_file values ( 0, ?, ?, ? )";
				result = jdbcTemplate.update(sql, to.getSeq(), fto.getNewFilename(), fto.getNewFilesize());
				result = 3;
				
			// 새파일 첨부하고 저장까지 한 경우
			} else if ( to.getContent().indexOf( fto.getNewFilename())!=-1 && oldFilename!=null ) {
				
				sql = "update m_file set filename=?, filesize=? where pseq=?";
				result = jdbcTemplate.update(sql, fto.getNewFilename(), fto.getNewFilesize(), to.getSeq());
				result = 1;
				
			// 새파일 첨부 후 저장 전 삭제
			} else if ( !fto.getNewFilename().equals("default") && to.getContent().indexOf(fto.getNewFilename())==-1) {
				sql = "update m_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
				result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(),
						 to.getSeq(), to.getUcode() );
				result = 4;
			} 	
			
			if( result != 1 ) {
			
				flag = 1;
			} else {
				flag = 0;
			}			
					
			
		// 기존 파일 그대로일 경우
		} else if( to.getContent().indexOf(fto.getFilename()) != -1) {
			String	sql = "update m_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(),
					 to.getSeq(), to.getUcode() );
			result = 2;
			
		// 기존 파일이름 null, 새파일이름이 default,, to.getcontent의 내용에 새파일이름이 없을때
		} else if( to.getContent().indexOf(fto.getFilename()) == -1) {
			String	sql = "update m_board set subject=?, title=?, writer=?, content=? where seq=? and ucode=?";
			result = jdbcTemplate.update(sql, to.getSubject(), to.getTitle(), to.getWriter(), to.getContent(),
					 to.getSeq(), to.getUcode() );
			result = 3;
			
			if( oldFilename != null ) {
				try {
					sql = "delete from m_file where pseq=?";
					result = jdbcTemplate.update(sql, to.getSeq());	
					result = 1;
				} catch (DataAccessException e) {
					
				}
			}
		} 
		
		if( result == 0 ) {
			flag = 1;// 비정상 실행
			// 새로운 파일 삭제
			if( fto.getNewFilename() != "default" ) {
				String delurl = mUploadPath + fto.getNewFilename();
				File file  = new File(delurl);
				file.delete(); 
				System.out.println("새 파일 삭제완료 : ");
			}
		} else if( result == 1 ) {
			flag = 0;// 정상 실행
			// 새파일 첨부시 -> 기존 파일 삭제
			if( oldFilename != null ) {
				String delurl = mUploadPath + oldFilename;
				File file  = new File(delurl);
				file.delete();
				System.out.println("기존 파일 삭제완료 : ");
			}
		} else if( result == 2 ) {
			flag = 0;
			System.out.println("파일 그대로일 경우 : ");
		} else if( result == 3 ) { 
			flag = 0;
			System.out.println("원래 파일이 없었음 : ");
		} else if( result == 4 ) { 
			flag = 0;			
			String delurl = mUploadPath + fto.getNewFilename();
			System.out.println("delurl : " + delurl);
			File file  = new File(delurl);
			file.delete(); 			
			System.out.println("임시파일 삭제 ");
		}
		return flag;
	}
	
	// delete_ok
	public int mboardDeleteOk(BoardTO to) {
		
		int flag = 2;
		
		String sql = "delete from m_board where seq=?";
		int result = jdbcTemplate.update(sql, to.getSeq() );
	
		if(result == 0) {
			System.out.println("mboardDeleteOk 오류");
			flag=1;
		}else {
			flag=0;
		}
	
		return flag;
	}
	
	//파일 검사 및 이동
	public void filecnd(BoardTO to, FileTO fto) {
		//삭제했을 경우 임시 파일 삭제
		if(to.getContent().indexOf(fto.getFilename()) == -1) {
			String delurl = mUploadPath + fto.getFilename();
			File delFile = new File(delurl);
			if(delFile.exists()) {//파일이 존재하는지 확인
				delFile.delete();
				System.out.println("임시파일 삭제 성공");
				
			}else {
				System.out.println("파일이 존재 하지 않습니다.");
			}
		
		}else {
			System.out.println("변경된 파일이 없습니다.");
		}
	}
	//글작성하다가 취소 눌렀을 경우 파일 삭제
	public void filedel(String filename) {
		
		//삭제했을 경우 임시 파일 삭제
		if(filename != "default") {
			String delurl = mUploadPath + filename;
			File delFile = new File(delurl);
			if(delFile.exists()) {//파일이 존재하는지 확인
				delFile.delete();
				System.out.println("임시파일 삭제 성공");
				
			}else {
				System.out.println("파일이 존재 하지 않습니다.");
			}
		
		}
	}
	
	//게시글 삭제메서드
	public ArrayList<FileTO> mboardDelFileCheck(BoardTO to) {
		
		//삭제했을 경우 임시 파일 삭제
		FileTO fto = new FileTO();
		ArrayList<FileTO> fileArr = new ArrayList<FileTO>();
		String sql = "select filename from m_file where pseq=?";
		try {
			fileArr = (ArrayList<FileTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<FileTO>(FileTO.class), to.getSeq() );
		} catch (DataAccessException e) {
			fto.setFilename("null");
			fileArr.add(fto);
		}		
		return fileArr;	
	}
	
	//게시글 삭제메서드
	public Integer fileDBDel(BoardTO to) {
		
		//삭제했을 경우 임시 파일 삭제
		int flag = 1;
		
		String sql = "delete from m_file where pseq=?";
		int result = jdbcTemplate.update(sql, to.getSeq());

		if( result != 1 ) {
			System.out.println("filedbDel() 오류");
		}else {
			flag=0;
		}
		
		return flag;
	}
	//게시글 삭제메서드
	public int mboardDeleteCmtAll(BoardTO to) {
		
		int flag = 1;
		
		String sql = "delete from m_cmt where pseq=?";
		int result = jdbcTemplate.update(sql, to.getSeq());
		System.out.println("mboardDeleteCmtAll  : " + result);
		if( result == 0 ) {
			System.out.println("댓글이 없음");
			flag=0;
		}else if(result != 0) {
			System.out.println("댓글이 있음 삭제 완료");
			flag=0;
		}		
		return flag;
	}
	
	//게시글 ucode 찾기
	public BoardTO findViewUcode(BoardTO to) {

		String sql = "select ucode from m_board where seq=?";
			to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class), to.getSeq() );
		return to;	
	}
	
	// 게시글 파일찾기
	public ArrayList<FileTO> findNFile(BoardTO to) {
		
		FileTO fto = new FileTO();
		
		ArrayList<FileTO> fileArr = new ArrayList<FileTO>();
		String sql = "select * from m_file where pseq=?";
		try {
			fileArr = (ArrayList<FileTO>)jdbcTemplate.query(sql, new BeanPropertyRowMapper<FileTO>(FileTO.class), to.getSeq() );
		} catch (DataAccessException e) {
			fto.setFilename("null");
			fileArr.add(fto);
		}
		return fileArr;
	}
		
}
