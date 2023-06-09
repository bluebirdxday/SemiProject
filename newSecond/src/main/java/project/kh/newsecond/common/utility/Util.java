package project.kh.newsecond.common.utility;

import java.text.SimpleDateFormat;

public class Util {

	// XSSHandling: 텍스트 타입의 input에 <h1> 등 html 관련 태그가 들어갔을 때 그것을 인식하지 않도록 하는 메서드
	public static String XXSHandling(String content) {
		
		content = content.replaceAll("&", "&amp;");
		content = content.replaceAll("<", "&lt;");
		content = content.replaceAll(">", "&gt;");
		content = content.replaceAll(" /'' ", "&quot;");
		
		return content;
	}
	
	// 파일명 변경 메소드: 원본 파일명을 "yyyyMMddHHmmss_xxxxx파일명"으로 바꾸어 이를 파일명을 삼음 -> 파일명이 겹치지 않으려는 용도
	public static String fileRename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000); 

		String str = "_" + String.format("%05d", ranNum);

		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		return date + str + ext;
	}

	
}
