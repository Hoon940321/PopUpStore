CREATE TABLE INQUIRY_BOARD (
inquiry_num NUMBER PRIMARY KEY,
user_nick VARCHAR2(100) NOT NULL,
inquiry_title VARCHAR2(100) NOT NULL,
inquiry_content CLOB,
inquiry_create_date DATE DEFAULT SYSDATE NOT NULL,
inquiry_ofile VARCHAR2(200),
inquiry_sfile VARCHAR2(300),
downcount NUMBER(5) DEFAULT 0 NOT NULL,
visitcount NUMBER DEFAULT 0 NOT NULL,
CONSTRAINT fk_user_nick_inquiry FOREIGN KEY(user_nick) REFERENCES USERS(user_nick)
ON DELETE CASCADE
);

CREATE TABLE INQUIRY_COMMENT (
inquiry_comment_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
inquiry_num NUMBER NOT NULL,
user_nick VARCHAR2(100) NOT NULL,
inquiry_comment_content VARCHAR2(1000) NOT NULL,
created_at DATE DEFAULT SYSDATE NOT NULL,
CONSTRAINT fk_inquiry_num FOREIGN KEY (inquiry_num) REFERENCES inquiry_BOARD(inquiry_num)
ON DELETE CASCADE,
CONSTRAINT fk_user_nick_comment_inquiry FOREIGN KEY (user_nick) REFERENCES USERS(user_nick)
ON DELETE CASCADE
);

CREATE SEQUENCE inquiry_comment_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

create sequence inquiry_board_seq
increment by 1  -- 1씩 증가
start with 1    
minvalue 1      
nomaxvalue      
nocycle         
nocache;      



--inquiry 좋아요 테이블 생성
CREATE TABLE INQUIRY_LIKES (
    like_id NUMBER PRIMARY KEY,
    inquiry_num NUMBER NOT NULL,
    user_nick VARCHAR2(100) NOT NULL,
    like_date DATE DEFAULT SYSDATE NOT NULL,
    CONSTRAINT fk_like_inquirynew FOREIGN KEY(inquiry_num) REFERENCES INQUIRY_BOARD(inquiry_num)
    ON DELETE CASCADE,
    CONSTRAINT fk_like_usernew FOREIGN KEY(user_nick) REFERENCES USERS(user_nick)
    ON DELETE CASCADE
);

-- inquiry 좋아요 시퀀스 생성
CREATE SEQUENCE inquiry_likes_seq
INCREMENT BY 1
START WITH 1
MINVALUE 1
NOMAXVALUE
NOCYCLE
NOCACHE;


-- INQUIRY_BOARD 테이블에 더미 데이터 삽입 (20개)
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user1', '제품 사용 방법 문의', '이 제품을 어떻게 사용해야 하는지 궁금합니다. 설명서가 조금 모호해서요.', SYSDATE, NULL, NULL, 0, 50);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user2', '환불 절차 문의', '구매한 제품에 문제가 있어 환불을 원합니다. 환불 절차가 어떻게 되는지 알려주세요.', SYSDATE, NULL, NULL, 0, 30);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user3', '배송 지연 문의', '주문한 제품이 아직 배송되지 않았습니다. 배송 상태 확인 부탁드립니다.', SYSDATE, NULL, NULL, 0, 70);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user4', 'A/S 문의', '제품 A/S를 받고 싶은데 어떻게 신청하나요?', SYSDATE, NULL, NULL, 0, 25);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user5', '제품 구성 문의', '제품에 포함된 구성품 목록을 알려주세요.', SYSDATE, NULL, NULL, 0, 45);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user6', '회원 혜택 문의', '회원으로 가입하면 어떤 혜택을 받을 수 있나요?', SYSDATE, NULL, NULL, 0, 60);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user7', '할인 쿠폰 사용 방법 문의', '보유한 할인 쿠폰을 어떻게 적용하는지 문의드립니다.', SYSDATE, NULL, NULL, 0, 35);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user8', '교환 요청 문의', '제품이 마음에 들지 않아 다른 제품으로 교환하고 싶습니다. 절차를 알려주세요.', SYSDATE, NULL, NULL, 0, 40);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user9', '주문 내역 확인 문의', '내가 주문한 제품 목록을 어디서 확인할 수 있나요?', SYSDATE, NULL, NULL, 0, 20);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user10', '포인트 적립 관련 문의', '제품 구매 시 포인트가 적립되는지 궁금합니다.', SYSDATE, NULL, NULL, 0, 55);

-- 추가 10개 더미 데이터
INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user1', '이벤트 참여 방법 문의', '현재 진행 중인 이벤트에 참여하고 싶은데 방법을 알려주세요.', SYSDATE, NULL, NULL, 0, 65);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user2', '회원 탈퇴 문의', '회원 탈퇴를 하려면 어떻게 해야 하나요?', SYSDATE, NULL, NULL, 0, 10);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user3', '제품 상세 정보 문의', '이 제품의 상세 스펙 정보를 알고 싶습니다.', SYSDATE, NULL, NULL, 0, 80);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user4', '반품 요청 문의', '구매한 제품이 마음에 들지 않아 반품을 하고 싶습니다. 방법을 알려주세요.', SYSDATE, NULL, NULL, 0, 90);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user5', '배송비 관련 문의', '제품 배송비는 어떻게 계산되나요?', SYSDATE, NULL, NULL, 0, 50);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user6', '제품 추천 문의', '어떤 제품이 저에게 적합한지 추천받고 싶습니다.', SYSDATE, NULL, NULL, 0, 75);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user7', '쿠폰 적용 불가 문의', '쿠폰을 사용하려고 했는데 적용이 안 됩니다. 이유가 무엇인가요?', SYSDATE, NULL, NULL, 0, 45);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user8', '상품 가격 문의', '이 제품의 가격 변동에 대해 문의드립니다.', SYSDATE, NULL, NULL, 0, 35);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user9', '예약 구매 문의', '예약 구매 가능한 제품인지 궁금합니다.', SYSDATE, NULL, NULL, 0, 60);

INSERT INTO INQUIRY_BOARD (inquiry_num, user_nick, inquiry_title, inquiry_content, inquiry_create_date, inquiry_ofile, inquiry_sfile, downcount, visitcount)
VALUES (inquiry_board_seq.NEXTVAL, 'user10', '구매 후 리뷰 작성 관련 문의', '구매 후 리뷰를 작성하려고 하는데 어디서 작성할 수 있나요?', SYSDATE, NULL, NULL, 0, 70);

commit;
-- 테이블 내용 확인
SELECT * FROM INQUIRY_BOARD;
