package com.library.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.library.bean.Admin;
import com.library.mapper.AdminMapper;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	//查找
	public Admin findByAdminId(long adminId){
	        return adminMapper.findByAdminId(adminId);
	 }
	
	  //重置密码  
	 public boolean resetPassword(long adminId, String newPassword){
	        return adminMapper.resetPassword(adminId,newPassword)>0;
	 }
}
