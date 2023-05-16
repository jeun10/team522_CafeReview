package com.project522.domain;


import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReplyVO {
	private int comment_num;
	private int community_num;
	private String comment_contents;
	private String user_id;
	private Date comment_date;
	private int comment_ori_number;
	private UserInfoVO user_info;
}
