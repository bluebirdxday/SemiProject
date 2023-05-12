package project.kh.newsecond.review.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Review {
	private int reviewNo;
	private String shopTitle;
	private String goodsTitle;
	private String reviewMessage;
	private String reviewDate;
	private int reviewStars;
}
