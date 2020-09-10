package com.library.bean;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Reader implements Serializable {

	private long readerId;
    private String username;
    private String password;
    private String sex;
    private String address;
    private String phone;


}
