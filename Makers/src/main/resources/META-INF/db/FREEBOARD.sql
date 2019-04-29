------------------------------------------------------------ FREEBOARD
SELECT * FROM MEMBER;
SELECT * FROM FREEBOARD;


------------------------------------------------------------ 글쓰기
--자유게시판 글쓰기
INSERT INTO FREEBOARD (FBNUM, MID, FBCATEGORY, FBTITLE, FBCONTENT, 
                      FBFILE, FBDATE, FBREADCOUNT, FBIP)
        VALUES (FREEBOARD_SEQ.NEXTVAL, 'dltpwjd1218@naver.com', 'FREE', 'FREE1', 'FBCONTENT1', 
                      'NOIMG.JPG', SYSDATE, 0, '192.168.10.2');
--공지게시판 글쓰기
INSERT INTO FREEBOARD (FBNUM, MID, FBCATEGORY, FBTITLE, FBCONTENT, 
                FBFILE, FBDATE, FBREADCOUNT, FBIP)
        VALUES (FREEBOARD_SEQ.NEXTVAL, 'admin', 'NOTICE', 'NOTICE3', 'NOTICE3', 
                       'NOIMG.JPG', SYSDATE, 0, '192.168.90.1');


------------------------------------------------------------ 글목록
-- 자유글
SELECT * FROM ( SELECT ROWNUM RN, FB.* FROM (SELECT * FROM FREEBOARD ORDER BY FBNUM DESC) FB ) WHERE FBCATEGORY='FREE' AND RN BETWEEN 1 AND 10;

-- 공지글
SELECT * FROM ( SELECT ROWNUM RN, FB.* FROM (SELECT * FROM FREEBOARD ORDER BY FBNUM DESC) FB ) WHERE FBCATEGORY='NOTICE' AND RN BETWEEN 1 AND 3;

SELECT * FROM ( SELECT ROWNUM RN, FB.* FROM (SELECT * FROM FREEBOARD WHERE FBCATEGORY='NOTICE' ORDER BY FBNUM DESC) FB ) WHERE RN BETWEEN 1 AND 3;

select * from message;


SELECT * FROM ( SELECT ROWNUM RN, FB.* FROM (SELECT * FROM FREEBOARD WHERE FBCATEGORY='FREE' ORDER BY FBNUM DESC) FB ) WHERE RN BETWEEN  1  AND 10;
------------------------------------------------------------ 글 갯수
SELECT COUNT(*) FROM FREEBOARD;

------------------------------------------------------------ 조회수+1
UPDATE FREEBOARD SET FBREADCOUNT = FBREADCOUNT + 1 WHERE FBNUM = 1;

------------------------------------------------------------ 글 상세정보
SELECT FB.* FROM FREEBOARD FB, MEMBER M WHERE FB.MID = M.MID AND FBNUM = 1;

SELECT * FROM FREEBOARD WHERE  FBNUM = 1;

------------------------------------------------------------ 글 수정하기
UPDATE FREEBOARD SET FBTITLE = '수정글',
                                           FBCONTENT = '수정글본문',
                                           FBFILE = 'NOIMG.JPG',
                                           FBDATE = SYSDATE
                              WHERE FBNUM = 1;

------------------------------------------------------------ 글 삭제하기
DELETE FROM FREEBOARD WHERE FBNUM=7;


COMMIT;











BEGIN
FOR i IN 1..120 LOOP
INSERT INTO FREEBOARD (FBNUM, MID, FBCATEGORY, FBTITLE, FBCONTENT,  FBFILE, FBDATE, FBREADCOUNT, FBIP)
VALUES (FREEBOARD_SEQ.NEXTVAL, 'dltpwjd1218@naver.com', 'FREE', CONCAT('FREE제목', i), CONCAT('FREE본문', i), 'NOIMG.JPG', SYSDATE, 0,  '192.168.10.2');
END LOOP;
END;


INSERT INTO FREEBOARD (FBNUM, MID, FBCATEGORY, FBTITLE, FBCONTENT, 
                      FBFILE, FBDATE, FBREADCOUNT, FBIP)
        VALUES (FREEBOARD_SEQ.NEXTVAL, 'dltpwjd1218@naver.com', 'FREE', 'FREE1', 'FBCONTENT1', 
                      'NOIMG.JPG', SYSDATE, 0, '192.168.10.2');








