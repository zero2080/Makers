package com.tj.makers.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.dao.QnADao;
import com.tj.makers.model.QnA;
@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	private QnADao qnaDao;
	@Override
	public QnA qnaView(int qnum) {
		//TODO: ?��?��보기
		return qnaDao.qnaView(qnum);
	}

	@Override
	public List<QnA> qnaList(QnA qna) {
		// TODO ?��체보�?
		return qnaDao.qnaList(qna);
	}

	@Override
	public int qnaWrite(MultipartHttpServletRequest mRequest, QnA qna) {
		//TODO: �??���?
		String uploadPath = mRequest.getRealPath("qnaImg");
		String backupPath = "C:/Develop/source/makers/Makers/src/main/webapp/qnaImg/";
		Iterator<String> params = mRequest.getFileNames();
		
		String qfile="";
		
		if(params.hasNext()) {
			String param = params.next();
			System.out.println("param : "+param);
			MultipartFile mfile = mRequest.getFile(param);
			System.out.println("mRequest ?��?��?�� ? : "+mfile.getOriginalFilename());
			qfile = mfile.getOriginalFilename();
			System.out.println("qfile = "+qfile);
			if(qfile != null&&!qfile.equals("")) {
				if((new File(uploadPath+qfile).exists())) {
					qfile= System.currentTimeMillis()+"_"+qfile;
				}
				try {
					mfile.transferTo(new File(uploadPath+qfile));
					int result = filecopy(uploadPath+qfile, backupPath+qfile);
					System.out.println(result==1?"첨�??���?":"첨�??��?��");
				}catch (Exception e) {
					System.out.println("qnaWrite error:"+e.getMessage());
				}
			}else {
				qfile="noimg.jpg";
			}
		}
		qna.setQfile(qfile);
		return qnaDao.qnaWrite(qna);
	}

	

	@Override
	public int qnaReply(MultipartHttpServletRequest mRequest, QnA qna) {
		//TODO: ?���??���?
		
		String uploadPath = mRequest.getRealPath("qnaImg");
		String backupPath = "C:/Develop/source/makers/Makers/src/main/webapp/qnaImg/";
		Iterator<String> params = mRequest.getFileNames();
		
		String qfile="";
		
		if(params.hasNext()) {
			String param = params.next();
			System.out.println("Reply?�� param : "+param);
			MultipartFile mfile = mRequest.getFile(param);
			System.out.println("mRequest ?��?��?�� ? : "+mfile.getOriginalFilename());
			qfile = mfile.getOriginalFilename();
			if(qfile != null&&!qfile.equals("")) {
				if((new File(uploadPath+qfile).exists())) {
					qfile= System.currentTimeMillis()+"_"+qfile;
				}
				try {
					mfile.transferTo(new File(uploadPath+qfile));
					int result = filecopy(uploadPath+qfile, backupPath+qfile);
					System.out.println(result==1?"첨�??���?":"첨�??��?��");
				}catch (Exception e) {
					System.out.println("qnaWrite error:"+e.getMessage());
				}
			}else {
				qfile="noimg.jpg";
				System.out.println("qfile ?��?�� noimg");
			}
		}
		qna.setQfile(qfile);
		
		return qnaDao.qnaReply(qna);
	}

	@Override
	public int qnaModify(MultipartHttpServletRequest mRequest,QnA qna) {
		//TODO: ?��?��?���?
		
		
		String uploadPath = mRequest.getRealPath("qnaImg");
		String backupPath = "C:/Develop/source/makers/Makers/src/main/webapp/qnaImg/";
		Iterator<String> params = mRequest.getFileNames();
		
		String qfile="";
		
		if(params.hasNext()) {
			String param = params.next();
			System.out.println("param : "+param);
			MultipartFile mfile = mRequest.getFile(param);
			System.out.println("mRequest ?��?��?�� ? : "+mfile.getOriginalFilename());
			qfile = mfile.getOriginalFilename();
			if(qfile != null&&!qfile.equals("")) {
				if((new File(uploadPath+qfile).exists())) {
					qfile= System.currentTimeMillis()+"_"+qfile;
				}
				try {
					mfile.transferTo(new File(uploadPath+qfile));
					int result = filecopy(uploadPath+qfile, backupPath+qfile);
					System.out.println(result==1?"첨�??���?":"첨�??��?��");
				}catch (Exception e) {
					System.out.println("qnaWrite error:"+e.getMessage());
				}
			}
		}
		qna.setQfile(qfile);
		return qnaDao.qnaModify(qna);
	}

	@Override
	public int qnaCntUp(int qnum) {
		// TODO 조회?��증�?
		return qnaDao.qnaCntUp(qnum);
	}

	@Override
	public int qnaFin(int qnum) {
		// TODO ?��료처�?
		return qnaDao.qnaFin(qnum);
	}

	@Override
	public int qnaTrans(int qnum) {
		// TODO ?���? ?��?��?�� ?��?��
		return qnaDao.qnaTrans(qnum);
	}

	@Override
	public int qnaDelete(int qnum) {
		// TODO ?��?��
		return qnaDao.qnaDelete(qnum);
	}

	@Override
	public int qnaCnt() {
		// TODO �?�??��
		return qnaDao.qnaCnt();
	}

	@Override
	public int qnaChkReply(int qgroup) {
		// TODO ?���??��?���? 체크
		return qnaDao.qnaChkReply(qgroup);
	}
	//?��?�� 카피?��주는 메소?��
	private int filecopy(String uploadPath, String backupPath) {
		
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		
		try {
			is=new FileInputStream(uploadPath);
			os = new FileOutputStream(backupPath);
			File sFile = new File(uploadPath);
			byte[] bs = new byte[(int)sFile.length()];
			while(true) {
				int nRead  = is.read(bs);
				if(nRead == -1) {
					break;
				}
				os.write(bs,0,nRead);
			}
			isCopy=1;
		} catch (Exception e) {
			System.out.println("filecopy error : "+e.getMessage());
		}finally {
			try {
				if(os != null) os.close();
				if(is != null) is.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		return isCopy;
	}

	@Override
	public int qnaSearchCnt(QnA qna) {
		
		return qnaDao.qnaSearchCnt(qna);
	}


}
