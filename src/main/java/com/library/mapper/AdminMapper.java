package com.library.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.library.bean.Admin;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Mapper
public interface AdminMapper {

    //查找
    public Admin findByAdminId(@Param("adminId")long adminId);

    // 重置密码
    public int resetPassword(@Param("adminId")long adminId,@Param("password")String password);

   
}
