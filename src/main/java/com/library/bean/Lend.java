package com.library.bean;

import java.io.Serializable;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Lend implements Serializable {

    private long serNum;
    private long bookId;
    private long readerId;
    private Date lendDate;
    private Date backDate;
    
    private Book book;
}
