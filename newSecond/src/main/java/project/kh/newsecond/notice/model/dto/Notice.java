package project.kh.newsecond.notice.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeEnrollDate;
	private String noticeFl;
	private int noticeViewCount;
	public int getUserNo() {
		
		return 0;
	}
	
}
