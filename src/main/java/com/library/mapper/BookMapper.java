package com.library.mapper;

import com.library.bean.Book;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.hibernate.validator.constraints.ParameterScriptAssert;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Mapper
public interface BookMapper {
	
	
    public ArrayList<Book> query(String searchWord);

    public ArrayList<Book> findAll();

    public int add(Book book);
    
    public Book findByBookId(@Param("bookId")long bookId); 

    public int edit(Book book);

    public int deleteByBookId(@Param("bookId")long bookId);
}
