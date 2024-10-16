CREATE TABLE REVIEWS_BOARD (
    review_num NUMBER NOT NULL,
    review_title VARCHAR2(100) NOT NULL,
    review_content VARCHAR2(1000) NOT NULL,
    review_ofile VARCHAR2(200),
    review_sfile VARCHAR2(200),
    review_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL, -- 수정됨
    review_viewcount NUMBER DEFAULT 0 NOT NULL,
    review_likecount NUMBER DEFAULT 0 NOT NULL,
    user_nick VARCHAR2(100) NOT NULL,
    CONSTRAINT pk_reviews PRIMARY KEY (review_num),
    CONSTRAINT fk_user_nick_reviews FOREIGN KEY (user_nick)
    REFERENCES USERS(user_nick)
    ON DELETE CASCADE
);

CREATE SEQUENCE seq_review_num
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

-- 댓글 테이블
CREATE TABLE REVIEWS_COMMENTS (
    comment_id NUMBER PRIMARY KEY,
    review_num NUMBER,
    user_nick VARCHAR2(100),
    comment_content VARCHAR2(1000),
    comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reviews_comments_reviews FOREIGN KEY (review_num)
    REFERENCES REVIEWS_BOARD(review_num)
    ON DELETE CASCADE
);

CREATE SEQUENCE seq_review_comment
    START WITH 1
    INCREMENT BY 1
    NOCACHE;

CREATE OR REPLACE TRIGGER trg_seq_review_comment
BEFORE INSERT ON REVIEWS_COMMENTS
FOR EACH ROW
BEGIN
    SELECT seq_review_comment.NEXTVAL
    INTO :new.comment_id
    FROM dual;
END;
/

-- 좋아요 테이블
CREATE TABLE REVIEWS_LIKES (
    like_id NUMBER PRIMARY KEY,
    review_num NUMBER,
    user_nick VARCHAR2(100),
    CONSTRAINT fk_likes_user FOREIGN KEY (user_nick) REFERENCES USERS(user_nick),
    CONSTRAINT fk_likes_review FOREIGN KEY (review_num) REFERENCES REVIEWS_BOARD(review_num)
    ON DELETE CASCADE
);

CREATE SEQUENCE seq_like_id
START WITH 1
INCREMENT BY 1;

commit;



--DROP TABLE REVIEWS_COMMENTS;
--DROP SEQUENCE seq_review_comment;
--DROP TABLE REVIEWS_LIKES;
--DROP SEQUENCE seq_like_id;
--DROP TABLE REVIEWS_BOARD;
--DROP SEQUENCE seq_review_num;


INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '팝업스토어 첫 방문', '처음 방문한 팝업스토어에서 다양한 제품을 볼 수 있어서 좋았습니다.', NULL, NULL, 10, 2, 'user1');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '디자인이 인상적이에요', '이번 팝업스토어에서는 디자인이 특히 눈에 띄었어요.', 'design.jpg', 'design_thumbnail.jpg', 30, 5, 'user2');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '다양한 제품이 좋았어요', '한정판 제품들이 많아서 쇼핑하기가 즐거웠어요.', NULL, NULL, 50, 8, 'user3');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '직원들이 친절했어요', '직원분들이 친절해서 정말 편하게 쇼핑할 수 있었습니다.', NULL, NULL, 20, 4, 'user4');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '인상적인 경험', '팝업스토어에서의 경험이 아주 인상적이었어요. 다시 방문하고 싶어요.', NULL, NULL, 70, 10, 'user5');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '멋진 이벤트', '팝업스토어에서 진행된 이벤트가 정말 재밌었습니다.', 'event.jpg', 'event_thumbnail.jpg', 100, 20, 'user6');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '제품 품질이 훌륭해요', '판매된 제품들의 품질이 정말 좋아서 만족스러웠습니다.', 'product.jpg', 'product_thumbnail.jpg', 40, 7, 'user7');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '추천합니다', '친구들에게 추천하고 싶을 정도로 좋은 경험이었어요.', NULL, NULL, 80, 15, 'user8');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '또 방문할게요', '다음 팝업스토어도 기대됩니다! 꼭 다시 방문하고 싶어요.', NULL, NULL, 60, 12, 'user9');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '다양한 제품을 볼 수 있었어요', '여러 가지 제품을 한 자리에서 볼 수 있어 좋았습니다.', 'products.jpg', 'products_thumbnail.jpg', 120, 25, 'user10');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '환상적인 경험이었어요', '다양한 제품들과 이벤트가 있어 환상적인 경험을 했습니다.', NULL, NULL, 90, 18, 'user1');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '친절한 안내', '직원들이 상세하게 안내해줘서 매우 기분이 좋았습니다.', NULL, NULL, 70, 14, 'user2');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '독특한 제품들', '평소에 보지 못한 독특한 제품들을 많이 볼 수 있어서 좋았습니다.', 'unique_product.jpg', 'unique_product_thumbnail.jpg', 150, 30, 'user3');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '쇼핑이 즐거웠어요', '쇼핑이 너무 즐거웠고 만족스러운 경험이었습니다.', NULL, NULL, 60, 9, 'user4');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '분위기가 좋았어요', '스토어의 전반적인 분위기가 매우 좋았습니다.', 'atmosphere.jpg', 'atmosphere_thumbnail.jpg', 110, 22, 'user5');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '특별한 제품을 구매했어요', '이번 팝업스토어에서 한정판 제품을 구매하게 되어 매우 만족스럽습니다.', NULL, NULL, 130, 28, 'user6');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '다시 방문하고 싶어요', '앞으로도 팝업스토어가 열린다면 다시 방문하고 싶습니다.', NULL, NULL, 90, 16, 'user7');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '기대 이상이었어요', '정말 기대 이상으로 만족스러운 경험을 했습니다.', 'exceed.jpg', 'exceed_thumbnail.jpg', 170, 35, 'user8');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '다양한 이벤트가 재미있었어요', '팝업스토어에서 다양한 이벤트가 진행되어 재미있게 즐겼습니다.', NULL, NULL, 140, 30, 'user9');

INSERT INTO REVIEWS_BOARD (review_num, review_title, review_content, review_ofile, review_sfile, review_viewcount, review_likecount, user_nick)
VALUES (seq_review_num.NEXTVAL, '재밌는 경험이었어요', '이번 팝업스토어는 정말 재밌는 경험이었습니다. 다음에도 기대돼요.', 'fun_event.jpg', 'fun_event_thumbnail.jpg', 160, 33, 'user10');

commit;
