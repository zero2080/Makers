package com.tj.makers.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.makers.model.Cart;
import com.tj.makers.model.Porder;
import com.tj.makers.model.Product;
import com.tj.makers.service.CartService;
import com.tj.makers.service.Paging;
import com.tj.makers.service.PorderService;
import com.tj.makers.service.ProductService;

@Controller
@RequestMapping("Porder")
public class PorderController {
	@Autowired
	private PorderService pService;
	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;
	
	
	
	@RequestMapping(value="porderInsert")
	public String porderInsert(String oraddrs,String ctnum,int buy,Porder porder,Model model) {
		
		System.out.println("oraddrs:"+oraddrs);
		oraddrs = oraddrs.replace(",", "");
		porder.setOraddr(oraddrs);
		String[] temp = ctnum.split(",");
		int[] ctnums = new int[temp.length];
		for(int i = 0; i<temp.length; i++){
			ctnums[i] = Integer.parseInt(temp[i]);
			System.out.println(i+" = "+ctnums[i]);
		}
		System.out.println("넌 왜 안넘어오냐 BUY = "+buy+"oraddr = "+porder.getOraddr()+"ctnum="+ctnum);
		
		pService.porderInsert(porder);
		
		porder = pService.porderSelect(porder);
		Cart cart = new Cart();
		cart.setMid(porder.getMid());
		cart.setCtstate(0);
		int result =0 ;
		List<Cart> cartList = new ArrayList<Cart>();
		Product product = new Product();
		if(buy == 1) {
			
			cart = cartService.cartSelect(cart);
			cart.setOrnum(porder.getOrnum());
			System.out.println(cart.toString());
			result = cartService.cartOver(cart.getCtnum());
			cartList.add(cart);
			cart.setCtnum(0);		//삭제 if문을 위해 0으로 만듬
			cartService.cartDelete(cart); // 구매한 것과 같은 장바구니 상품을 지움
			System.out.println("안녕 잘가");
			int total = cart.getPcount() - cart.getCtnum();
			
			product.setPnum(cart.getPnum());
			product.setPcount(total);
			productService.changeCnt(product);
		}else {
					int total= 0;
					for (int i = 0; i < ctnums.length; i++) {
						cartList.add(cartService.cartGetToNum(ctnums[i]));
					}
					for (Cart c : cartList) {
				/* c.setCtstate(2); */
						c.setOrnum(porder.getOrnum());
						cartService.cartOver(c.getCtnum());
						total = c.getPcount()-c.getCtcount();
						product.setPnum(c.getPnum());
						product.setPcount(total);
						productService.changeCnt(product);
					}
					
					
		}
		Porder ptemp = pService.porderSelect(porder);
		
		model.addAttribute("cartList",cartList);
		model.addAttribute("pList",ptemp);
		model.addAttribute("result",result);
		return "porder/porderFin";
	}
	
	@RequestMapping(value="porderWrite") //수정
	public String porderWrite(Porder porder,Model model) {
		int result = 0;
		result = pService.porderWrite(porder);
		model.addAttribute("result",result);
		return "porder/porderView";//주문정보페이지로 가야함 수정예정
	}
	@RequestMapping(value="porderList")
	public String porderList(Porder porder,Model model,String pageNum) {
		Paging paging = new Paging(pService.porderListCnt(porder), pageNum, 5, 5);
		model.addAttribute("pList", pService.porderList(porder));
		model.addAttribute("paging",paging);
		return "porder/porderList";
	}
	@RequestMapping(value="porderView") // 주문정보페이지
	public String porderView(Porder porder,Model model) {
		Cart cart = new Cart();
		cart.setMid(porder.getMid());
		cart.setOrnum(porder.getOrnum());
		model.addAttribute("porderList", pService.porderView(porder.getOrnum()));
		model.addAttribute("cartList",cartService.cartGet(cart));
		return "porder/porderView";
	}
	
	
}
