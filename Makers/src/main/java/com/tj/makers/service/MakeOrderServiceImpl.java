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

import com.tj.makers.dao.MakeOrderDao;
import com.tj.makers.model.MakeOrder;

@Service
public class MakeOrderServiceImpl implements MakeOrderService {
	@Autowired
	MakeOrderDao moDao;
	
	@Override
	public List<MakeOrder> getMorderAllPaging(MakeOrder mo) {
		return moDao.getMorderAllPaging(mo);
	}

	@Override
	public MakeOrder getMorder(int mrnum) {
		return moDao.getMorder(mrnum);
	}

	@Override
	public int insertOrder(MultipartHttpServletRequest mRequest,MakeOrder mo) {
		String uploadPath = mRequest.getRealPath("mOrderImage/");
		String backupPath = "C:/Develop/source/makers/Makers/src/main/webapp/mOrderImage/";
		Iterator<String> params = mRequest.getFileNames();
		String mrimg = "noimage.png";
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			mrimg = mFile.getOriginalFilename();
			if(mrimg!=null && !mrimg.equals("")) {
				if(new File(uploadPath+mrimg).exists()) {
					mrimg = System.currentTimeMillis()+"_"+mrimg;
				}
				try {
					mFile.transferTo(new File(uploadPath+mrimg));
					System.out.println("serverFile : " + uploadPath+mrimg);
					System.out.println("backupFile : " + backupPath+mrimg);
					filecopy(uploadPath+mrimg,backupPath+mrimg);
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
		mo.setMrimg(mrimg);
		if(mo.getMid()==null) {
			mo.setMid("noimage.png");
		}
		if(mo.getMrcontent()==null) {
			mo.setMrcontent("");
		}
		if(mo.getMrdate()==null) {
			mo.setMrdate("");
		}
		if(mo.getMrenddate()==null) {
			mo.setMrenddate("");
		}
		if(mo.getMrimg()==null) {
			mo.setMrimg("");
		}
		if(mo.getMrtimelimit()==null) {
			mo.setMrtimelimit("");
		}
		if(mo.getMrtitle()==null) {
			mo.setMrtitle("");
		}
		return moDao.insertOrder(mo);
	}
	
	private int filecopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is= new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int)sFile.length()];
			while(true) {
				int nRead = is.read(buff);
				if(nRead == -1) {
					break;
				}
				os.write(buff,0,nRead);
			}
			isCopy=1;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(is!=null){
					is.close();
				}
				if(os!=null) {
					os.close();
				}
			}catch(Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}
	
	@Override
	public int cancelOrder(MakeOrder mo) {
		return moDao.cancelOrder(mo);
	}
	
	@Override
	public int totMorderCnt() {
		return moDao.totMorderCnt();
	}
	
	@Override
	public List<MakeOrder> myMorderList(MakeOrder mo) {
		// TODO Auto-generated method stub
		return moDao.myMorderList(mo);
	}

	@Override
	public int myCntMorder(String mid) {
		// TODO Auto-generated method stub
		return moDao.myCntMorder(mid);
	}
	
}
