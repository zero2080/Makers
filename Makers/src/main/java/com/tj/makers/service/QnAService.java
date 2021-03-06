package com.tj.makers.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.model.QnA;

public interface QnAService {
	public QnA qnaView(int qnum);														// ??Έλ³΄κΈ°
	public List<QnA> qnaList(QnA qna);													// ? μ²΄λ³΄κΈ?(paging),κ²??,?΄κΈ?λ³΄κΈ°
	public int qnaWrite(MultipartHttpServletRequest mRequest, QnA qna);					// κΈ??°κΈ?
	public int qnaReply(MultipartHttpServletRequest mRequest, QnA qna);					// ?΅κΈ??¬κΈ?
	public int qnaModify(MultipartHttpServletRequest mRequest,QnA qna);							// ?? 
	public int qnaCntUp(int qnum);														// μ‘°ν?μ¦κ?
	public int qnaFin(int qnum);														// ?΅λ³??λ£μ²λ¦?
	public int qnaTrans(int qnum);														// ?΅λ³? ?? κΈ? ?­? (??κ°? λ³?κ²?
	public int qnaDelete(int qnum);														// ?­? 
	public int qnaCnt();																//? μ²? κΈ? κ°μ
	public int qnaChkReply(int qgroup);													// ?΅λ³? ??μ§? ??Έ
	public int qnaSearchCnt(QnA qna);
}
