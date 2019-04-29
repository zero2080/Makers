package com.tj.makers.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.makers.model.MakeOrder;
import com.tj.makers.model.Product;
import com.tj.makers.service.Paging;
import com.tj.makers.service.ProductService;

@Controller
@RequestMapping("Product")
public class ProductController {
	@Autowired
	private ProductService pService;
	
	
	@RequestMapping(value="productList")
	public String productList(String pageNum,Product product, Model model) {
		//TODO 리스?��보기
		Paging paging = new Paging(pService.productCnt(), pageNum, 20, 5);
		System.out.println(paging.toString());
		product.setStartRow(paging.getStartRow());
		product.setEndRow(paging.getEndRow());
		model.addAttribute("pList", pService.productList(product));
		model.addAttribute("paging",paging);
		return "product/productList";
	}
	
	@RequestMapping(value="productView")
	public String productView(Product product , Model model,String pageNum) {
		//TODO ?��?��?��?���?�?�?
		Product pDto = pService.productView(product);
		model.addAttribute("pList", pDto);
		pService.CntUp(product.getPnum());
		model.addAttribute("pageNum",pageNum);
		return "product/productView";
	}
	
	@RequestMapping(value="productWriteView")
	public String productWriteView(MakeOrder mo,String pageNum,Model model) {
		//TODO ?��?��?��?���?�?�?
		model.addAttribute("mo",mo);
		model.addAttribute("pageNum", pageNum);
		return "product/productWriteView";
	}
	
	@RequestMapping(value="productWrite")
	public String productWrite(Product product,Model model) {
		//TODO ?��?��?���?
		model.addAttribute("result", pService.productWrite(product));
		return "redirect:productList.do";
	}
	
	@RequestMapping(value="productModifyView")
	public String productModifyView(Product product,String pageNum,Model model) {
		//TODO ?��?��?��?���?�?�?
		Product pDto = pService.productView(product);
		model.addAttribute("pList", pDto);
		model.addAttribute("pageNum",pageNum);
		return "product/productModifyView";
	}
	@RequestMapping(value="productModify")
	public String productModify(Product product,String pageNum,Model model) {
		//TODO ?��?��?���?
		System.out.println("---");
		System.out.println(product.getPcontent());
		if(product.getPcontent().trim() == "") {
			product.setPcontent(null);
			System.out.println("?��");
		}
		model.addAttribute("result", pService.productModify(product));
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("product", product);
		return "forward:productMView.do";
	}
	@RequestMapping(value="productMView")
	public String productMView(Product product,String pageNum,Model model) {
		//TODO ?��?��?��?���?�?�?
		Product pDto = pService.productView(product);
		model.addAttribute("pList", pDto);
		model.addAttribute("pageNum",pageNum);
		return "product/productView";
	}
	@RequestMapping(value="productChangeCnt")
	public String productChangeCnt(Product product,Model model) {
		//TODO ?���? ?��?��
		model.addAttribute("result", pService.changeCnt(product));
		return "";//?��중에 마이?��?���? ?�� ?��매�?리에?�� ajax�? 바꾸�? 처리?��?��?��
	}
	@RequestMapping(value="productDelete")
	public String productDelete(Product product,String pageNum , Model model) {
		//TODO ?��?��
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("result", pService.productDelete(product.getPnum()));
		return "forward:productList.do";
	}
	@RequestMapping(value="productTrans")
	public String productTrans(Product product,String pageNum , Model model) {
		//TODO ?��?��
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("result", pService.productTrans(product.getPnum()));
		return "forward:productList.do";
	}
	
}
