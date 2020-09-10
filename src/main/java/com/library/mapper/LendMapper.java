package com.library.mapper;

import com.library.bean.Lend;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface LendMapper {

  

	/**
	 *将lend_list中的纪录修改，添加归还时间
	 * @param bookId
	 * @param readerId
	 * @return
	 */
    public int returnBookOne(@Param("bookId")long bookId, @Param("readerId")long readerId) ;

    
   /**
    * 将book中的数量修改，number+1
    * @param bookId
    * @return
    */
    public int returnBookTwo(@Param("bookId")long bookId);

    
    /**
     * 添加借书纪录
     * @param bookId
     * @param readerId
     * @return
     */
    public int lendBookOne(@Param("bookId")long bookId,@Param("readerId")long readerId);

    /**
     * 借书后book数量-1
     * @param bookId
     * @return
     */
    public int lendBookTwo(@Param("bookId")long bookId);

    /**
     * 所有借书纪录
     * @return
     */
    public ArrayList<Lend> findAll();

    /**
     * 个人借书纪录
     */
    public ArrayList<Lend> findAllByReaderId(@Param("readerId")long readerId);

    /**
     * 通过流水号删除记录
     * @param serNum
     * @return
     */
    public int deleteBySerNum(@Param("serNum")long serNum);
}
