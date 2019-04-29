SELECT * FROM MEMBER;
SELECT * FROM FREEBOARD;
DROP TABLE FREEBOARD;
DROP TABLE FBCOMMENT;

------------------------------------------------------------ FBCOMMENT
SELECT * FROM FBCOMMENT;

------------------------------------------------------------ 댓글쓰기
INSERT INTO FBCOMMENT (FBCNUM, MID, FBNUM, FBCGROUP, FBCSTEP, FBCDATE, FBCCONTENT) 
        VALUES (FBCOMMENT_SEQ.NEXTVAL, 'dltpwjd1218@naver.com', 140, FBCOMMENT_SEQ.CURRVAL, 0, SYSDATE, '페이징테스트');
        
------------------------------------------------------------ 위 댓글에 대한 답변댓글
INSERT INTO FBCOMMENT (FBCNUM, MID, FBNUM, FBCGROUP, FBCSTEP, FBCDATE, FBCCONTENT) 
        VALUES (FBCOMMENT_SEQ.NEXTVAL, 'dltpwjd1218@naver.com', 140, FBCOMMENT_SEQ.CURRVAL, 1, SYSDATE, '댓글1의 답변4');
        
INSERT INTO FBCOMMENT (FBCNUM, MID, FBNUM, FBCGROUP, FBCSTEP, FBCDATE, FBCCONTENT) 
        VALUES (FBCOMMENT_SEQ.NEXTVAL, 'dltpwjd1218@naver.com', 140, FBCOMMENT_SEQ.CURRVAL, 2, SYSDATE, '댓글1의 답변');

------------------------------------------------------------ 위 글에 대한 두번째 답변댓글 (댓글의 댓글까지만)
------------------------------ STEP A
UPDATE FBCOMMENT SET FBCSTEP = FBCSTEP+1 WHERE FBCGROUP = 24 AND FBCSTEP > 0;
------------------------------ 두번째 답변댓글
INSERT INTO FBCOMMENT (FBCNUM, MID, FBNUM, FBCGROUP, FBCSTEP, FBCDATE, FBCCONTENT) 
        VALUES (FBCOMMENT_SEQ.NEXTVAL, 'dltpwjd1218@naver.com', 140, FBCOMMENT_SEQ.CURRVAL, 1, SYSDATE, '댓글1의 답변의 답변');

------------------------------------------------------------ 댓글목록
SELECT * FROM ( SELECT ROWNUM RN, FBC.* FROM ( SELECT * FROM FBCOMMENT ORDER BY FBCGROUP, FBCSTEP) FBC ) WHERE RN BETWEEN 1 AND 4;

SELECT * FROM ( SELECT ROWNUM RN, FBC.* FROM ( SELECT * FROM FBCOMMENT WHERE FBNUM = 140 ORDER BY FBCGROUP, FBCSTEP) FBC )
                WHERE RN BETWEEN 1 AND 10;

SELECT * FROM FBCOMMENT WHERE FBNUM = 46  ORDER BY FBCGROUP, FBCSTEP;

------------------------------------------------------------ 댓글 갯수
SELECT COUNT(*) FROM FBCOMMENT WHERE FBNUM='46';

------------------------------------------------------------ 댓글 수정하기 (안함)
UPDATE FBCOMMENT SET FBCCONTENT = '46번글의 댓글' WHERE FBNUM = 2;
UPDATE FBCOMMENT SET FBNUM = '46' WHERE FBNUM = 2;

------------------------------------------------------------ 댓글 삭제하기
DELETE FROM FBCOMMENT WHERE FBNUM='120';


COMMIT;