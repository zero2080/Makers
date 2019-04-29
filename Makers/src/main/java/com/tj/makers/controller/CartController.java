package com.tj.makers.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tj.makers.model.Cart;
import com.tj.makers.service.CartService;
import com.tj.makers.service.Paging;

@Controller
@RequestMapping("Cart")
public class CartController {
	@Autowired
	private CartService cartService;
	
	@RequestMapping(value="cartInsert")
	public String cartInsert(Cart cart,int buy,Model model) {
		System.out.println("cartInsert까지 들어옴");
		System.out.println(cart.toString());
		cart.setCtstate(0);
		Cart temp = new Cart();
		temp = cartService.cartChk(cart);
		String url ="";
		model.addAttribute("buy",buy);
		List<Cart> cartList = new ArrayList<Cart>();
		if(temp == null) {
			cartService.cartInsert(cart);
			if(buy == 1) {						// 0 = 장바구니 담기만, 1 = 바로구매 , 2= 장바구니에서 구매
				System.out.println("temp == null / buy = 1 까지 들어옴");
				temp = cartService.cartSelect(cart);
				cartList.add(temp);
				model.addAttribute("cartList", cartList);
				model.addAttribute("buy", 1);
				url= "porder/porderInsert";
			}
		}else {
			System.out.println("temp != null 까지 들어옴");
			int ctcount = cart.getCtcount();//현재 값
			int tempcount = temp.getCtcount(); //이전값
			int total = ctcount + tempcount;	//토탈
			System.out.println("ctcount = "+ctcount+" tempcount = "+tempcount+" total = "+total);
			
			if(buy == 0) {
				if(total>temp.getPcount()) {
					temp.setCtcount(temp.getPcount());
					System.out.println("total > tempcount // "+temp.getCtcount());
				}else {
					System.out.println("total < tempcount // "+total);
					temp.setCtcount(total);
				}
				cartService.cartCountUp(temp); //수량만 업뎃
				
			}else if(buy==1) {
				cart.setCtstate(3);//임시저장
				cartService.cartInsert(cart);
				temp = cartService.cartChk(cart);
				temp.setMid(cart.getMid());
				cartList.add(temp);
				model.addAttribute("cartList", cartList);
				url= "porder/porderInsert";
			}
		}
		return url;
	}
	@RequestMapping(value="cartBuy")
	public String cartBuy(String ctnum,String mid, Model model) {
		String[] temp = ctnum.split(",");
		int[] ctnums = new int[temp.length];
		for(int i = 0; i<temp.length; i++){
			ctnums[i] = Integer.parseInt(temp[i]);
			System.out.println(i+" = "+ctnums[i]);
		}
		
		
		List<Cart> cartList = new ArrayList<Cart>();
		for (int i = 0; i < ctnums.length; i++) {
			cartList.add(cartService.cartGetToNum(ctnums[i]));
		}
		System.out.println("장바구니구매넘어감");
		int buy = 2;
		
		model.addAttribute("cartList",cartList);
		return "porder/porderInsert";
	}
	@RequestMapping(value="cartCountUp")
	public void cartCountUp(Cart cart,Model model) {
		System.out.println("들어옴");
		cartService.cartCountUp(cart);
	}
	@RequestMapping(value="cartListView")
	public String cartListView() {
		return "cart/cartView";
	}
	@RequestMapping(value="cartView")
	public String cartView(Cart cart,Model model,String pageNum) {
		cart.setCtstate(0);
		cart.setOrnum(0);
		System.out.println(cart.toString()+"pageNum="+pageNum);
		List<Cart> num3 = cartService.cartGetNum3(cart);
		int ctcount = 0;
		int orgincount = 0;
		for (Cart no3 : num3) {
			Cart temp = cartService.cartSameChk(no3);
			if(temp !=null) {
				System.out.println("temp!=null");
				ctcount = no3.getCtcount();
				orgincount = temp.getCtcount();
				int total = ctcount + orgincount;
				if(total > no3.getPcount()) {
					total = no3.getPcount();
				}
				temp.setCtcount(total);
				cartService.cartCountUp(temp);
			}else {
				cartService.cartChangeNum(no3.getCtnum());
			}
		}
		System.out.println("for over");
		cartService.cartNum3DeleteAll();
		
 		Paging paging = new Paging(cartService.cartCnt(cart), pageNum, 10, 5);
 		cart.setStartRow(paging.getStartRow());
 		cart.setEndRow(paging.getEndRow());
 		System.out.println("마지막 확인"+cart.toString());
 		List<Cart> temps = cartService.cartView(cart);
 		for (Cart c : temps) {
			System.out.println("돌고있나 : "+c.toString());
		}
 		
 		
		model.addAttribute("cartList",cartService.cartView(cart));
		model.addAttribute("paging",paging);
		return "cart/cartViewTemp";
	}

	@RequestMapping(value="cartDelete")
	public String cartDelete(Cart cart,String pageNum,Model model) {
		model.addAttribute("result",cartService.cartDelete(cart));
		model.addAttribute("pageNum",pageNum);
		return "cart/cartView";
	}
	@RequestMapping(value="cartOverView")
	public String cartOverView(Cart cart,String pageNum,Model model) {
		System.out.println("overView cart = "+cart.toString());
		Paging paging = new Paging(cartService.cartCnt(cart), pageNum, 10, 5);
		cart.setStartRow(paging.getStartRow());
		cart.setEndRow(paging.getEndRow());
		model.addAttribute("cartList",cartService.cartView(cart));
		model.addAttribute("paging",paging);
		return "cart/cartOverView";
	}
}
