package com.project522.domain;


import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class CommunityVO {
	private int community_num;
	private String community_category;
	private String community_title;
	private String community_context;
	private Date community_date;
	private String community_map;
	private String user_id;
	private String community_place;
	private Date community_schedule;
	private UserInfoVO user_info;
	private String nickname;
}