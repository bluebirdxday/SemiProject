ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE;

-- 계정 생성
CREATE USER newsecond IDENTIFIED BY "newsecond1234";

-- 권한 부여(접속, 객체 생성, 뷰)
GRANT CONNECT, RESOURCE, CREATE VIEW TO newsecond;

-- 객체 생성 공간 할당
ALTER USER newsecond DEFAULT TABLESPACE SYSTEM
QUOTA UNLIMITED ON SYSTEM;

--------------------------------------------------------------

DROP TABLE "users";
DROP TABLE "wish_lists";
DROP TABLE "goods_board";
DROP TABLE "reviews";
DROP TABLE "shop";
DROP TABLE "chat_room";
DROP TABLE "qna";
DROP TABLE "chat_messages";
DROP TABLE "notification_keywords";
DROP TABLE "follow";
DROP TABLE "notifications";
DROP TABLE "recent_views";
DROP TABLE "files";
DROP TABLE "categories";
DROP TABLE "notice";


CREATE TABLE "users" (
	"USER_NO"	NUMBER		NOT NULL,
	"USER_EMAIL"	VARCHAR(100)		NOT NULL,
	"USER_PASSWORD"	VARCHAR(100)		NOT NULL,
	"USER_NICKNAME"	VARCHAR2(40)		NOT NULL,
	"USER_TEL"	CHAR(11)		NOT NULL,
	"USER_ADDRESS"	VARCHAR2(400)		NOT NULL,
	"USER_IMG"	VARCHAR2(400)		NULL,
	"USER_STATUS"	CHAR(1)	DEFAULT 'A'	CONSTRAINT USER_STATUS_CHK CHECK(USER_STATUS IN('A','B','D')),
	"ENROLL_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"USER_ROLE"	NUMBER	DEFAULT 1	NOT NULL
);

COMMENT ON COLUMN "users"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "users"."USER_EMAIL" IS '회원 아이디(=이메일)';

COMMENT ON COLUMN "users"."USER_PASSWORD" IS '회원 비밀번호(암호화 적용)';

COMMENT ON COLUMN "users"."USER_NICKNAME" IS '회원 닉네임';

COMMENT ON COLUMN "users"."USER_TEL" IS '전화번호';

COMMENT ON COLUMN "users"."USER_ADDRESS" IS '회원 주소';

COMMENT ON COLUMN "users"."USER_IMG" IS '프로필 이미지 저장 경로';

COMMENT ON COLUMN "users"."USER_STATUS" IS '탈퇴여부(A:활동가능 ,B:활동중지 , D: 탈퇴)';

COMMENT ON COLUMN "users"."ENROLL_DT" IS '회원 가입일';

COMMENT ON COLUMN "users"."USER_ROLE" IS '회원권한(1:일반, 2:관리자)';

CREATE TABLE "wish_lists" (
	"WISH_NO"	NUMBER		NOT NULL,
	"GOODS_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"WISH_DT"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "wish_lists"."WISH_NO" IS '관심 번호(SEQ_WISH_NO)';

COMMENT ON COLUMN "wish_lists"."GOODS_NO" IS '상품 게시글 번호(SEQ_GOODS_NO)';

COMMENT ON COLUMN "wish_lists"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "wish_lists"."WISH_DT" IS '상품찜한일';

CREATE TABLE "goods_board" (
	"GOODS_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"GOODS_TITLE"	VARCHAR2(300)		NOT NULL,
	"GOODS_DESCR"	VARCHAR2(600)		NOT NULL,
	"GOODS_PRICE"	NUMBER		NOT NULL,
	"VIEW_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"WISH_COUNT"	NUMBER	DEFAULT 0	NOT NULL,
	"SELL_ENROLL_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"GOODS_STATUS"	CHAR(1)	DEFAULT 'A'	CONSTRAINT GOODS_STATUS_CHK CHECK(GOODS_STATUS IN('A','B','D','E','R'))
);

COMMENT ON COLUMN "goods_board"."GOODS_NO" IS '상품 게시글 번호(SEQ_GOODS_NO)';

COMMENT ON COLUMN "goods_board"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "goods_board"."CATEGORY_NO" IS '상품 카테고리 번호(SEQ_CATEGORY_NO)';

COMMENT ON COLUMN "goods_board"."GOODS_TITLE" IS '상품 제목 (상품 이름)';

COMMENT ON COLUMN "goods_board"."GOODS_DESCR" IS '상품 상세 설명';

COMMENT ON COLUMN "goods_board"."GOODS_PRICE" IS '상품 판매가액';

COMMENT ON COLUMN "goods_board"."VIEW_COUNT" IS '상품 누적 조회수';

COMMENT ON COLUMN "goods_board"."WISH_COUNT" IS '상품 관심 수';

COMMENT ON COLUMN "goods_board"."SELL_ENROLL_DT" IS '상품 등록일';

COMMENT ON COLUMN "goods_board"."GOODS_STATUS" IS '게시글 상태(A: 판매중, B: 블라인드 D: 삭제 E: 판매 완료, R: 예약중)';

CREATE TABLE "reviews" (
	"REVIEW_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"GOODS_NO"	NUMBER		NOT NULL,
	"REVIEW_MESSAGE"	VARCHAR(600)		NOT NULL,
	"REVIEW_DT"	DATE	DEFAULT SYSDATE	NOT NULL,
	"REVIEW_STARTS"	NUMBER	DEFAULT 0	NOT NULL,
	"REVIEW_DEL_FL"	CHAR(1)	DEFAULT 'N'	CONSTRAINT REVIEW_DEL_FL_CHK CHECK(REVIEW_DEL_FL IN('N', 'Y'))
);

COMMENT ON COLUMN "reviews"."REVIEW_NO" IS '후기 번호(SEQ_REVIEWS_NO)';

COMMENT ON COLUMN "reviews"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "reviews"."GOODS_NO" IS '상품 게시글 번호(SEQ_GOODS_NO)';

COMMENT ON COLUMN "reviews"."REVIEW_MESSAGE" IS '후기 메세지';

COMMENT ON COLUMN "reviews"."REVIEW_DT" IS '거래 후기 작성 일자';

COMMENT ON COLUMN "reviews"."REVIEW_STARTS" IS '별점(0~5)';

COMMENT ON COLUMN "reviews"."REVIEW_DEL_FL" IS '삭제 여부(N: 삭제X, Y: 삭제O)';

CREATE TABLE "chat_room" (
	"CHATROOM_NO"	NUMBER		NOT NULL,
	"GOODS_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "chat_room"."CHATROOM_NO" IS '채팅방 번호(SEQ_CHATROOM_NO)';

COMMENT ON COLUMN "chat_room"."GOODS_NO" IS '상품 게시글 번호(SEQ_GOODS_NO)';

COMMENT ON COLUMN "chat_room"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "chat_room"."CREATE_DT" IS '채팅방 생성 일자';

CREATE TABLE "chat_messages" (
	"MESSAGE_NO"	NUMBER		NOT NULL,
	"CHATROOM_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"READ_OR_NOT"	CHAR(1)	DEFAULT 'N'	CONSTRAINT M_READ_OR_NOT_CHK CHECK(READ_OR_NOT IN('N', 'Y')),
	"MESSAGE"	VARCHAR2(500)		NOT NULL,
	"MESSAGE_SEND_DT"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "chat_messages"."MESSAGE_NO" IS '채팅 메세지 번호(SEQ_CHATMESSAGE_NO)';

COMMENT ON COLUMN "chat_messages"."CHATROOM_NO" IS '채팅방 번호(SEQ_CHATROOM_NO)';

COMMENT ON COLUMN "chat_messages"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "chat_messages"."READ_OR_NOT" IS '채팅 메세지 읽음 여부(N:읽음X, Y:읽음O)';

COMMENT ON COLUMN "chat_messages"."MESSAGE" IS '채팅 메세지';

COMMENT ON COLUMN "chat_messages"."MESSAGE_SEND_DT" IS '메세지 전송 날짜';

CREATE TABLE "notification_keywords" (
	"KEYWORD_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"KEYWORD_TITLE"	VARCHAR2(60)		NOT NULL,
	"CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "notification_keywords"."KEYWORD_NO" IS '키워드 번호(SEQ_KEYWORD_NO)';

COMMENT ON COLUMN "notification_keywords"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "notification_keywords"."KEYWORD_TITLE" IS '키워드 이름';

COMMENT ON COLUMN "notification_keywords"."CREATE_DT" IS '생성 일자';

CREATE TABLE "notifications" (
	"NOTIFICATION_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"NOTIFICATION_MESSAGE"	VARCHAR2(3000)		NOT NULL,
	"READ_OR_NOT"	CHAR(1)	DEFAULT 'N'	CONSTRAINT N_READ_OR_NOT_CHK CHECK(READ_OR_NOT IN('N', 'Y')),
	"NOTIFICATION_CREATE_DT"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "notifications"."NOTIFICATION_NO" IS '알림 번호(SEQ_NOTIFICATION_NO)';

COMMENT ON COLUMN "notifications"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "notifications"."NOTIFICATION_MESSAGE" IS '알림 메시지';

COMMENT ON COLUMN "notifications"."READ_OR_NOT" IS '알림 읽음 여부(N:읽음X, Y:읽음O)';

COMMENT ON COLUMN "notifications"."NOTIFICATION_CREATE_DT" IS '알림 생성 일자';

CREATE TABLE "files" (
	"FILE_NO"	NUMBER		NOT NULL,
	"GOODS_NO"	NUMBER		NOT NULL,
	"FILE_NAME"	VARCHAR2(250)		NOT NULL,
	"FILE_ORDER"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "files"."FILE_NO" IS '파일 번호(SEQ_FILE_NO)';

COMMENT ON COLUMN "files"."GOODS_NO" IS '상품 게시글 번호(SEQ_GOODS_NO)';

COMMENT ON COLUMN "files"."FILE_NAME" IS '파일 이름';

COMMENT ON COLUMN "files"."FILE_ORDER" IS '파일 순서';

CREATE TABLE "shop" (
	"USER_NO"	NUMBER		NOT NULL,
	"SHOP_TITLE"	VARCHAR(60)		NOT NULL,
	"SHOP_INFO"	VARCHAR(150)		NULL
);

COMMENT ON COLUMN "shop"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "shop"."SHOP_TITLE" IS '상점 이름';

COMMENT ON COLUMN "shop"."SHOP_INFO" IS '상점 소개글';

CREATE TABLE "recent_views" (
	"LATELY_NO"	NUMBER		NOT NULL,
	"GOODS_NO"	NUMBER		NOT NULL,
	"USER_NO"	NUMBER		NOT NULL,
	"VIEW_DT"	DATE	DEFAULT SYSDATE	NOT NULL
);

COMMENT ON COLUMN "recent_views"."LATELY_NO" IS '최근 본 상품 번호(SEQ_LATELY_NO)';

COMMENT ON COLUMN "recent_views"."GOODS_NO" IS '상품 게시글 번호(SEQ_GOODS_NO)';

COMMENT ON COLUMN "recent_views"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

COMMENT ON COLUMN "recent_views"."VIEW_DT" IS '최근 조회 시간';

CREATE TABLE "qna" (
	"QNA_NO"	NUMBER		NOT NULL,
	"QNA_TITLE"	VARCHAR2(300)		NOT NULL,
	"QNA_CONTENT"	VARCHAR2(3000)		NOT NULL,
	"QNA_ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"QNA_DELETE_FL"	CHAR(1)	DEFAULT 'N'	CONSTRAINT QNA_DELETE_FL_CHK CHECK(QNA_DELETE_FL IN('N', 'Y')),
	"QNA_CHECK_FL"	CHAR(1)	DEFAULT 'N'	CONSTRAINT QNA_CHECK_FL_CHK CHECK(QNA_CHECK_FL IN('N', 'Y')),
	"USER_NO"	NUMBER		NOT NULL
);



COMMENT ON COLUMN "qna"."QNA_NO" IS '문의번호(SEQ_QNA_NO)';

COMMENT ON COLUMN "qna"."QNA_TITLE" IS '문의 제목';

COMMENT ON COLUMN "qna"."QNA_CONTENT" IS '문의내용';

COMMENT ON COLUMN "qna"."QNA_ENROLL_DATE" IS '문의날짜';

COMMENT ON COLUMN "qna"."QNA_DELETE_FL" IS '삭제여부(N: 삭제X, Y: 삭제O)';

COMMENT ON COLUMN "qna"."QNA_CHECK_FL" IS '처리여부(N: 처리X, Y: 처리O)';

COMMENT ON COLUMN "qna"."USER_NO" IS '회원 번호(SEQ_USER_NO)';

CREATE TABLE "follow" (
	"ACTIVE_USER_NO"	NUMBER		NOT NULL,
	"PASSIVE_USER_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "follow"."FOLLOWING_USER_NO" IS '회원 넘버';

COMMENT ON COLUMN "follow"."USER_NO" IS '회원 번호(SEQ_USER_NO)';


SELECT * FROM "follow" f ;


CREATE TABLE "categories" (
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"CATEGORY_NAME"	VARCHAR(20)		NOT NULL
);

COMMENT ON COLUMN "categories"."CATEGORY_NO" IS '카테고리 번호(SEQ_CATEGORY_NO)';

COMMENT ON COLUMN "categories"."CATEGORY_NAME" IS '카테고리 이름';

ALTER TABLE "users" ADD CONSTRAINT "PK_USERS" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "wish_lists" ADD CONSTRAINT "PK_WISH_LISTS" PRIMARY KEY (
	"WISH_NO"
);

ALTER TABLE "goods_board" ADD CONSTRAINT "PK_GOODS_BOARD" PRIMARY KEY (
	"GOODS_NO"
);

ALTER TABLE "reviews" ADD CONSTRAINT "PK_REVIEWS" PRIMARY KEY (
	"REVIEW_NO"
);

ALTER TABLE "chat_room" ADD CONSTRAINT "PK_CHAT_ROOM" PRIMARY KEY (
	"CHATROOM_NO"
);

ALTER TABLE "chat_messages" ADD CONSTRAINT "PK_CHAT_MESSAGES" PRIMARY KEY (
	"MESSAGE_NO"
);

ALTER TABLE "notification_keywords" ADD CONSTRAINT "PK_NOTIFICATION_KEYWORDS" PRIMARY KEY (
	"KEYWORD_NO"
);

ALTER TABLE "notifications" ADD CONSTRAINT "PK_NOTIFICATIONS" PRIMARY KEY (
	"NOTIFICATION_NO"
);

ALTER TABLE "files" ADD CONSTRAINT "PK_FILES" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "shop" ADD CONSTRAINT "PK_SHOP" PRIMARY KEY (
	"USER_NO"
);

ALTER TABLE "recent_views" ADD CONSTRAINT "PK_RECENT_VIEWS" PRIMARY KEY (
	"LATELY_NO",
	"GOODS_NO",
	"USER_NO"
);

ALTER TABLE "qna" ADD CONSTRAINT "PK_QNA" PRIMARY KEY (
	"QNA_NO"
);

ALTER TABLE "follow" ADD CONSTRAINT "PK_FOLLOW" PRIMARY KEY (
	"FOLLOWING_USER_NO",
	"USER_NO"
);

ALTER TABLE "categories" ADD CONSTRAINT "PK_CATEGORIES" PRIMARY KEY (
	"CATEGORY_NO"
);

ALTER TABLE "wish_lists" ADD CONSTRAINT "FK_goods_board_TO_wish_lists_1" FOREIGN KEY (
	"GOODS_NO"
)
REFERENCES "goods_board" (
	"GOODS_NO"
);

ALTER TABLE "wish_lists" ADD CONSTRAINT "FK_users_TO_wish_lists_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "users" (
	"USER_NO"
);

ALTER TABLE "goods_board" ADD CONSTRAINT "FK_users_TO_goods_board_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "users" (
	"USER_NO"
);

ALTER TABLE "goods_board" ADD CONSTRAINT "FK_categories_TO_goods_board_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "categories" (
	"CATEGORY_NO"
);

ALTER TABLE "reviews" ADD CONSTRAINT "FK_users_TO_reviews_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "users" (
	"USER_NO"
);

ALTER TABLE "reviews" ADD CONSTRAINT "FK_goods_board_TO_reviews_1" FOREIGN KEY (
	"GOODS_NO"
)
REFERENCES "goods_board" (
	"GOODS_NO"
);

ALTER TABLE "chat_room" ADD CONSTRAINT "FK_goods_board_TO_chat_room_1" FOREIGN KEY (
	"GOODS_NO"
)
REFERENCES "goods_board" (
	"GOODS_NO"
);

ALTER TABLE "chat_room" ADD CONSTRAINT "FK_users_TO_chat_room_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "users" (
	"USER_NO"
);

ALTER TABLE "chat_messages" ADD CONSTRAINT "FK_chat_room_TO_chat_messages_1" FOREIGN KEY (
	"CHATROOM_NO"
)
REFERENCES "chat_room" (
	"CHATROOM_NO"
);

ALTER TABLE "chat_messages" ADD CONSTRAINT "FK_users_TO_chat_messages_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "users" (
	"USER_NO"
);

ALTER TABLE "notification_keywords" ADD CONSTRAINT "FK_users_TO_notification_keywords_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "users" (
	"USER_NO"
);

ALTER TABLE "notifications" ADD CONSTRAINT "FK_users_TO_notifications_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "users" (
	"USER_NO"
);

ALTER TABLE "files" ADD CONSTRAINT "FK_goods_board_TO_files_1" FOREIGN KEY (
	"GOODS_NO"
)
REFERENCES "goods_board" (
	"GOODS_NO"
);

ALTER TABLE "shop" ADD CONSTRAINT "FK_users_TO_shop_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "users" (
	"USER_NO"
);

ALTER TABLE "recent_views" ADD CONSTRAINT "FK_goods_board_TO_recent_views_1" FOREIGN KEY (
	"GOODS_NO"
)
REFERENCES "goods_board" (
	"GOODS_NO"
);

ALTER TABLE "recent_views" ADD CONSTRAINT "FK_users_TO_recent_views_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "users" (
	"USER_NO"
);

ALTER TABLE "qna" ADD CONSTRAINT "FK_users_TO_qna_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "users" (
	"USER_NO"
);

ALTER TABLE "follow" ADD CONSTRAINT "FK_users_TO_follow_1" FOREIGN KEY (
	"FOLLOWING_USER_NO"
)
REFERENCES "users" (
	"USER_NO"
);

ALTER TABLE "follow" ADD CONSTRAINT "FK_shop_TO_follow_1" FOREIGN KEY (
	"USER_NO"
)
REFERENCES "shop" (
	"USER_NO"
);



CREATE SEQUENCE SEQ_USER_NO NOCACHE; -- 회원 번호
CREATE SEQUENCE SEQ_WISH_NO NOCACHE; -- 관심 번호
CREATE SEQUENCE SEQ_GOODS_NO NOCACHE; -- 상품 게시글 번호
CREATE SEQUENCE SEQ_CATEGORY_NO NOCACHE; -- 상품 카테고리 번호
CREATE SEQUENCE SEQ_REVIEWS_NO NOCACHE; -- 후기 번호
CREATE SEQUENCE SEQ_CHATROOM_NO NOCACHE; -- 채팅방 번호
CREATE SEQUENCE SEQ_CHATMESSAGE_NO NOCACHE; -- 채팅 메세지 번호
CREATE SEQUENCE SEQ_KEYWORD_NO NOCACHE; -- 키워드 번호
CREATE SEQUENCE SEQ_NOTIFICATION_NO NOCACHE; -- 알림 번호
CREATE SEQUENCE SEQ_FILE_NO NOCACHE; -- 파일 번호
CREATE SEQUENCE SEQ_LATELY_NO NOCACHE; -- 최근 본 상품 번호
CREATE SEQUENCE SEQ_QNA_NO NOCACHE; -- 문의번호
CREATE SEQUENCE SEQ_NOTICE_NO NOCACHE; -- 공지사항 번호

COMMIT;


UPDATE users
SET USER_NO = '13' 
WHERE USER_EMAIL = 'user13@gmail.com'
;

SELECT * FROM users;


--공지사항 데이터 새로추가 230516--
CREATE TABLE "notice" (
	"NOTICE_NO"	NUMBER		NOT NULL,
	"NOTICE_TITLE"	VARCHAR2(300)		NULL,
	"NOTICE_CONTENT"	VARCHAR2(3000)		NULL,
	"NOTICE_ENROLL_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,
	"NOTICE_VIEWCOUNT"	NUMBER	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN "notice"."NOTICE_NO" IS '공지사항번호(SEQ_NOTICE_NO)';

COMMENT ON COLUMN "notice"."NOTICE_TITLE" IS '공지제목';

COMMENT ON COLUMN "notice"."NOTICE_CONTENT" IS '공지내용';

COMMENT ON COLUMN "notice"."NOTICE_ENROLL_DATE" IS '공지날짜';

COMMENT ON COLUMN "notice"."NOTICE_VIEWCOUNT" IS '조회수';

ALTER TABLE "notice" ADD CONSTRAINT "PK_NOTICE_NO" PRIMARY KEY (
	"NOTICE_NO"
);


CREATE SEQUENCE SEQ_NOTICE_NO NOCACHE; -- 공지사항 번호

SELECT * FROM "notice";

INSERT INTO "notice"
VALUES(SEQ_NOTICE_NO.NEXTVAL, '뉴세컨마켓 공지', '안녕하세요. 관리자입니다. 뉴세컨마켓 공지 올립니다.', DEFAULT);

ALTER TABLE "notice" ADD NOTICE_FL CHAR(1) DEFAULT 'N' CONSTRAINT NOTICE_CHECK_FL_CHK CHECK(NOTICE_FL IN('N', 'Y'));


COMMIT;
ROLLBACK;

--문의사항 신고유형 컬럼 삽입
ALTER TABLE "qna" ADD QNA_TYPE VARCHAR(30);

SELECT * FROM "qna";


COMMENT ON COLUMN "goods_board"."QNA_TYPE" IS '게시글 상태(A:거래신고, B:회원/계정 C:오류/제안 D:채팅/알람)';

UPDATE "qna" 
SET QNA_DELETE_FL = 'Y' 
WHERE QNA_NO = '19';

SELECT * FROM "notice";

SELECT COUNT(*)
FROM "qna"
WHERE QNA_DELETE_FL = 'N'
ORDER BY QNA_NO DESC;
;
