package com.tj.makers.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.dao.MemberDao;
import com.tj.makers.model.Member;

@Service
public class MemberInfoServiceImpl implements MemberInfoService {
	@Autowired
	private MemberDao memberDao;
	@Override
	public int updatetempPw(Member member) {
		return memberDao.updatetempPw(member);
	}
	
	@Override
	public int updateMemberInfo(MultipartHttpServletRequest mRequest, Member member) {
		String uploadPath = mRequest.getRealPath("memberImg/");
		String backupPath = "C:/Develop/source/makers/Makers/src/main/webapp/memberImg/";
		Iterator<String> params = mRequest.getFileNames();
		String mimg = "";
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mFile = mRequest.getFile(param);
			mimg = mFile.getOriginalFilename();
			if(mimg!=null && !mimg.equals("")) {
				System.out.println("mimg가 널이 아님");
				if(new File(uploadPath+mimg).exists()) {
					mimg = System.currentTimeMillis()+"_"+mimg;
				}
				try {
					mFile.transferTo(new File(uploadPath+mimg));
					System.out.println("serverFile : " + uploadPath+mimg);
					System.out.println("backupFile : " + backupPath+mimg);
					filecopy(uploadPath+mimg,backupPath+mimg);
					member.setMimg(mimg);
				}catch(Exception e) {
					System.out.println(e.getMessage());
				}
			}else {
				System.out.println("mimg가 널임");
				member.setMimg("noimage.png");
			}
		}
		
		String mpwChk = (String)mRequest.getParameter("mpwChk");
		if(mpwChk!=null) {
			member.setMpw(mpwChk);
		}
		
		if(member.getMaddr()==null) {
			member.setMaddr(" ");
		}
		if(member.getMphone()==null) {
			member.setMphone(" ");
		}
		if(member.getMbank()==null) {
			member.setMbank(" ");
		}
		if(member.getMaccount()==null) {
			member.setMaccount(" ");
		}
		if(member.getMacname()==null) {
			member.setMacname(" ");
		}
		System.out.println(member.toString());
		return memberDao.updateMemberInfo(member);
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
	public int quitMember(Member member) {
		return memberDao.quitMember(member);
	}
}
