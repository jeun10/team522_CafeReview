package com.project522.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MPCVO {
	private int community_num;
	private String community_category;
	private String community_title;
	private String community_context;
	private Date community_date;
	private String community_map;
	private String user_id;
	private String community_place;
	private Date community_schedule;
}
