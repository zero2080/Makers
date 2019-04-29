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

import com.tj.makers.dao.FreeBoardDao;
import com.tj.makers.model.FreeBoard;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {

	@Autowired
	private FreeBoardDao freeboardDao;

//////////////////////////////////////////////////////////////////////////////

	@Override
	public int fbWrite(MultipartHttpServletRequest mRequest, FreeBoard freeboard) {

		String uploadPath = mRequest.getRealPath("freeboardFileUpload/");
		String backupPath = "C:/Develop/source/makers/Makers/src/main/webapp/freeboardFileUpload/";
		Iterator<String> params = mRequest.getFileNames();
		String fbfile = "noimage.png";

		if (params.hasNext()) {
			String param = params.next();
			MultipartFile fbfiles = mRequest.getFile(param);
			fbfile = fbfiles.getOriginalFilename();
			if (fbfile != null && !fbfile.equals("")) {
				if (new File(uploadPath + fbfile).exists()) {
					fbfile = System.currentTimeMillis() + "_" + fbfile;
				}
				try {
					fbfiles.transferTo(new File(uploadPath + fbfile));
					System.out.println("serverFile : " + uploadPath + fbfile);
					System.out.println("backupFile : " + backupPath + fbfile);
					filecopy(uploadPath + fbfile, backupPath + fbfile);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
		freeboard.setFbfile(fbfile);
		freeboard.setFbtitle(mRequest.getParameter("fbtitle"));
		freeboard.setFbcategory(mRequest.getParameter("fbcategory"));

		String fbcontent = mRequest.getParameter("fbcontent");
		if (fbcontent == null) {
			fbcontent = "";
		}
		freeboard.setFbcontent(fbcontent);
		return freeboardDao.fbWrite(freeboard);
	}

	private int filecopy(String serverFile, String backupFile) {
		int isCopy = 0;
		FileInputStream is = null;
		FileOutputStream os = null;
		try {
			is = new FileInputStream(serverFile);
			os = new FileOutputStream(backupFile);
			File sFile = new File(serverFile);
			byte[] buff = new byte[(int) sFile.length()];
			while (true) {
				int nRead = is.read(buff);
				if (nRead == -1) {
					break;
				}
				os.write(buff, 0, nRead);
			}
			isCopy = 1;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (is != null) {
					is.close();
				}
				if (os != null) {
					os.close();
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return isCopy;
	}

//////////////////////////////////////////////////////////////////////////////

	@Override
	public List<FreeBoard> fbList(FreeBoard freeboard) {
		return freeboardDao.fbList(freeboard);
	}

	@Override
	public List<FreeBoard> ntList(FreeBoard freeboard) {
		return freeboardDao.ntList(freeboard);
	}

	@Override
	public int fbCount() {
		return freeboardDao.fbCount();
	}

	@Override
	public int fbReadcountUp(int fbnum) {
		return freeboardDao.fbReadcountUp(fbnum);
	}

	@Override
	public FreeBoard fbContentRead(FreeBoard freeboard) {
		return freeboardDao.fbContentRead(freeboard);
	}

	// TODO modify
	@Override
	public int fbModify(MultipartHttpServletRequest mRequest, FreeBoard freeboard) {

		String uploadPath = mRequest.getRealPath("freeboardFileUpload/");
		String backupPath = "C:/Develop/source/makers/Makers/src/main/webapp/freeboardFileUpload/";
		Iterator<String> params = mRequest.getFileNames();
		String fbfile = "noimage.png";

		if (params.hasNext()) {
			String param = params.next();
			MultipartFile fbfiles = mRequest.getFile(param);
			fbfile = fbfiles.getOriginalFilename();
			if (fbfile != null && !fbfile.equals("")) {
				if (new File(uploadPath + fbfile).exists()) {
					fbfile = System.currentTimeMillis() + "_" + fbfile;
				}
				try {
					fbfiles.transferTo(new File(uploadPath + fbfile));
					System.out.println("serverFile : " + uploadPath + fbfile);
					System.out.println("backupFile : " + backupPath + fbfile);
					filecopy(uploadPath + fbfile, backupPath + fbfile);
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
		freeboard.setFbfile(fbfile);
		freeboard.setFbtitle(mRequest.getParameter("fbtitle"));
		freeboard.setFbcategory(mRequest.getParameter("fbcategory"));

		String fbcontent = mRequest.getParameter("fbcontent");
		if (fbcontent == null) {
			fbcontent = "";
		}
		freeboard.setFbcontent(fbcontent);
		System.out.println(freeboard.toString());
		int result = freeboardDao.fbModify(freeboard);
		return result;
	}

	/////////////////////////////////////////////

	@Override
	public int fbDelete(FreeBoard freeboard) {
		return freeboardDao.fbDelete(freeboard);
	}

}
