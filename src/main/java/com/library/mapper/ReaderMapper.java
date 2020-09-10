package com.library.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.library.bean.Reader;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface ReaderMapper {

	
    public ArrayList<Reader> findAll();

    public Reader findByReaderId(long readerId);
    
    public List<Reader> queryByUsername(@Param("searchWord")String searchWord);

    public int deleteByReaderId(long readerId);

    public int edit(Reader reader);

    public  long add(Reader reader) ;

    public int resetPassword(@Param("readerId")long readerId,@Param("password")String password);

	

}
