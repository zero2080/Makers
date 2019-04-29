package com.tj.makers.dao;


import java.util.List;

import com.tj.makers.model.QnA;

public interface QnADao {
	public QnA qnaView(int qnum);					// ?ƒ?„¸ë³´ê¸°
	public List<QnA> qnaList(QnA qna);				// ? „ì²´ë³´ê¸?(paging),ê²??ƒ‰,?‚´ ê¸?ë³´ê¸°
	public int qnaWrite(QnA qna);					// ê¸??“°ê¸?
	public int qnaReply(QnA qna);					// ?‹µê¸??‹¬ê¸?
	public int qnaModify(QnA qna);					// ?ˆ˜? •
	public int qnaCntUp(int qnum);					// ì¡°íšŒ?ˆ˜ì¦ê?
	public int qnaFin(int qnum);					// ?‹µë³??™„ë£Œì²˜ë¦?
	public int qnaTrans(int qnum);					// ?‹µë³? ?ˆ?Š” ê¸? ?‚­? œ(?ƒ?ƒœê°? ë³?ê²?
	public int qnaDelete(int qnum);					// ?‚­? œ
	public int qnaCnt();							//? „ì²? ê¸? ê°œìˆ˜
	public int qnaChkReply(int qgroup);				// ?‹µë³? ?ˆ?Š”ì§? ?™•?¸
	public int qnaSearchCnt(QnA qna);				// ê²??ƒ‰?‹œ ê¸? ê°œìˆ˜
}
