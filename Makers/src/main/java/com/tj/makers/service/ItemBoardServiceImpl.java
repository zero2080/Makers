package com.tj.makers.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Iterator;
import java.util.List;

import javax.mail.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.dao.ItemBoardDao;
import com.tj.makers.model.ItemBoard;
@Service
public class ItemBoardServiceImpl implements ItemBoardService {
	@Autowired
	private ItemBoardDao itbDao;
	@Override
	public List<ItemBoard> itemBoardList(ItemBoard itemBoard) {
		// TODO Auto-generated method stub
		return itbDao.itemBoardList(itemBoard);
	}

	@Override
	public ItemBoard itemBoardView(int ibnum) {
		// TODO Auto-generated method stub
		return itbDao.itemBoardView(ibnum);
	}

	@Override
	public int itemBoardCnt(ItemBoard itemBoard) {
		// TODO Auto-generated method stub
		return itbDao.itemBoardCnt(itemBoard);
	}

	@Override
	public int itemBoardWrite(MultipartHttpServletRequest mRequest, ItemBoard itemBoard) {
		// TODO Auto-generated method stub
		String uploadPath = mRequest.getRealPath("inventory");
		String backupPath = "C:/Develop/source/makers/Makers/src/main/webapp/mOrderItem/";
		Iterator<String> params = mRequest.getFileNames();
		
		String ibimg="";
		
		if(params.hasNext()) {
			String param = params.next();
			MultipartFile mfile = mRequest.getFile(param);
			ibimg = mfile.getOriginalFilename();
			if(ibimg != null&&!ibimg.equals("")) {
				if((new File(uploadPath+ibimg).exists())) {
					ibimg= System.currentTimeMillis()+"_"+ibimg;
				}
				try {
					mfile.transferTo(new File(uploadPath+ibimg));
					int result = filecopy(uploadPath+ibimg, backupPath+ibimg);
				}catch (Exception e) {
					System.out.println("qnaWrite error:"+e.getMessage());
				}
			}else {
				ibimg="noimg.jpg";
			}
		}
		itemBoard.setIbimg(ibimg);
		
		return itbDao.itemBoardWrite(itemBoard);
	}

	@Override
	public int itemBoardModify(MultipartHttpServletRequest mRequest, ItemBoard itemBoard) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
				String uploadPath = mRequest.getRealPath("inventory");
				String backupPath = "C:/Develop/source/makers/Makers/src/main/webapp/mOrderItem/";
				Iterator<String> params = mRequest.getFileNames();
				
				String ibimg="";
				
				if(params.hasNext()) {
					String param = params.next();
					MultipartFile mfile = mRequest.getFile(param);
					ibimg = mfile.getOriginalFilename();
					if(ibimg != null&&!ibimg.equals("")) {
						if((new File(uploadPath+ibimg).exists())) {
							ibimg= System.currentTimeMillis()+"_"+ibimg;
						}
						try {
							mfile.transferTo(new File(uploadPath+ibimg));
							int result = filecopy(uploadPath+ibimg, backupPath+ibimg);
						}catch (Exception e) { }
					}else {
						ibimg="";
					}
				}
				itemBoard.setIbimg(ibimg);
				
		return itbDao.itemBoardModify(itemBoard);
	}

	@Override
	public int itemBoardFin(int ibnum) {
		// TODO Auto-generated method stub
		return itbDao.itemBoardFin(ibnum);
	}

	@Override
	public int itemBoardTrans(int ibnum) {
		// TODO Auto-generated method stub
		return itbDao.itemBoardTrans(ibnum);
	}

	@Override
	public int itemBoardDelete(int ibnum) {
		// TODO Auto-generated method stub
		return itbDao.itemBoardDelete(ibnum);
	}
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
}
