package com.springstudy.jj.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.springstudy.jj.domain.Member;
import com.springstudy.jj.domain.Product;
import com.springstudy.jj.service.ProductService;

@Controller
public class ProductController {
	
    @Autowired
    private ProductService productService;
    
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@RequestMapping("myList")
	public String myList(Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("member");
		
		List<Product> myList = productService.myList(m.getId());
		
		model.addAttribute("myList", myList);
		
		return "myList";
	}
	
	@RequestMapping({"deleteProduct"})
	public String deleteBoard(HttpServletResponse response, PrintWriter out, int no, String pass) {
	productService.deleteProduct(no);
	return "redirect:productList";
	}
	
	@RequestMapping(value= {"/productList", "/list"}, method=RequestMethod.GET)
	public String productList(Model model) {
	List<Product> pList = productService.productList();
	model.addAttribute("pList", pList);
	return "productList"; 
	}
	
	@RequestMapping("productUpdate")
	public String productUpdate(Model model, int no) {
		
		Product product = productService.getProduct(no);
		
		model.addAttribute("product", product);
		
		return "productUpdate";
	}
	
	@RequestMapping(value = "/updateProcess", method = RequestMethod.POST)
    public String updateProduct(
        HttpServletRequest request, String title, String content, int price, String memberId, String regDate, int no, 
        @RequestParam(value = "file1", required = false) MultipartFile multipartFile) 
                throws IOException {   
		
		// writeTime을 현재 시간으로 설정
	    Timestamp writeTime = new Timestamp(System.currentTimeMillis());
    
    //  String to Timestamp
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        dateFormat.setLenient(false);// 날짜와 시간을 엄격하게 확인
        
        Timestamp stringToTimestamp = null;
        
        try {
            Date stringToDate = dateFormat.parse(regDate + " 00:00:00");
            stringToTimestamp = new Timestamp(stringToDate.getTime());
            System.out.println(stringToTimestamp);
        } catch (ParseException e) {
            e.printStackTrace();
        }
    	
    if (multipartFile != null && !multipartFile.isEmpty()) {
        
        // Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
        String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
        
        UUID uid = UUID.randomUUID();
        String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
        
        File file = new File(filePath, saveName);
        System.out.println("insertBoard - newName : " + file.getName());           
        
        // 업로드 되는 파일을 upload 폴더로 저장한다.
        multipartFile.transferTo(file);

        Product product = new Product();
        product.setTitle(title);
        product.setContent(content);
        product.setPrice(price);
        product.setNo(no);
        product.setFile1(saveName);
        product.setRegDate(stringToTimestamp);
        product.setMemberId(memberId);
        product.setWriteTime(writeTime);
        
        
        
        productService.updateProduct(product);
        
        System.out.println("insert No : " + product.getNo());
    } else {
        // Handle the case when no file is uploaded
        System.out.println("No file uploaded");
    }
    
    return "redirect:myList";
}
	
	@RequestMapping("productDetail")
	public String productDetail(Model model, int no) {
		
		Product product = productService.getProduct(no);
		
		model.addAttribute("product", product);
		
		return "productDetail";
	}

    @RequestMapping(value= {"/boardList", "/list"}, method=RequestMethod.GET)
    public String boardList(Model model) {
        // Service 클래스를 이용해 게시 글 리스트를 가져온다. 
        List<Product> pList = productService.productList();
        model.addAttribute("pList", pList);
        return "boardList";
    }

	    @RequestMapping(value = "/writeProcess", method = RequestMethod.POST)
	    public String insertBoard(
            HttpServletRequest request, String title, String content, int price, String memberId, String regDate, 
            @RequestParam(value = "file1", required = false) MultipartFile multipartFile) 
                    throws IOException {   
        
	    	// writeTime을 현재 시간으로 설정
	        Timestamp writeTime = new Timestamp(System.currentTimeMillis());
	    	
	    //  String to Timestamp
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        dateFormat.setLenient(false);// 날짜와 시간을 엄격하게 확인
	        
	        Timestamp stringToTimestamp = null;
	        
	        try {
	            Date stringToDate = dateFormat.parse(regDate + " 00:00:00");
	            stringToTimestamp = new Timestamp(stringToDate.getTime());
	            System.out.println(stringToTimestamp);
	        } catch (ParseException e) {
	            e.printStackTrace();
	        }
	    	
        if (multipartFile != null && !multipartFile.isEmpty()) {
            System.out.println("originName : " + multipartFile.getOriginalFilename());
            System.out.println("name : " + multipartFile.getName());

	        
            
            System.out.println(stringToTimestamp);
            System.out.println(memberId);
          
            
            // Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
            String filePath = request.getServletContext().getRealPath(DEFAULT_PATH);
            
            UUID uid = UUID.randomUUID();
            String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
            
            File file = new File(filePath, saveName);
            System.out.println("insertBoard - newName : " + file.getName());           
            
            // 업로드 되는 파일을 upload 폴더로 저장한다.
            multipartFile.transferTo(file);

            Product product = new Product();
            product.setTitle(title);
            product.setContent(content);
            product.setPrice(price);
            product.setFile1(saveName);
            product.setRegDate(stringToTimestamp);
            product.setMemberId(memberId);
            product.setWriteTime(writeTime);
            
            System.out.println("writeTime : " + writeTime);
            
            productService.insertProduct(product);
            
            System.out.println("insert No : " + product.getNo());
        } else {
            // Handle the case when no file is uploaded
            System.out.println("No file uploaded");
        }
        
        return "redirect:boardList";
    }

    
}

