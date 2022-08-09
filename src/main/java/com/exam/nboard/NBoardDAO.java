package com.exam.nboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class NBoardDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	//list
	public ArrayList<NBoardTO> nboardList() {
		
		String sql = "select seq, writer, subject, title, date_format(wdate, '%Y-%m-%d') wdate, hit from n_board order by seq desc";
		ArrayList<NBoardTO> lists = (ArrayList<NBoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<NBoardTO>(NBoardTO.class) );
		return lists;
		
	}
	
	//NBoardList(페이지)
	public NListTO nList( NListTO listTO ) {
		
		int cpage = listTO.getCpage();
		int recordPerPage = listTO.getRecordPerPage();
		int blockPerPage = listTO.getBlockPerPage();
		
		String sql = "select seq, writer, subject, title, date_format(wdate, '%Y-%m-%d') wdate, hit from n_board order by seq desc";
		
		List<NListTO> list = jdbcTemplate.query( sql, new RowMapper<NListTO>() {

			@Override
			public NListTO mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub
				
				rs.last();
				listTO.setTotalRecord( rs.getRow() );
				rs.beforeFirst();
				
				int skip = (cpage -1) * recordPerPage;
				if( skip != 0 ) rs.absolute(skip);
				
				return null;
			}		
		});
		
		listTO.setTotalPage( ( (listTO.getTotalRecord() -1 ) / recordPerPage) +1 );
		ArrayList<NBoardTO> lists = (ArrayList<NBoardTO>)jdbcTemplate.query(
				sql, new BeanPropertyRowMapper<NBoardTO>(NBoardTO.class) );
		
		listTO.setBoardLists( lists );
		listTO.setStartBlock( ( (cpage -1 ) / blockPerPage ) * blockPerPage + 1 );
		listTO.setEndBlock( ( ( cpage-1 ) / blockPerPage ) * blockPerPage + blockPerPage);
		if( listTO.getEndBlock() >= listTO.getTotalPage() ) {
			listTO.setEndBlock( listTO.getTotalPage() );
		}
		
		return listTO;
		
	}
	
	//NBoardView
	public NBoardTO nboardView(NBoardTO to) {
		
		String sql = "update n_board set hit=hit+1 where seq=?";
		
		int result = jdbcTemplate.update(sql, to.getSeq() );
		
		sql = "select seq, subject, title, writer, content, date_format(wdate, '%Y-%m-%d') wdate, hit from n_board where seq=?";		
		to = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<NBoardTO>(NBoardTO.class), to.getSeq() );
		
		return to;
		
	}
}
