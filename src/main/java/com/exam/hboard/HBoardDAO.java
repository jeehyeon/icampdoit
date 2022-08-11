package com.exam.hboard;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.exam.login.SignUpTO;
import com.exam.mboard.BoardTO;
import com.exam.mboard.FileTO;

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
					System.out.println(result);
					
		//위에 들어가 부분에 seq값을 다시 들고 나와야 함
		if( result != 1 ) {
			System.out.println("h_board insert 오류");
			return flag;	
		}else {
			flag=0;
		}
		String pseq;
		System.out.println("vcode : " + hto.getVcode());
		
		//파일이 있으면 진행 없으면 진행 X		
		if(hto.getContent().indexOf(hto.getFilename()) != -1) {
			try {
				sql = "select seq from h_board where vcode=?";
				pseq = jdbcTemplate.queryForObject(sql, String.class, hto.getVcode());
				System.out.println("pseq 결과값 : " + pseq);
			} catch (DataAccessException e) {
				// TODO Auto-generated catch block
				System.out.println("seq값 찾기 오류");
				return flag;
			}

						
			sql = "insert into m_file values ( 0, ?, ?, ? )";
			result = jdbcTemplate.update(sql, pseq, hto.getFilename(), hto.getFilesize());
	
			if( result != 1 ) {
				System.out.println("fileinsert 오류");
				flag = 1;
			}else {
				flag=0;
			}
		
		};
		
		return flag;		
	}
	
	//파일 검사 및 이동
	public void filecnd(BoardTO to, FileTO fto) {
		//삭제했을 경우 임시 파일 삭제
		if(to.getContent().indexOf(fto.getFilename()) == -1) {
			String delurl = hUploadPath + fto.getFilename();
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
	
	
	
	
}
