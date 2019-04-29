package com.tj.makers.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tj.makers.model.ItemBoard;
import com.tj.makers.model.ItemColor;
import com.tj.makers.model.Items;
import com.tj.makers.service.ItemBoardService;
import com.tj.makers.service.ItemColorService;
import com.tj.makers.service.ItemsService;
import com.tj.makers.service.Paging;

@Controller
@RequestMapping("Item")
public class ItemBoardController {
	@Autowired
	private ItemBoardService bService;
	@Autowired
	private ItemsService itService;
	@Autowired
	private ItemColorService cService;
	
	@RequestMapping(value="itemBoardView")
	public String itemBoardView(int ibnum,int choose ,String insert,String pageNum,Model model) {
		//TODO 게시�? ?��?��보기
		System.out.println("아이템보드뷰 들어옴");
		ItemBoard itboard= bService.itemBoardView(ibnum);
		model.addAttribute("itcList",cService.itemColorList(ibnum));
		model.addAttribute("itbList", itboard);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("choose", choose);
		model.addAttribute("insert", insert);
		
		return "item/itemBoardView";
	}
	@RequestMapping(value="itemBoardList")
	public String itemBoardList(String pageNum,ItemBoard itemBoard, Model model) {
		System.out.println(itemBoard.getChoose());
		if(itemBoard.getInsert() == null) {
			itemBoard.setInsert("");
		}
		Paging paging = new Paging(bService.itemBoardCnt(itemBoard), pageNum, 10, 10);
		itemBoard.setStartRow(paging.getStartRow());
		itemBoard.setEndRow(paging.getEndRow());
		model.addAttribute("itbList", bService.itemBoardList(itemBoard));
		model.addAttribute("paging",paging);
		model.addAttribute("insert",itemBoard.getInsert());
		model.addAttribute("choose",itemBoard.getChoose());
		return "item/itemBoardList";
	}
	@RequestMapping(value="itemBoardWriteView")
	public String itemBoardWriteView() {
		//TODO 게시�? ?��?��보기
		return "item/itemBoardWriteView";
	}
	@RequestMapping(value="itemBoardWrite",method=RequestMethod.POST)
	public String itemBoardWrite(MultipartHttpServletRequest mRequest, ItemBoard itemBoard,Model model) {
	
			String colors = mRequest.getParameter("colorList");
			System.out.println("itemBoardModify ?��?��?��");
			String[] colorList = colors.split(",");
			
			  for (String s : colorList) { 
				  System.out.println(s); 
			  }
			  int  result = bService.itemBoardWrite(mRequest, itemBoard);
			ItemColor itc;
			int currNext= cService.chkSeq()-1; // ?��???�� �? �??��?���?
			System.out.println("currNext = "+currNext);
			int i = 0;
			if(result>0) {
				for (String clist : colorList) {
					
					itc = new ItemColor();
					itc.setIbnum(currNext);
					itc.setItcolor(clist);
					cService.itemColorWrite(itc);
					i++;
					System.out.println("?��?��?��?��?�� "+i+"�? ?���?");
					
			}
		}
		model.addAttribute("result", result);
		return "redirect:itemBoardList.do";
	}
	
	@RequestMapping(value="itemBoardModifyView")
	public String itemBoardModifyView(int ibnum,Model model,String pageNum) {
		ItemBoard itbList = bService.itemBoardView(ibnum);
		List<ItemColor> itcList = cService.itemColorList(ibnum);
		model.addAttribute("itbList",itbList);
		model.addAttribute("itcList",itcList);
		model.addAttribute("pageNum",pageNum);
		return "item/itemBoardModifyView";
	}
	@RequestMapping(value="itemBoardModify")
	public String itemBoardModify(String pageNum, MultipartHttpServletRequest mRequest, ItemBoard itemBoard,Model model) {
		
		
			int result = bService.itemBoardModify(mRequest, itemBoard);
			cService.itemColorDelete(itemBoard.getIbnum());
			
			String colors = mRequest.getParameter("colorList");
			System.out.println("itemBoardModify ?��?��?��");
			String[] colorList = colors.split(",");
			
			  for (String s : colorList) { 
				  System.out.println(s); 
			  }
			  ItemColor itc;
			  int i = 0;
			  if(result>0) {
				   
					for (String clist : colorList) {
						itc = new ItemColor();
						itc.setIbnum(itemBoard.getIbnum());
						itc.setItcolor(clist);
						cService.itemColorWrite(itc);
						i++;
						System.out.println("?��?��?��?��?�� "+i+"�? ?���?");
					}
				}
		
		model.addAttribute("result", result);
		model.addAttribute("pageNum",pageNum);
		return "forward:itemBoardList.do";
	}
	@RequestMapping(value="itemBoardFin")
	public String itemBoardFin(int ibnum,String pageNum,Model model) {
		int result=0;
		
			bService.itemBoardFin(ibnum);
			ItemBoard ib = bService.itemBoardView(ibnum);
			Items its = new Items();
			its.setIbnum(ib.getIbnum());
			its.setItname(ib.getIbtitle());
			its.setItcategory(ib.getIbcategory());
			its.setItimg(ib.getIbimg());
			result = itService.itemsWrite(its);
		
		
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("result",result);
		return "forward:itemBoardList.do";
	}
	@RequestMapping(value="itemBoardDelete")
	public String itemBoardDelete(int ibnum,Model model) {
		
		int result=0;
		
				cService.itemColorDelete(ibnum);
				itService.itemsDelete(ibnum);
				result = bService.itemBoardDelete(ibnum);
			
		model.addAttribute("result",result);
		return "forward:itemBoardList.do";
	}
	@RequestMapping(value="itemsList")
	public String itemsList(String pageNum,Items items, Model model) {
		System.out.println(items.getChoose());
		if(items.getInsert() == null) {
			items.setInsert("");
		}
		
		Paging paging = new Paging(itService.itemsCnt(items), pageNum, 20, 5);
		items.setStartRow(paging.getStartRow());
		items.setEndRow(paging.getEndRow());
		model.addAttribute("itemsList", itService.itemsList(items));
		model.addAttribute("paging",paging);
		model.addAttribute("insert",items.getInsert());
		model.addAttribute("choose",items.getChoose());
		return "item/itemsList";
	}
	@RequestMapping(value="itemsView")
	public String itemView(int itnum,int choose ,String insert,String pageNum,Model model) {
		//TODO 게시�? ?��?��보기
		
		System.out.println(itnum);
		Items items= itService.itemsView(itnum);
		System.out.println(items.getItnum());
		model.addAttribute("itcList",cService.itemColorList(items.getIbnum()));
		model.addAttribute("itemsList", items);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("choose", choose);
		model.addAttribute("insert", insert);
		
		return "item/itemsView";
	}
	

	@RequestMapping(value="itemsModifyView")
	public String itemsModifyView(int itnum,Model model,String pageNum) {
		Items itemList = itService.itemsView(itnum);
		System.out.println("modify ibnum = "+itemList.getIbnum());
		List<ItemColor> itcList = cService.itemColorList(itemList.getIbnum());
		model.addAttribute("itemList",itemList);
		model.addAttribute("itcList",itcList);
		model.addAttribute("pageNum",pageNum);
	
		return "item/itemsModifyView";
	}
	@RequestMapping(value="itemsModify")
	public String itemsModify(String pageNum, HttpServletRequest request, Items items,Model model) {
			
			cService.itemColorDelete(items.getIbnum());
			String colors = request.getParameter("colorList");
			System.out.println("itemBoardModify ?��?��?�� + colorList = "+colors);
			String[] colorList = colors.split(",");
			
			  for (String s : colorList) { 
				  System.out.println(s); 
			  }
			  ItemColor itc;
			  int i = 0;
					for (String clist : colorList) {
						itc = new ItemColor();
						itc.setIbnum(items.getIbnum());
						itc.setItcolor(clist);
						cService.itemColorWrite(itc);
						i++;
						System.out.println("?��?��?��?��?�� "+i+"�? ?���?");
					}
			
		model.addAttribute("pageNum",pageNum);
		return "forward:itemsList.do";
	}
	@RequestMapping(value="itemsDeleteAll")
	public String itemsDeleteAll(Items items,Model model,String pageNum) {
		
		int result=0;
		
		cService.itemColorDelete(items.getIbnum());
		itService.itemsDelete(items.getItnum());
		result = bService.itemBoardDelete(items.getIbnum());
			
		model.addAttribute("result",result);
		model.addAttribute("pageNum",pageNum);
		return "forward:itemsList.do";
	}
	
}
