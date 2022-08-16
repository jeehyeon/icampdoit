package com.exam.login;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.exam.login.SignUpTO;
import com.exam.mboard.BoardListTO;
import com.exam.mboard.BoardTO;
import com.exam.mboard.FileTO;

@Repository
public class MypageDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// myfageView
	public SignUpTO mypageView(SignUpTO sto) {	

		//String sql = "select ucode, id, pwd, name, gen, email, rdate, date_format(birth, '%Y-%m-%d') birth, hint, answer, kid from users where ucode=?";
		String sql = "select ucode, id, pwd, name, gen, email, rdate, birth, hint, answer, kid from users where ucode=?";
		sto = jdbcTemplate.queryForObject(
				sql, new BeanPropertyRowMapper<SignUpTO>(SignUpTO.class), sto.getUcode() );
		
		return sto;
	}
	
	// mypageModifyOk
	public int mypageModifyOk(SignUpTO sto) {
		int flag = 2;
		
		String sql = "update users set name=?, gen=?, email=?, birth=? where ucode=?";
		int result = jdbcTemplate.update(sql, sto.getName(), sto.getGen(), sto.getEmail(), sto.getBirth(), sto.getUcode());
		
		if( result == 0 ) {
			flag = 1;
		} else if( result == 1 ) {
			flag = 0;
		}
		
		return flag;
	}
	
	// list
	public ArrayList<BoardTO> boardList() {
				
		String sql = "select seq, subject, title, writer, content, date_format(wdate, '%Y-%m-%d') wdate, hit, ucode, cmt from m_board where ucode=? order by seq desc";
		ArrayList<BoardTO> lists = (ArrayList<BoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class) );
		
		return lists;	
	}
	
	// listTO
	public BoardListTO boardList(BoardListTO listTO, BoardTO to) {
		
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();// 한페이지에 글 개수 5*2=10개
		int blockPerPage = listTO.getBlockPerPage();// 한 화면에 보이는 페이지수 5개
		
		//String sql = "select seq, subject, title, writer, content, date_format(wdate, '%Y-%m-%d') wdate, hit, ucode, cmt from m_board order by seq desc";
		String sql = "select seq, subject, title, writer, content, date_format(wdate, '%Y-%m-%d') wdate, hit, ucode, cmt from m_board where ucode=? order by seq desc";

		//BoardTO to = new BoardTO();
		ArrayList<BoardTO> boardLists = (ArrayList<BoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<BoardTO>(BoardTO.class), to.getUcode() );
		
		System.out.println("ucode : " + to.getUcode() );
		
		// 총 게시글 수 얻기
		listTO.setTotalRecord( boardLists.size() );
		
		// 총 페이지 수 얻기(skip은 시작번호)
		listTO.setTotalPage( ( (listTO.getTotalRecord() -1 ) / recordPerPage ) + 1 );		
		int skip = ( cpage - 1 ) * recordPerPage;		
		
		ArrayList<BoardTO> lists = new ArrayList<BoardTO>();		
		for( int i=0; i<recordPerPage ; i++ ) {
			if( skip+i != boardLists.size() ) {
				//BoardTO to = new BoardTO();
				to.setSeq( boardLists.get(skip+i).getSeq() );
				to.setSubject( boardLists.get(skip+i).getSubject() );
				to.setTitle( boardLists.get(skip+i).getTitle() );
				to.setWriter( boardLists.get(skip+i).getWriter() );
				to.setContent( boardLists.get(skip+i).getContent() );
				to.setWdate( boardLists.get(skip+i).getWdate() );
				to.setHit( boardLists.get(skip+i).getHit() );
				to.setUcode( boardLists.get(skip+i).getUcode() );
				to.setCmt( boardLists.get(skip+i).getCmt() );
				
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
